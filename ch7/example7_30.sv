// Code your design here

/* semaphore(flag)
  對同一資源的訪問控制, 但可能有競爭問題:
  (1)某個時刻下put的flag比get的多
  (2)多個flag操作時 只剩一個flag卻要求多個get
  -> FIFO改善
*/

interface bus_ifc(input bit clk);
  logic[31:0] addr;

  clocking cb @(posedge clk);
    output addr;
    //...
  endclocking
  
  modport TB(clocking cb);
    modport DUT(input addr, clk);

endinterface

module driver(bus_ifc.DUT bus);
  logic[31:0] addr; // for sampling
  always@(posedge bus.clk) begin
    addr <= bus.addr;
  end  
endmodule
    
class Transaction;
  rand bit[31:0] addr;
  constraint c {addr inside {[1024:4096]};}
endclass

program automatic test(bus_ifc.TB bus);
  Transaction tr;
  semaphore sem; // Create a semaphore
  
  initial begin
    tr = new();
    assert(tr.randomize());
    $display("@%0t: addr=%0d", $time, tr.addr);
    
    sem = new(1); // Allocate with 1 key
    fork
      sequencer("A"); // Spawn two threads that both
      sequencer("B");
    join
  end
  
  task sequencer(string s);
    // Random wait, 0-9 cycles
    int cnt = 0; //show wait cycles times
    repeat($urandom%10) begin
      cnt++;
      $display("[%s]repeat_%0d", s, cnt);
      @bus.cb;
    end
    
    // Execute the transaction
    sendTrans();
    //$display("@%0t:[%s]bus.cb.addr=%0d", $time, s, d1.addr); //sample addr, 同步採樣:X
    #10 $display("@%0t:[%s]bus.cb.addr=%0d", $time, s, d1.addr); //sample addr at next clk
  endtask
  
  task sendTrans;
    sem.get(1); // Get the key to the bus
    @bus.cb;    // Drive signals onto bus
    bus.cb.addr <= tr.addr;
    //...
    sem.put(1); // Put it back when done
  endtask
  
endprogram
      
module top;
  bit clk;
  always #5 clk = !clk;
  
  bus_ifc bus(clk);
  test t1(bus);
  driver d1(bus);
  
  initial begin
    #100;
    $finish; //停止仿真
  end
endmodule:top
    
/*
  @0: addr=1669
  [A]repeat_1
  [B]repeat_1
  [A]repeat_2
  [B]repeat_2
  [A]repeat_3
  [B]repeat_3
  [A]repeat_4
  [B]repeat_4
  [A]repeat_5
  [B]repeat_5
  [B]repeat_6
  [B]repeat_7
  @65:[A]bus.cb.addr=1669
  [B]repeat_8
  @95:[B]bus.cb.addr=1669
*/