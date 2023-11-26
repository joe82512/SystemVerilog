// Code your design here

/* ex4.43 ~ ex4.47 */

interface Rx_if (input logic clk);
  logic[7:0] data;
  logic soc,en,clav,rclk;
  
  clocking cb @(posedge clk);
    output data,soc,clav; //方向是相對測試平台的
    input en;
  endclocking:cb

  modport TB(clocking cb);
  modport DUT(output en,rclk,
              input data,soc,clav);
endinterface:Rx_if

interface Tx_if (input logic clk);
  logic[7:0] data;
  logic soc,en,clav,tclk;
  
  clocking cb @(posedge clk);
    input data,soc,en; //方向是相對測試平台的
    output clav;
  endclocking:cb

  modport TB(clocking cb);
  modport DUT(output data,soc,en,tclk,
              input clk,clav);
endinterface:Tx_if
    

module atm_router (Rx_if.DUT Rx0,Rx1,Rx2,Rx3,
                   Tx_if.DUT Tx0,Tx1,Tx2,Tx3);
  //...
endmodule

module top;
  bit clk,rst;
  always #5 clk = !clk;
  Rx_if Rx0(clk),Rx1(clk),Rx2(clk),Rx3(clk);
  Tx_if Tx0(clk),Tx1(clk),Tx2(clk),Tx3(clk);
  atm_router al (.*);
  test t1 (.*);
  
  initial begin
    #100;
    $finish; //停止仿真
  end
endmodule:top
    
program test (Rx_if.TB Rx0,Rx1,Rx2,Rx3,
              Tx_if.TB Tx0,Tx1,Tx2,Tx3,
              input logic clk,
              output logic rst);
  parameter int ATM_CELL_SIZE = 4; //設定常數值
  bit[7:0] bytes[ATM_CELL_SIZE];
  initial begin
    rst <= 1;
    Rx0.cb.data <= 0;
    //...
    receive_cell0();
    //...
  end
  
  task receive_cell0();
    @(Tx0.cb);
    Tx0.cb.clav <= 1;
    wait(Tx0.cb.soc==1);
    for (int i=0; i<ATM_CELL_SIZE; i++) begin
      wait(Tx0.cb.en==0);
      @(Tx0.cb);
      bytes[i] = Tx0.cb.data;
      @(Tx0.cb);
      Tx0.cb.clav <= 0;
    end
  endtask:receive_cell0
endprogram:test