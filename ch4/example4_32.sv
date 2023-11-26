// Code your design here

/* 
  $root: 頂層作用域
  $unit: 要考慮編譯時用的是全局編譯還是局部編譯
*/

`timescale 1ns/1ns;
parameter int TIMEOUT = 1_000_000;
const string time_out_msg = "ERROR: Time out";
// top t1(); //VCS 不允許頂層實例化

module top;
  bit clk;
  test t1(.*);
endmodule

`define TOP $root.top
program automatic test;
  // ...
  initial begin
    // 絕對路徑
    $display("clk=%b",$root.top.clk);
    $display("clk=%b",`TOP.clk);      //必須定義TOP
    // 相對路徑
    $display("clk=%b",top.clk);
  end
endprogram:test