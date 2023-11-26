// Code your design here

/* mailbox(FIFO) synch by event
  邊緣觸發跟阻塞同時發生會產生競爭 -> Bad !
*/

program automatic mbx_evt;
  mailbox mbx;
  event handshake;
  
  class Producer;
    task run();
      for (int i=1; i<4; i++) begin
        $display("@%0t: Producer: before put(%0d)", $time, i);
        mbx.put(i);
        @handshake;
        $display("@%0t: Producer: after put(%0d)", $time, i);
      end
    endtask
  endclass
  
  class Consumer;
    task run();
      int i;
      repeat (3) begin
        mbx.get(i); // Get integer from mbx
        $display("@%0t: Consumer: after get(%0d)", $time, i);
        ->handshake;
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
  @0: Producer: before put(1)
  @0: Consumer: after get(1)
  @0: Producer: after put(1)
  @0: Producer: before put(2)
  @0: Consumer: after get(2)
  @0: Producer: after put(2)
  @0: Producer: before put(3)
  @0: Consumer: after get(3)
  @0: Producer: after put(3)
*/