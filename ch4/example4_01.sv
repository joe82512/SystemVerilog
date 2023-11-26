// Code your design here

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



module test (input logic[1:0] grant,
             output logic[1:0] request,
             output logic rst,
             input logic clk);

  initial begin
    rst = 0; // rst 拉到 test內避免驅動衝突
    @(posedge clk) request <= 2'b01;
    $display("@%0t: Drove req=01", $time);
    repeat (2) @(posedge clk);
    if (grant !== 2'b01) //位元相等判斷要用!== , != 會把2'bxx視為 pass
      $display("@%0t: a1: grant != 2'b01", $time);
    // ...
    $finish;
  end
  
endmodule



module top;
  logic[1:0] grant, request;
  bit clk,rst;

  always #5 clk = ~clk;
  arb_port a1 (grant, request, rst, clk);
  test t1 (grant, request, rst, clk);
  
  initial begin
    // Initialize clock and finish simulation as needed
    clk = 0;
    #100;
    // rst = 1; //Remove, 驅動衝突(output)
    $finish;
  end
endmodule
