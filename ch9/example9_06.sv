// Code your design here

/* 
  callback : 採樣覆蓋率 -> ck.sample()
*/

//========================== Driver ==========================
class Transaction;
  rand bit [31:0] data;
  rand bit [ 2:0] port; // 8 ports
endclass

virtual class Driver_cbs; // virtual
  virtual task pre_tx(Transaction tr); // not pure
    // By default, callback does nothing
  endtask
  
  virtual task post_tx(Transaction tr); // not pure
    // By default, callback does nothing
  endtask
endclass

//ex9.7
class Driver_cbs_coverage extends Driver_cbs;
  Transaction tr;
  covergroup CovPort;
    coverpoint tr.port;
  endgroup

  function new();
    super.new();
    CovPort = new();
  endfunction
  
  virtual task post_tx(Transaction tr);
    this.tr = tr; //書上缺少
    CovPort.sample(); // Sample coverage values
  endtask
endclass

class Driver;
  Transaction tr;
  mailbox agt2drv;
  Driver_cbs cbs[$]; //deque,可以有很多自訂callbacks
  
  function new(mailbox agt2drv);
  	this.agt2drv = agt2drv;
  endfunction

  task run();
    forever begin
      agt2drv.get(tr);
      foreach (cbs[i]) cbs[i].pre_tx(tr);
      foreach (cbs[i]) cbs[i].post_tx(tr);
    end
  endtask
endclass

//========================== Test ==========================
//9.6改寫
program automatic test;
  initial begin
    Transaction tr;
    Driver drv;
    mailbox agt2drv;
    Driver_cbs_coverage dcc;
    agt2drv = new(1); //定容1, 製造簡單同步
    drv = new(agt2drv);
    
    // Create and register the coverage callback
    dcc = new();
    drv.cbs.push_back(dcc); // Put into driver’s Q
    
    fork
      drv.run();
      repeat(32) begin  
        tr = new();
        assert(tr.randomize());
        agt2drv.put(tr);
      end
    join_any
    $stop;
  end
endprogram