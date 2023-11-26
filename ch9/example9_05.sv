// Code your design here

/* 
  在class裡定義覆蓋率: 覆蓋率在new()裡實例化
*/

interface busifc (input bit clk);
  logic[31:0] data;
  logic[ 2:0] port;

  clocking cb @(posedge clk);
    output data, port;
  endclocking
  
  modport DUT(clocking cb);
endinterface

class Transaction;
  rand bit [31:0] data;
  rand bit [ 2:0] port; // 8 ports
endclass

//========================== Transactor ==========================
//ex9.5
class Transactor;
  Transaction tr;
  mailbox mbx_in;
  virtual busifc.DUT ifc;

  covergroup CovPort;
    coverpoint tr.port;
  endgroup

  function new(mailbox mbx_in, virtual busifc.DUT ifc);
    CovPort = new(); // Instantiate covergroup
    this.mbx_in = mbx_in;
    this.ifc = ifc;
  endfunction

  task main;
    forever begin
      // tr = mbx_in.get; // Get next transaction
      mbx_in.get(tr); //書上寫錯
      ifc.cb.port <= tr.port; // Send into DUT
      ifc.cb.data <= tr.data;
      CovPort.sample(); // Gather coverage
      @ifc.cb;
    end
  endtask
endclass

//========================== Test ==========================
program automatic test(busifc.DUT ifc);
  initial begin
    Transactor trans;
    mailbox mbx_in;
    Transaction tr;
    virtual busifc.DUT v_ifc = ifc;

    mbx_in = new(1);
    trans = new(mbx_in, v_ifc);
    fork
      repeat (32) begin
        tr = new();
        assert(tr.randomize);
        mbx_in.put(tr);
        //$display("[%0t]",$time);
      end
      trans.main();
    join_any
  end
endprogram

module top;
  bit clk;
  always #5 clk = !clk;
  
  busifc ifc(clk);
  test t1(ifc);

  initial begin
    #100;  //故意不跑完32次
    $stop; //不能用$finish
  end
endmodule:top