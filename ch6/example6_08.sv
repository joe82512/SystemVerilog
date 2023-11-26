// Code your design here

/* 動態修改 weight, weight=0表示不會產生 */

module my_random;
  class BusOp;
    // 隨機變數
    typedef enum {BYTE,WORD,LWRD} length_e;
    rand length_e len;
    // 約束, 至少要有一組隨機變數
    bit[31:0] w_byte=1,w_word=3,w_lwrd=5;
    constraint c_len {
      len dist {BYTE := w_byte,
                WORD := w_word,
                LWRD := w_lwrd};
    }
  endclass:BusOp
  
  task transmit (BusOp busop);
    $display("len=%s",busop.len);
  endtask

  BusOp busop;
  initial begin
    busop = new();
    busop.w_lwrd = 0; //weight掛空 -> 不可能產生此值
    repeat(10) begin  
      assert(busop.randomize()) //沒有分號
      else $fatal(0,"BusOp::randomsize failed"); //停止仿真
      transmit(busop);
      end
  end
endmodule;