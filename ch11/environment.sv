`ifndef ENVIRONMENT__SV //避免重載
`define ENVIRONMENT__SV

`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "config.sv"
`include "scoreboard.sv"
`include "coverage.sv"
`include "interface.sv"
`include "cpu_driver.sv"

//==================== class ===================
typedef class Scb_Driver_cbs;   //定義於下方
typedef class Scb_Monitor_cbs;  //定義於下方
typedef class Cov_Monitor_cbs;  //定義於下方
class Environment;
    UNI_generator gen[];    //產生器
    mailbox gen2drv[];
    event drv2gen[];
    Driver drv[];           //驅動器
    Monitor mon[];          //監視器
    Config cfg;
    Scoreboard scb;         //記分板
    Coverage cov;
    virtual Utopia.TB_Rx Rx[];
    virtual Utopia.TB_Tx Tx[];
    int numRx, numTx;
    vCPU_T mif;
    CPU_driver cpu;

    extern function new (input vUtopiaRx Rx[],
                        input vUtopiaTx Tx[],
                        input int numRx, numTx,
                        input vCPU_T mif);
    extern virtual function void gen_cfg(); //產生隨機化配置
    extern virtual function void build();   //建立測試平台
    extern virtual task run();              //執行並等待模擬結束
    extern virtual function void wrap_up(); //關閉系統和產生報告
endclass:Environment



//==================== function ====================
//建構子
function Environment::new(input vUtopiaRx Rx[],
                        input vUtopiaTx Tx[],
                        input int numRx, numTx,
                        input vCPU_T mif);
    this.Rx = new[Rx.size()];
    foreach (Rx[i])
        this.Rx[i] = Rx[i];

    this.Tx = new[Tx.size()];
    foreach (Tx[i])
        this.Tx[i] = Tx[i];

    this.numRx = numRx;
    this.numTx = numTx;
    this.mif = mif;
    cfg = new(numRx, numTx);

    //$test$plusargs+$value$plusargs用於VCS, Mentor Questa無用
    if ($test$plusargs("ntb_random_seed")) begin
        int seed;
        $value$plusargs("ntb_random_seed=%d", seed);
        $display("Simulation run with random seed=%0d", seed);
    end
    else
        $display("Simulation run with default random seed");
endfunction:new

//隨機化配置 config.sv
function void Environment::gen_cfg();
    assert (cfg.randomize()); 
    cfg.display();
endfunction:gen_cfg

//建立測試平台
function void Environment::build();
    cpu = new(mif, cfg);    //cpu_driver
    gen = new[numRx];       //generator
    drv = new[numRx];       //driver
    gen2drv = new[numRx];   //mailbox
    drv2gen = new[numRx];   //event, 為了雙向同步
    scb = new(cfg);         //scoreboard
    cov = new();            //coverage

    //generator
    foreach(gen[i]) begin
        gen2drv[i] = new();
        gen[i] = new(gen2drv[i], drv2gen[i], cfg.cells_per_chan[i], i);
        drv[i] = new(gen2drv[i], drv2gen[i], Rx[i], i);
    end
    
    //monitor
    mon = new[numTx];
    foreach (mon[i])
        mon[i] = new(Tx[i],i);

    //scoreboard -> driver+monitor with callbacks
    begin
        Scb_Driver_cbs sdc = new(scb);  //connect driver
        Scb_Monitor_cbs smc = new(scb); //connect monitor
        foreach (drv[i])
            drv[i].cbsq.push_back(sdc);
        foreach (mon[i])
            mon[i].cbsq.push_back(smc);
    end

    //coverage -> monitor with callbacks
    begin
        Cov_Monitor_cbs smc = new(cov);
        foreach (mon[i])
            mon[i].cbsq.push_back(smc);
    end
endfunction:build

//Task: generator+driver+monitor
task Environment::run();
    int num_gen_running;

    cpu.run(); //初始化CPU接口, 必須優先

    num_gen_running = numRx;
    
    //為每個 RXport 啟動 generator+driver
    foreach (gen[i]) begin
        int j = i; //automatic index for swap threads
        fork
            begin
                if (cfg.in_use_Rx[j]) gen[j].run(); //等待 generator 結束
                num_gen_running--;                  //減少 driver 數
            end
            if (cfg.in_use_Rx[j]) drv[j].run();
        join_none
    end

    //為每個 TXport 啟動 monitor
    foreach (mon[i]) begin
        int j = i; //automatic index for swap threads
        fork
            mon[j].run();
        join_none
    end

    //超時等待
    fork:timeout_block
        wait(num_gen_running==0); //等待結束
        begin //或超時
            repeat(3_000) @(Rx[0].cbr); //降次數是因為EDA playground有時間限制
            $display("@%0t: %m ERROR: Generator timeout", $time);
            cfg.nErrors++;
        end
    join_any

    disable timeout_block;

    repeat(1_000) @(Rx[0].cbr); //等待數據送到 monitor & scoreboard
endtask:run

//運行後清除, 報告工作
function void Environment::wrap_up();
    $display("@%0t: End of sim, %0d errors, %0d warnings", $time, cfg.nErrors, cfg.nWarnings);
    scb.wrap_up;
    $stop; //$stop+run.do產生coverage report
endfunction:wrap_up



//==================== callbacks: scoreboard -> driver ====================
class Scb_Driver_cbs extends Driver_cbs; //繼承自driver.sv
    Scoreboard scb;

    function new(input Scoreboard scb);
        this.scb = scb;
    endfunction:new

    virtual task post_tx(input Driver drv, input UNI_cell c);
        scb.save_expected(c);
    endtask:post_tx
endclass:Scb_Driver_cbs

//==================== callbacks: scoreboard -> monitor ====================
class Scb_Monitor_cbs extends Monitor_cbs; //繼承自monitor.sv
    Scoreboard scb;

    function new(input Scoreboard scb);
        this.scb = scb;
    endfunction:new

    virtual task post_rx(input Monitor mon, input NNI_cell c);
        scb.check_actual(c, mon.PortID);
    endtask:post_rx
endclass:Scb_Monitor_cbs

//==================== callbacks: coverage -> monitor ====================
class Cov_Monitor_cbs extends Monitor_cbs; //繼承自monitor.sv
    Coverage cov;

    function new(input Coverage cov);
        this.cov = cov;
    endfunction:new

    virtual task post_rx(input Monitor mon, input NNI_cell c);
        CellCfgType CellCfg = top.squat.lut.read(c.VPI);
        cov.sample(mon.PortID, CellCfg.FWD);
    endtask:post_rx
endclass:Cov_Monitor_cbs

`endif //ENVIRONMENT__SV