// Code your design here

/* 
  assertion
*/

interface BUS (input bit clk);
  logic[1:0] grant,request;
  logic rst;
  
  // 等待時鐘
  clocking cb @(posedge clk);
    output request;
    input grant;
  endclocking
  
  // modport 分群
  modport TEST(clocking cb,
               output rst);
  modport DUT(input request, rst, clk,
              output grant);
    
endinterface

module clock_generator (output bit clk);
  always #5 clk = ~clk;
endmodule
    
module arb (BUS.DUT bus);
  always@(posedge bus.clk or posedge bus.rst) begin
    if (bus.rst)
      bus.grant <= 2'b00;
    else
      bus.grant <= 2'b01;
  end  
endmodule

program automatic test (BUS.TEST bus);
  // ...
  initial begin
    bus.rst <= 2'b01; //觸發 DUT reset
    bus.cb.request <= 2'b01;
    repeat(2) @bus.cb;
    // if-else
    if(bus.cb.grant!=2'b01)
      $display("Error,grant!=1");
    // assertion
    //a1 :assert (bus.cb.grant==2'b01);  //預設錯誤訊息
    a1 :assert (bus.cb.grant==2'b01)     //注意沒有;
      else $error("Grant not asserted");
  end
endprogram:test



module top;
  bit clk;
  clock_generator cg(clk);
  BUS bus(clk);
  arb a1(bus);
  test t1(bus);
  
  initial begin
    #100;
    $finish;
  end
  /*
    Error,grant!=1
    "design.sv", 48: top.t1.a1: started at 15ns failed at 15ns
        Offending '(bus.cb.grant == 2'b1)'
    Error: "design.sv", 48: top.t1.a1: at time 15 ns
    Grant not asserted
  */
endmodule