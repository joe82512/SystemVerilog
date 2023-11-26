// Code your design here

/* 
  assertion
*/

interface BUS (input bit clk);
  logic[1:0] grant,request;
  logic rst;
  
  //併發assert: 在整個仿真過程持續檢查
  property request_2state;
    @(posedge clk) disable iff (rst) //(1)若rst!=0則禁止使用 (2)VCS不能加分號
    $isunknown(request)==0; //確保沒有Z或X的存在
  endproperty
  assert_request_2state: assert property(request_2state);
  
  // 等待時鐘
  clocking cb @(posedge clk);
    output request;
    input grant;
  endclocking
  
  // modport 分群
  modport TEST(clocking cb,
               output rst);
  modport DUT(input request, rst,
              output grant);
    
endinterface

module clock_generator (output bit clk);
  always #5 clk = ~clk;
endmodule
    
module arb (BUS.DUT bus);
  always@(posedge bus.request or posedge bus.rst) begin
    if (bus.rst)
      bus.grant <= 2'b00;
    else
      bus.grant <= 2'b01;
  end  
endmodule

program automatic test (BUS.TEST bus);
  // ...
  initial begin
    bus.rst <= 2'b01; //rst=1 導致request_2state不觸發
    bus.cb.request <= 2'b01;
    repeat(2) @bus.cb;
    // assertion
    a1 :assert (bus.cb.grant==2'b01) //PASS
      $display("Successful");
    else                             //FAIL
      $error("Grant not asserted");
    repeat(2) @bus.cb;
    bus.rst <= 2'b00; //關閉 rst request_2state正常運作
    bus.cb.request <= 2'bxx; //觸發 request_2state
    repeat(2) @bus.cb;
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
    Grant not asserted
    "design.sv", 16: top.bus.assert_request_2state: started at 45ns failed at 45ns
        Offending '($isunknown(request) == 1'b0)'
    "design.sv", 16: top.bus.assert_request_2state: started at 55ns failed at 55ns
        Offending '($isunknown(request) == 1'b0)'
    $finish at simulation time                   55
  */
endmodule