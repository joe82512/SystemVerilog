// Code your design here

/* 
  $root: 頂層作用域
  $unit: 要考慮編譯時用的是全局編譯還是局部編譯
*/

// root.sv
`timescale 1ns/1ns;
parameter int TIMEOUT = 1_000_000;
const string time_out_msg = "ERROR: Time out";
    
module top;
  test t1();
endmodule

program automatic test;
  // ...
  initial begin
    # TIMEOUT;
    $display("%s",time_out_msg);
    $finish;
  end
endprogram:test