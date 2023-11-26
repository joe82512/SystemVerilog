// Code your design here

/* 約束問題: 約束時必須考慮隨機化變數的形態!!! */

module my_class;
  // ex6.41: 有負號 -> SignedVars: 78 + -14
  class SignedVars;
    rand byte pkt1_len, pk2_len;
    constraint totel_len { pkt1_len + pk2_len == 64; }
  endclass:SignedVars
  
  // ex6.42: 沒考慮overflow -> Vars32: 240549189 + 4054418171
  class Vars32;
    rand bit[31:0] pkt1_len, pk2_len;
    constraint totel_len { pkt1_len + pk2_len == 64; }
  endclass:Vars32
  
  //ex6.43: 2^6=64 -> 22 + 42
  class Vars8;
    rand bit[7:0] pkt1_len, pk2_len;
    constraint totel_len { pkt1_len + pk2_len == 9'd64; }
  endclass:Vars8
  
  //ex6.44: 限制不定長度陣列的長度範圍
  class dyn_size;
    rand logic[31:0] d[]; //不定長度陣列
    constraint d_size { d.size() inside {[1:10]}; }
  endclass
  
  //ex6.45: 限制陣列總和
  parameter MAX_TRANSFER_LEN = 10;
  class StrobePat;
    //rand bit strobe[MAX_TRANSFER_LEN]; //書上寫法會FAIL
    rand bit[3:0] strobe[MAX_TRANSFER_LEN]; //用4-bits指定,但限制[0,1]
    constraint c_set_four {
      strobe.sum()==4'h4;
      foreach (strobe[i]) strobe[i] inside {[0:1]}; //限制[0,1]
    }
  endclass:StrobePat
  
  //ex6.46: 陣列約束->放下一個程式碼
  
  

  SignedVars sv;
  Vars32 v32;
  Vars8 v8;
  StrobePat sp;
  initial begin
    sv = new();
    v32 = new();
    v8 = new();
    sp = new();
    repeat(5) begin
      assert (sv.randomize());
      $display("SignedVars: %0d + %0d", sv.pkt1_len, sv.pk2_len);
      assert (v32.randomize());
      $display("Vars32: %0d + %0d", v32.pkt1_len, v32.pk2_len);
      assert (v8.randomize());
      $display("Vars8: %0d + %0d", v8.pkt1_len, v8.pk2_len);
    end
    $display();
    assert (sp.randomize());
    $display(sp.strobe);
  end
endmodule