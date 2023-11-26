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

//ex8.32
class Scoreboard;
  Transaction scb[$];
  
  function void save_expect(Transaction tr);
    scb.push_back(tr);
  endfunction
  
  function void compare_actual(Transaction tr);
    int q[$];
    
    q = scb.find_index(x) with (x.src==tr.src);
    $display("src=%0d, len(q)=%0d",tr.src,q.size());
    case(q.size())
      0:$display("No match found");
      1:$display("match one!");
      //1:scb.delete(q[0]);
      default:
        $display("Error,multiple matches found!");
    endcase
  endfunction:compare_actual
endclass

//ex8.31 自定義callback
class Driver_cbs_Scoreboard extends Driver_cbs;
  Scoreboard scb;
  
  virtual task pre_tx(ref Transaction tr, ref bit drop); //灌入計分板
    scb.save_expect(tr);
  endtask

  virtual task post_tx(ref Transaction tr, ref bit drop); //比對
    scb.compare_actual(tr);
  endtask
  
  function new(Scoreboard scb);
    this.scb = scb;
  endfunction
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
      // if (!drop) continue;
      // transmit(tr);
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
    Scoreboard scb;
    Driver_cbs_Scoreboard dcs;
    agt2drv = new(1); //定容1, 製造簡單同步
    drv = new(agt2drv);
    
    //注入自定義callback
    scb = new();
    dcs = new(scb);
    drv.cbs.push_back(dcs);
    
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
  src=1068118059, len(q)=1
  match one!
  src=4286308692, len(q)=1
  match one!
  src=2967830999, len(q)=1
  match one!
  src=2978631595, len(q)=1
  match one!
  src=2031994590, len(q)=1
  match one!
*/