// Code your design here

/* 
  用 interface 定義
  (1) 必須實例化
  (2) 'include "****.sv" 要注意 interface 是否隱藏在module內
*/

interface arb_if (input bit clk); //clk也可以定義在interface內
  logic[1:0] grant,request;
  logic rst;
endinterface


// interface 連接 port(in/out)
module arb_port (output logic[1:0] grant,
                 input logic[1:0] request,
                 input logic rst,
                 input logic clk);
  
  always @(posedge clk or posedge rst) begin
    if (rst)
      grant <= 2'b00;
    //else
    //   ...
  end

endmodule



module test (arb_if arbif);
  
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



module top;
  bit clk;

  always #5 clk = ~clk;
  arb_if arbif(clk);
  arb_port a1(.grant(arbif.grant),
              .request(arbif.request),
              .rst(arbif.rst),
              .clk(clk));
  test t1 (arbif);
  
  initial begin
    // Initialize clock and finish simulation as needed
    clk = 0;
    #100;
    // rst = 1; //Remove, 驅動衝突(output)
    $finish;
  end
endmodule
