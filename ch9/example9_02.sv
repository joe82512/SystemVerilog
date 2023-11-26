// Code your design here

/* 
  (1)改用Mentor Questa 2021.3 + run.do
  (2)$stop停止當前的範例, 用$finish會導致 report 還沒產就結束整個仿真
  (3)拉長仿真次數也許可以提高覆蓋率
*/

interface busifc (input bit clk);
  logic[31:0] data;
  logic[ 2:0] port;

  clocking cb @(posedge clk);
    output data, port;
  endclocking
  
  modport TB(clocking cb);
endinterface

program automatic test(busifc.TB ifc);
  class Transaction;
    rand bit [31:0] data;
    rand bit [ 2:0] port; // 8 ports
  endclass
  Transaction tr;
  
  covergroup CovPort;
    coverpoint tr.port; // Measure coverage
  endgroup
  CovPort ck;

  initial begin
    tr = new();
    ck = new(); //實例化
    repeat (32) begin
      assert(tr.randomize);
      ifc.cb.port <= tr.port;
      ifc.cb.data <= tr.data;
      ck.sample(); // Gather coverage
      @ifc.cb;
    end
    $display ("Coverage = %.2f%%", ck.get_coverage());
    $stop; //不能用$finish, 否則report出不來
  end
endprogram

module top;
  bit clk;
  always #5 clk = !clk;
  
  busifc ifc(clk);
  test t1(ifc);
endmodule:top