// Code your design here

/* 集合: 約束上下限或指定值 */

module my_random;
  class Packet;
    int lo,hi; //上下限設定
    int fib[5] = '{1,2,3,5,8}; //指定值
    // 隨機變數
    rand int c,nc;
    rand bit[6:0] b; //0~127
    rand bit[5:0] e; //0~63
    rand int f;
    // 約束
    constraint c_range {
      c inside {[lo:hi]};      //lo~hi
      !(nc inside {[lo:hi]});  //lo~hi 以外
      b inside {[$:4],[20:$]}; //0~4 or 20~127
      e inside {[$:4],[20:$]}; //0~4 or 20~63
      f inside fib;            //[1,2,3,5,8]
    }
  endclass:Packet
  
  task transmit (Packet p); //object 作為引數
    $display("c=%0d, nc=%0d, b=%0d, e=%0d, f=%0d",p.c,p.nc,p.b,p.e,p.f);
  endtask

  Packet p;
  initial begin
    p = new();
    p.lo = 5;
    p.hi = 7;
    repeat(10) begin
      assert(p.randomize()) //沒有分號
      else $fatal(0,"Packet::randomsize failed"); //停止仿真
      transmit(p);
      end
  end
endmodule;