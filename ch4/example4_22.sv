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
    $monitor("@%0t:req=%h",$time,arbif.request);
  end
  
endmodule
    
`timescale 1ns/1ns;
program test (arb_if.TEST arbif);
  initial begin
    #7 arbif.cb.request<=3; // 7
    #10 arbif.cb.request<=2;//17
    #8 arbif.cb.request<=1; //25
    #15 $finish; //50
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
  0(x) -> 5(x) -> 15(3) -> 25(1) -> 35(1)
  17ns驅動2 , 但 clk 拉上沿時(25ns) 正好驅動1
    @0:req=x
    @15:req=3
    @25:req=1
  */
endmodule