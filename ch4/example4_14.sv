// Code your design here

/* 
  激勵時序: 用clk控制同步訊號的時序
*/

interface arb_if (input bit clk);
  logic[1:0] grant,request;
  logic rst;
  
  // clk 控制
  clocking cb @(posedge clk); //定義為上沿 ,@(clk) 雙沿
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
  always@(posedge arbif.rst) begin
    if (arbif.rst)
      arbif.grant<=2'b00;
    // else
    //   ...
  end
  
endmodule
    
    
module test (arb_if.TEST arbif);
  initial begin
    arbif.cb.request <= 0;
    repeat(2) begin
      @arbif.cb;  //等待時鐘
      arbif.cb.request<=2'b01;
      $display("@%0t:grant=%b",$time,arbif.cb.grant);
    end
  end
  
endmodule
    

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
    @5:grant=xx   -> repeat 1: 5
    @15:grant=xx  -> repeat 2: 5+1*10=15
  */
endmodule