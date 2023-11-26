`ifndef DRIVER__SV //避免重載
`define DRIVER__SV

`include "transcation.sv"

//==================== Driver ====================
typedef class Driver_cbs; //Driver跟Driver_cbs有循環關係!!!
class Driver;
    mailbox gen2drv;	//mailbox from generator
    event drv2gen;	    //event if generator done
    vUtopiaRx Rx;	    //virtual interface
    Driver_cbs cbsq[$]; //callback deque
    int PortID;
    
    extern function new(input mailbox gen2drv,
                        input event drv2gen, 
                        input vUtopiaRx Rx,
                        input int PortID);
    extern task run();
    extern task send (input UNI_cell c);
endclass:Driver

//建構子
function Driver::new(input mailbox gen2drv,
                    input event drv2gen,
                    input vUtopiaRx Rx,
                    input int PortID);
    this.gen2drv = gen2drv;
    this.drv2gen = drv2gen;
    this.Rx      = Rx;
    this.PortID  = PortID;
endfunction:new 

//從generator傳遞task給DUT: run+send
//run, 執行driver
task Driver::run();
    UNI_cell c;
    bit drop = 0;

    //初始化端口
    Rx.cbr.data  <= 0;
    Rx.cbr.soc   <= 0;
    Rx.cbr.clav  <= 0;

    forever begin
        gen2drv.peek(c); //從mailbox取得cell
        
        begin: Tx
            foreach (cbsq[i]) begin
                cbsq[i].pre_tx(this, c, drop);
	            if (drop) disable Tx; //不發送cell
            end

            c.display($sformatf("@%0t: Drv%0d: ", $time, PortID));
            send(c);

            foreach (cbsq[i])
	            cbsq[i].post_tx(this, c); //發送cell後的callback
        end //Tx

        gen2drv.get(c); //從mailbox取出
        -> drv2gen;     //通知generator處理完畢的事件
    end
endtask:run

//send, 把cell送給DUT
task Driver::send(input UNI_cell c);
    ATMCellType Pkt;

    c.pack(Pkt);
    $write("Sending cell: ");
    foreach (Pkt.Mem[i])
        $write("%x ", Pkt.Mem[i]);
    $display;

    //掃整個cell
    @(Rx.cbr);
    Rx.cbr.clav <= 1;
    for (int i=0; i<=52; i++) begin
        //等待enable
        while (Rx.cbr.en===1'b1) @(Rx.cbr);

        //開始, 發送byte 0
        Rx.cbr.soc  <= (i==0);
        Rx.cbr.data <= Pkt.Mem[i];
        @(Rx.cbr);
    end

    //停止
    Rx.cbr.soc  <= 'z;
    Rx.cbr.data <= 8'bx;
    Rx.cbr.clav <= 0;
endtask:send



//==================== Driver_cbs ====================
// typedef class Driver;
class Driver_cbs;
    virtual task pre_tx(input Driver drv,
                        input UNI_cell c,
                        inout bit drop); //drop 是 inout
    endtask:pre_tx

    virtual task post_tx(input Driver drv,
                        input UNI_cell c);
    endtask:post_tx
endclass:Driver_cbs

`endif //DRIVER__SV