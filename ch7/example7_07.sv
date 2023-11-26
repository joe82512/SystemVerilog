// Code your design here

/*
  task:具備時間, 但new()中不能含有task
*/

class Packet;
  rand bit[31:0] src,dst,data[8];
  constraint c {src > 10;
                src < 15;}
endclass:Packet

class Generator;
  // Transactor that creates N packets
  task run(int n);
    Packet p;
    fork
      repeat (n) begin
        p = new();
        assert(p.randomize());
        transmit(p);
      end
    join_none
  endtask

  task transmit (input Packet p);
    $display("src=%0d",p.src);
  endtask
endclass:Generator



program test;
  Generator gen;
  initial begin
    gen = new;
    gen.run(10);
    // Start the checker, monitor, and other threads
  end
endprogram;


/* 
  src=11
  src=11
  src=13
  src=11
  src=11
  src=14
  src=11
  src=13
  src=12
  src=12
*/