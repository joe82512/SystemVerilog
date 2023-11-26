// Code your design here

/* 條件約束&雙向(條件)約束, 注意約束條件要用 == 非 = */

module my_random;
  class BusOp;
    typedef enum {BYTE,WORD,LWRD} length_e;
    rand length_e len;
    typedef enum {READ,WRITE} operate;
    operate op = READ;
    bit io_space_mode = 0;
    rand bit[2:0] addr[32]; //0~7
    rand logic[15:0] r,s,t; //雙向約束

    bit[31:0] w_byte=1,w_word=3,w_lwrd=5;
    constraint c_len {
      len dist {BYTE := w_byte,
                WORD := w_word,
                LWRD := w_lwrd};
    }
    
    //條件約束
    constraint c_io {
      (io_space_mode) -> addr[31]==1'b1; //約束條件用==而非=
    }
    //條件約束
    constraint c_len_rw {
      if (op==READ)
        len inside{[BYTE:LWRD]};
      else
        len==LWRD; //用==而非=
    }
    //雙向約束
    constraint c_bidir {
      r < t;
      s == r;
      t < 30;
      s > 25;
      // s=r<t 且 [26:29]
    }
  endclass:BusOp

  BusOp busop;
  initial begin
    busop = new();
    
    repeat(5) begin  
      assert(busop.randomize());
      $display("len=%s, addr[31]=%0d", busop.len.name,busop.addr[31]);
    end
    $display();
    //條件約束
    busop.io_space_mode = 1; //設定條件
    busop.op = BusOp::WRITE;
    repeat(5) begin  
      assert(busop.randomize());
      $display("len=%s, addr[31]=%0d", busop.len.name,busop.addr[31]);
    end
    $display();
    //雙向約束
    repeat(10) begin  
      assert(busop.randomize());
      $display("(r,s,t)=(%0d,%0d,%0d)", busop.s,busop.r,busop.t);
    end
  end
endmodule;