// Code your design here

/* 
  DUT 跟 TEST 的競爭: (1)#n延遲 (2)時間劃分區塊4.4.4
  Program block
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
  always@(posedge arbif.rst) begin
    if (arbif.rst)
      arbif.grant<=2'b00;
    // else
    //   ...
  end
  
endmodule
    

program automatic test (arb_if.TEST arbif);
  // ...
  initial begin
    arbif.rst <= 2'b01; //觸發 DUT reset
    arbif.cb.request <= 2'b01;
    $display("@%0t: Drove req=01",$time);
    repeat(2) @arbif.cb;
    if(arbif.cb.grant!=2'b01)
      //$display("@%0t: a1: grant!=2'b01",$time);
      $display("@%0t: a1: grant=%b",$time,arbif.cb.grant);
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
    @0: Drove req=01
    @15: a1: grant=00
  */
endmodule