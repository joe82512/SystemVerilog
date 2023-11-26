// Code your design here

/* mailbox(FIFO) synch by peek()+bounded=1
  但一開始為空, 故不會阻塞;
  後續mailbox有值時才會開始阻塞, 形成同步
  -> Bad !
*/

program automatic synch_peek;
  mailbox mbx;
  
  class Producer;
    task run();
      for (int i=1; i<5; i++) begin
        $display("@%0t: Producer: before put(%0d)", $time, i);
        mbx.put(i);
      end
    endtask
  endclass
  
  class Consumer;
    task run();
      int i;
      repeat (4) begin
        mbx.peek(i); // 查看是否有值
        mbx.get(i); // Get integer from mbx
        $display("@%0t: Consumer: after get(%0d)", $time, i);
      end
    endtask
  endclass
  
  Producer p;
  Consumer c;
  
  initial begin
    // Construct mailbox, producer, consumer
    mbx = new(1); //vol=1
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
  @0: Producer: before put(1) -> 尚未阻塞
  @0: Producer: before put(2) -> 阻塞, 開始同步
  @0: Consumer: after get(1)
  @0: Consumer: after get(2)
  @0: Producer: before put(3)
  @0: Producer: before put(4)
  @0: Consumer: after get(3)
  @0: Consumer: after get(4)
*/