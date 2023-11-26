// Code your design here

/* 
  (1) iff 條件觸發
  (2) ck.start() / ck.stop()
  -> 100ns 後才開始sample
*/

interface busifc (input bit clk);
  logic[ 2:0] port;
  logic reset;
endinterface

program automatic test(busifc bus_if);
  class Transaction;
    rand bit [ 2:0] port; // 8 ports
  endclass
  Transaction tr;

  //ex9.20
  covergroup CoverPort;
    coverpoint tr.port iff (!bus_if.reset);
  endgroup
  CoverPort cp;

  //ex9.21
  covergroup CovPort;
    coverpoint tr.port;
  endgroup
  CovPort ck;

  task reset_control();
    #1ns bus_if.reset = 1;
    ck.stop();
    #100ns bus_if.reset = 0; // End of reset, start sample()
    ck.start();
  endtask

  initial begin
    tr = new();
    cp = new();
    ck = new();
    bus_if.reset = 0;
    fork
      repeat (15) begin
        assert(tr.randomize());
        @(posedge bus_if.clk);
        cp.sample();
        ck.sample();
        $display("[@%0t] port=%0d", $time, tr.port);
      end
      reset_control();
    join
    $stop();
  end
endprogram

module top;
  bit clk;
  always #5 clk = !clk;
  
  busifc bus_if(clk);
  test t1(bus_if);
endmodule:top