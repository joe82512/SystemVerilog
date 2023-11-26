// Code your design here
// execute on EDA playground + Mentor Questa
// REF: http://www.chris.spear.net/systemverilog/default.htm

`timescale 1ns/1ns
`define TxPorts 4 //發送port數目, macro定義全域
`define RxPorts 4 //接收port數目

`include "interface.sv" //cpu_ifc & Utopia
`include "LookupTable.sv"   //copy from REF
`include "utopia1_atm_rx.sv"//copy from REF
`include "utopia1_atm_tx.sv"//copy from REF

`include "squat.sv" //DUT
`include "test.sv"  //test
// `include "test26.sv" //1 cells
// `include "test27.sv" //drop, but FAIL

module top;
    parameter int NumRx = `RxPorts; //注意有`
    parameter int NumTx = `TxPorts;

    logic rst, clk; //系統clk跟Reset
    
    //simulator
    initial begin
        rst = 0; clk = 0;
        #5ns rst = 1;
        #5ns clk = 1;
        #5ns rst = 0; clk = 0;
        forever begin
            #5ns clk = ~clk;
        end
    end

    //instant
    Utopia Rx[0:NumRx-1] ();                            //NumRx 個 Lv1 Utopia Rx ports, 給"utopia1_atm_rx.sv"
    Utopia Tx[0:NumTx-1] ();                            //同理Tx ports
    cpu_ifc mif();                                      //管理Utopia,簡稱CPU
    squat #(NumRx, NumTx) squat(Rx, Tx, mif, rst, clk); //DUT
    test #(NumRx, NumTx) t1(Rx, Tx, mif, rst, clk);     //Test

endmodule:top