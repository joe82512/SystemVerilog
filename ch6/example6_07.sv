// Code your design here

/* 指定隨機的機率: 約束 weight */

module my_random;
  class Packet;
    // 隨機變數
    rand int src,dst;
    // 約束, 至少要有一組隨機變數
    constraint c_dist {
      src dist {0:=40,[1:3]:=60};   //機率[40:60:60:60]
      dst dist {0:/40,[1:3]:/60};}  //機率[40:20:20:20]
  endclass:Packet
  
  task transmit (Packet p); //object 作為引數
    $display("src=%0d, dst=%0d",p.src,p.dst);
  endtask

  Packet p;
  initial begin
    p = new();
    repeat(10) begin
      assert(p.randomize()) //沒有分號
      else $fatal(0,"Packet::randomsize failed"); //停止仿真
      transmit(p);
      end
  end
endmodule;