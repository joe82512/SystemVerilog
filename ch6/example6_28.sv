// Code your design here

/* 多約束塊: 選擇性開啟/關閉部分約束 */

module my_random;
  class Packet;
    rand int length;
    constraint c_short {length inside {[1:32]};}
    constraint c_long {length inside {[1000:1023]};}
  endclass:Packet
    
  task transmit (Packet p);
    $display("length=%0d",p.length);
  endtask

  Packet p;
  initial begin
    p = new();
    p.c_short.constraint_mode(0); //關閉指定約束
    repeat(10) begin
      assert(p.randomize());
      transmit(p);
    end
    $display();
    p.constraint_mode(0); //關閉所有約束
    p.c_short.constraint_mode(1); //開啟指定約束
    repeat(10) begin
      assert(p.randomize());
      transmit(p);
    end
  end
endmodule;