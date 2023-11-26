// Code your design here

/* 
  cover property : assertion + event 觸發 sample
*/

interface simple_bus (input bit clock);
  logic write_ena;
endinterface

//ex9.09
module mem(simple_bus sb);
  bit [7:0] data, addr;
  event write_event;

  cover property //assertion
  (@(posedge sb.clock) sb.write_ena==1)
  -> write_event;
endmodule

//ex9.10
program automatic test(simple_bus sb);
  covergroup Write_cg @($root.top.m1.write_event);
    option.auto_bin_max = 8; //顯示方便
    coverpoint $root.top.m1.data;
    coverpoint $root.top.m1.addr;
  endgroup
  Write_cg wcg;

  initial begin
    wcg = new();
    // initial
    $root.top.m1.addr = 255; //阻塞
    $root.top.m1.data = 1;
    sb.write_ena = 0;
    repeat (8) begin
      // Apply stimulus here
      $root.top.m1.addr <= ($root.top.m1.addr >> 1);
      $root.top.m1.data <= $root.top.m1.data*2;
      // Apply stimulus here
      sb.write_ena <= 1;
      // ...
      @(posedge sb.clock);
      $display("[%0t] addr=%b / %0d, data=%0d", $time,$root.top.m1.addr,$root.top.m1.addr,$root.top.m1.data);
    end
    // #10000 $finish;
    $stop;
  end
endprogram

module top;
  bit clk;
  always #5 clk = !clk;
  
  simple_bus sb(clk);
  mem m1(sb);
  test t1(sb);
  
endmodule:top