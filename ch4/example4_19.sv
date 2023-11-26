// Code your design here

/* 
  port 同步採樣 ex4.19
  port 同步驅動 ex4.22
*/
interface arb_if (input bit clk);
  logic[1:0] grant,request;
  logic rst;
  
  // 等待時鐘
  clocking cb @(posedge clk);
    output request;
    input grant;
  endclocking
  
  // modport 分群
  modport TEST(clocking cb, //測試時序
               output rst);
  modport DUT(input request, rst,
              output grant);
    
endinterface

    
module arb (arb_if.DUT arbif);
  initial begin
    #7 arbif.grant=1;  // 7
    #10 arbif.grant=2; //17
    #8 arbif.grant=3;  //25
  end
  
endmodule
    
`timescale 1ns/1ns;
program test (arb_if.TEST arbif);
  initial begin
    $monitor("@%0t:grant=%h",$time,arbif.cb.grant);
    // $monitor(); 值發生變化時才輸出
    #50 $display("End of test");
  end
endprogram:test

    
module top;
  bit clk;

  always #5 clk = ~clk;
  arb_if arbif(clk);
  arb a1 (arbif);
  test t1 (arbif);
  
  initial begin
    clk = 0;
    #100;
    $finish;
  end
  
  /*
  0(x) -> 5(x) -> 15(1) -> 25(2) -> 35(3)
    @0:grant=x
    @15:grant=1
    @25:grant=2
    @35:grant=3
    End of test
  */
endmodule