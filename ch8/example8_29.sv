// Code your design here

/*
  callbacks: 預先埋好的除錯函數 -> 具插拔性
  (1)callbacks設為virtual class,
     但不能用pure vitual func,
     因為func不是每次都會用到!!!
  (2)在test中注入不同的自定義callback
*/

class Transaction;
  rand bit [31:0] src, dst, data[8];
  bit [31:0] crc;
  
  virtual function void calc_crc;
    crc = src ^ dst ^ data.xor;
  endfunction
endclass

function void transmit(Transaction tr);
  $display("Tr: src=%h, dst=%h, crc=%h", tr.src, tr.dst, tr.crc);
endfunction

//ex8.29 callbacks模板
virtual class Driver_cbs; // virtual
  virtual task pre_tx(ref Transaction tr, ref bit drop); // not pure
    // By default, callback does nothing
  endtask
  
  virtual task post_tx(ref Transaction tr, ref bit drop); // not pure
    // By default, callback does nothing
  endtask
endclass

//ex8.31 自定義callback
class Driver_cbs_drop extends Driver_cbs;
  virtual task pre_tx(ref Transaction tr, ref bit drop);
  	// Randomly drop 1 out of every 100 transactions
  	//drop = ($urandom_range(0,99) == 0);
    drop = !drop;
    $display("pre drop = %0d", drop);
  endtask
endclass

//ex8.30
class Driver;
  bit drop;
  Transaction tr;
  mailbox agt2drv;
  Driver_cbs cbs[$]; //deque,可以有很多自訂callbacks
  
  function new(mailbox agt2drv);
  	this.agt2drv = agt2drv;
  endfunction

  task run();
    drop = 0;
    forever begin
      agt2drv.get(tr);
      foreach (cbs[i]) cbs[i].pre_tx(tr, drop);
      if (!drop) continue;
      transmit(tr);
      foreach (cbs[i]) cbs[i].post_tx(tr, drop);
    end
  endtask
endclass

//ex8.31改寫
program automatic test;
  initial begin
    Transaction tr;
    Driver drv;
    mailbox agt2drv;
    Driver_cbs_drop dcd;
    agt2drv = new(1); //定容1, 製造簡單同步
    drv = new(agt2drv);
    
    //注入自定義callback
    dcd = new();
    drv.cbs.push_back(dcd);
    
    fork
      drv.run();
      repeat(5) begin  
        tr = new();
        assert(tr.randomize());
        agt2drv.put(tr);
      end
    join_any
  end
endprogram

/*
  pre drop = 1
  Tr: src=3faa302b, dst=d8d0a714, crc=00000000
  pre drop = 0
  pre drop = 1
  Tr: src=b0e581d7, dst=ddb6f95d, crc=00000000
  pre drop = 0
  pre drop = 1
  Tr: src=791dc6de, dst=dcc28503, crc=00000000
*/