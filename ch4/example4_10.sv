// Code your design here

/* 
  用 interface 定義
  (1) 必須實例化
  (2) 'include "****.sv" 要注意 interface 是否隱藏在module內
*/
interface arb_if (input bit clk); //clk也可以定義在interface內
  logic[1:0] grant,request;
  logic rst;
  
  // modport 分群
  modport TEST(output request,rst,
               input grant, clk);
  modport DUT(input request, rst, clk,
              output grant);
  modport MONITOR(input request,grant,rst,clk);
  
endinterface



module arb (arb_if.DUT arbif);
  
  always@(posedge arbif.clk or posedge arbif.rst) begin
    if (arbif.rst)
      arbif.grant<=2'b00;
    // else
    //   ...
  end
  
endmodule



module test (arb_if.TEST arbif);
  
  initial begin
    arbif.rst = 0; // rst 拉到 test內避免驅動衝突
    @(posedge arbif.clk) arbif.request<=2'b01;
    $display("@%0t:Drove req=01",$time);
    repeat(2) @(posedge arbif.clk);
    if(arbif.grant !== 2'b01) //位元相等判斷要用!==
      $display("@%0t:a1:grant!=2'b01",$time);
    // ...
    $finish;
  end
  
endmodule



module monitor (arb_if.MONITOR arbif);
  
  always@(posedge arbif.request[0]) begin
    $display("@%0t: request[0] asserted",$time);
    @(posedge arbif.grant[0]);
    $display("@%0t: grant[0] asserted",$time);
  end
  
  always@(posedge arbif.request[1]) begin
    $display("@%0t: request[1] asserted",$time);
    @(posedge arbif.grant[1]);
    $display("@%0t: grant[1] asserted",$time);
  end
  
endmodule

        

module top;
  bit clk;

  always #5 clk = ~clk;
  arb_if arbif(clk);
  arb a1 (arbif);
  test t1 (arbif);
  monitor m1 (arbif);
  
  initial begin
    // Initialize clock and finish simulation as needed
    clk = 0;
    #100;
    // rst = 1; //Remove, 驅動衝突(output)
    $finish;
  end
  
  /*
    @5:Drove req=01           -> test
    @5: request[0] asserted   -> monitor
    @25:a1:grant!=2'b01       -> test , repeat 2 次posedge 5+2*10
  */
endmodule
