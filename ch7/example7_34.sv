// Code your design here

/*
  測試平台的mailbox(FIFO)應用: pseudo-code , compiler failed 
  完整參考 example7.48
*/

class Generator;
  Transaction tr;
  mailbox mbx;
  
  function new(mailbox mbx);
  	this.mbx = mbx;
  endfunction
  
  task run(int count);
    repeat(count) begin
      tr = new();
      assert(tr.randomize);
      mbx.put(tr); // Send out transaction
    end
  endtask
endclass

class Driver;
  Transaction tr;
  mailbox mbx;
  
  function new(mailbox mbx);
    this.mbx = mbx;
  endfunction
  
  task run(int count);
    repeat(count) begin
      mbx.get(tr); // Fetch next transaction
      @(posedge busif.cb.ack);
      bus.cb.kind <= tr.kind;
      //...
    end
  endtask
endclass

program mailbox_example(bus_if.TB bus, ...);
  mailbox mbx; // Mailbox connecting gen & drv
  Generator gen;
  Driver drv;
  int count;
  
  initial begin
    count = $unrandom_range(50);
    mbx = new();
    gen = new(mbx);
    drv = new(mbx);
    
    fork
      gen.run(count); // Spawn the generator
      drv.run(count); // Spawn the driver
    join
  end
endprogram