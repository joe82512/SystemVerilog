// Code your design here

/* 
  自定義 Bin -> 特殊分類
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
  typedef enum {INIT, DECODE, IDLE} fsmstate_t;

  class Transaction;
    rand bit [31:0] data;
    rand bit [ 2:0] port; // 8 ports

    rand fsmstate_t pstate, nstate;
  endclass
  Transaction tr;
  
  covergroup CovPort;
    //ex9.22
    EX_enum: coverpoint tr.pstate; //enum
    //ex9.24
    Flip_port1: coverpoint tr.port {
      bins t1 = (0 => 1), (0 => 2), (0 => 3); //符合的訊號變化
    }
    //ex9.25
    Flip_port2: coverpoint tr.port {
      wildcard bins even = {3'b??0}; //[XX0]
      wildcard bins odd = {3'b??1};  //[XX1]
    }
    //ex9.26 -> 書上寫錯 [6,7]改[6:7]
    Ignore_bin1: coverpoint tr.port {
      ignore_bins hi = {[6:7]}; // Ignore upper 2 bins
    }
    //ex9.27
    Ignore_bin2: coverpoint tr.port {
      option.auto_bin_max = 4; // 0:1, 2:3, 4:5, (6:7)
      ignore_bins hi = {[6:7]}; // Ignore upper 2 values
    }
    //ex9.28
    Illegal_bin: coverpoint tr.port {
      illegal_bins hi = {[6:7]}; // Give error if seen
    }
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
      $display("[@%0t] port=%0d", $time,tr.port);
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