// Code your design here

/* mailbox(FIFO)
  可以放任一類型, 但最好只放同一種類型
*/
    
class Transaction;
  rand bit[31:0] addr;
  constraint c {addr inside {[1024:4096]};}
endclass

program automatic test();
  mailbox mbx;
  initial begin
    mbx = new(); //必須實例化, 預設無限大
    fork
      generator_good(5,mbx);
      driver(mbx);
    join
  end
  
  //ex7.31: 問題->指向同一個object
  task generator_bad(int n, mailbox mbx);
    Transaction t;
    t = new();
    repeat(n) begin
      assert(t.randomize());
      $display("GEN: Sending addr=%h",t.addr);
      mbx.put(t);
    end
  endtask
  
  //ex7.32: 輸出 put
  task generator_good(int n, mailbox mbx);
    Transaction t;
    repeat(n) begin
      t = new();
      assert(t.randomize());
      $display("GEN: Sending addr=%h", t.addr);
      mbx.put(t);
    end
  endtask
  
  //ex7.33: 輸入 get
  task driver(mailbox mbx);
    Transaction t;
    forever begin
      mbx.get(t);
      $display("DRV: Received addr=%h", t.addr);
    end
  endtask
  
endprogram
    
/*
  GEN: Sending addr=0000067b
  GEN: Sending addr=00000523
  GEN: Sending addr=00000bb4
  GEN: Sending addr=0000060d
  GEN: Sending addr=0000041a
  DRV: Received addr=0000067b
  DRV: Received addr=00000523
  DRV: Received addr=00000bb4
  DRV: Received addr=0000060d
  DRV: Received addr=0000041a
*/