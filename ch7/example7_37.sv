// Code your design here

/* mailbox(FIFO)
  Bounded: 固定容量, 預設為0 代表無限大
  超過容量會先阻塞, 被取走後才能再塞入
*/

`timescale 1ns/1ns
program automatic bounded;
  mailbox mbx;
  
  initial begin
    mbx = new(1); // Size = 1
    fork
      // Producer
      for (int i=1; i<4; i++) begin
        $display("@%0t: Producer: before put(%0d)", $time, i);
        mbx.put(i);
        $display("@%0t: Producer: after put(%0d)", $time, i);
      end
      
      // Consumer
      repeat(4) begin
      	int j;
        #1ns mbx.get(j); //delay
        $display("@%0t: Consumer: after get(%0d)", $time, j);
      end
    join
  end
  
endprogram
/*
  @0: Producer: before put(1)
  @0: Producer: after put(1)
  @0: Producer: before put(2) -> 被阻塞, 因為容量超過
  @1: Consumer: after get(1)  -> 先取
  @1: Producer: after put(2)  -> 再放
  @1: Producer: before put(3)
  @2: Consumer: after get(2)
  @2: Producer: after put(3)
  @3: Consumer: after get(3)
*/