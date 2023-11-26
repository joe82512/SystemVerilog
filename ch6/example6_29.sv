// Code your design here

/* note: 有效性約束,只有在條件成立時才有約束 */

module my_random;
  class Transaction;
   	rand enum {BYTE,WORD,LWRD,QWRD} length;
    rand enum {READ,WRITE,RMW,INTR} opc;
    
    constraint valid_RMW_LWRD {
      (opc==RMW) -> length==LWRD; //記得約束是==
    }
  endclass:Transaction

  Transaction tr;
  initial begin
    tr = new();
    tr.opc = Transaction::RMW; //調用enum,指定opc
    repeat(10) begin
      assert(tr.randomize());  //但opc是random,所以還是會變
      // $display("opc=%s",tr.opc.name);
      $display("length=%s",tr.length.name);
    end
    $display();
    tr.opc = Transaction::RMW; //調用enum,指定opc
    tr.opc.rand_mode(0);       //設為非隨機值
    repeat(10) begin
      assert(tr.randomize());  //固定為RMW
      // $display("opc=%s",tr.opc.name);
      $display("length=%s",tr.length.name);
    end
  end
endmodule;