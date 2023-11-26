// Code your design here

/* 
  限制Bin數 : option.auto_bin_max
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
    option.auto_bin_max = 2; // Affects port & data
    coverpoint tr.port;
    coverpoint tr.data;
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