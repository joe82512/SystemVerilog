// Code your design here

/* 
  rand/randc 定義隨變數, randc 是不重複隨機值
  randomize() 隨機化, 約束錯誤會返回0
  constraint{} 定義約束, 聲明非程序故沒有外部分號;
*/

module my_random;
  class Packet;
    // 隨機變數
    rand bit[31:0] src,dst,data[8];
    randc bit[7:0] kind;
    // 約束, 至少要有一組隨機變數
    constraint c {src > 10;
                  src < 15;} //不能寫 10<src<15, 類似C++
  endclass:Packet
  
  task transmit (Packet p); //object 作為引數
    $display("src=%0d",p.src);
  endtask

  Packet p;
  initial begin //沒有always clk, 只會產生一次
    p = new();
    assert(p.randomize()) //沒有分號
      $display("Pass");
    else begin
      $display("src Failed:%0d",p.src);
      $fatal(0,"Packet::randomsize failed"); //停止仿真
    end
    transmit(p);
  end
endmodule;