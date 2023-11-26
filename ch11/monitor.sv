`ifndef MONITOR__SV //避免重載
`define MONITOR__SV

`include "transcation.sv"

//==================== Monitor_cbs ====================
typedef class Monitor;

class Monitor_cbs;
    virtual task post_rx(input Monitor mon,
                        input NNI_cell c);
    endtask:post_rx
endclass:Monitor_cbs



//==================== Monitor ====================
// typedef class Monitor_cbs;

class Monitor;
    vUtopiaTx Tx; //連接DUT
    Monitor_cbs cbsq[$];
    int PortID;

    extern function new(input vUtopiaTx Tx, input int PortID);
    extern task run();
    extern task receive (output NNI_cell c);
endclass:Monitor

//建構子
function Monitor::new(input vUtopiaTx Tx, input int PortID);
    this.Tx     = Tx;
    this.PortID = PortID;
endfunction:new

//執行monitor
task Monitor::run();
    NNI_cell c;
        
    forever begin
        receive(c); //定義於下方
        foreach (cbsq[i])
            cbsq[i].post_rx(this, c); //接受cell後的callback
   end
endtask:run

//從DUT讀取cell, 並打包成NNI
task Monitor::receive(output NNI_cell c);
    ATMCellType Pkt;

    Tx.cbt.clav <= 1;
    while (Tx.cbt.soc !== 1'b1 && Tx.cbt.en !== 1'b0)
        @(Tx.cbt);
    
    for (int i=0; i<=52; i++) begin
        while (Tx.cbt.en !== 1'b0) @(Tx.cbt); //等待enable
        
        Pkt.Mem[i] = Tx.cbt.data;
        @(Tx.cbt);
    end

    Tx.cbt.clav <= 0;

    //解包顯示
    c = new();
    c.unpack(Pkt);
    c.display($sformatf("@%0t: Mon%0d: ", $time, PortID));
endtask:receive

`endif //MONITOR__SV