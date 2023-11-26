// Code your design here

/* mailbox(FIFO) synch by double-mailbox
  雙向mailbox -> Good !
  註: semaphore(flag) 可做為第二個mailbox, 但沒有訊息傳遞
*/

program automatic mbx_evt;
  mailbox mbx, rtn;
  
  class Producer;
    task run();
      int k; //get data
      for (int i=1; i<4; i++) begin
        $display("@%0t: Producer: before put mbx(%0d)", $time, i);
        mbx.put(i);
        $display("@%0t: Producer: after put mbx(%0d)", $time, i);
        rtn.get(k);
        $display("@%0t: Producer: after get rtn(%0d)", $time, k);
      end
    endtask
  endclass
  
  class Consumer;
    task run();
      int i; //get data
      repeat (3) begin
        $display("@%0t: Consumer: before get", $time);
        mbx.get(i); // Get integer from mbx
        $display("@%0t: Consumer: after get mbx(%0d)", $time, i);
        rtn.put(-i); //k=-i, 方便校驗
      end
    endtask
  endclass
  
  Producer p;
  Consumer c;
  
  initial begin
    // Construct mailbox, producer, consumer
    mbx = new();
    rtn = new();
    p = new();
    c = new();
    // Run the producer and consumer in parallel
    fork
      p.run();
      c.run();
    join
  end
  
endprogram
/*
  @0: Producer: before put mbx(1)
  @0: Producer: after put mbx(1)
  @0: Consumer: before get
  @0: Consumer: after get mbx(1)
  @0: Consumer: before get         -> 阻塞
  @0: Producer: after get rtn(-1)
  
  @0: Producer: before put mbx(2)
  @0: Producer: after put mbx(2)
  @0: Consumer: after get mbx(2)   <- 取值
  @0: Consumer: before get
  @0: Producer: after get rtn(-2)
  
  @0: Producer: before put mbx(3)
  @0: Producer: after put mbx(3)
  @0: Consumer: after get mbx(3)
  @0: Producer: after get rtn(-3)
*/