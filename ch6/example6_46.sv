// Code your design here

/* 約束問題: 約束時必須考慮隨機化變數的形態!!! */

// ex6.46: 陣列約束: byte有負號
class bad_sum1;
  rand byte len[];
  constraint c_len {len.sum<1024;
                    len.size() inside {[1:8]}; }
  function void display();
    $write("sum=%4d, val=", len.sum);
    foreach(len[i])
      $write("%4d ",len[i]);
    $display;
  endfunction
endclass

// ex6.49: 陣列約束: 總和&矩陣元素皆小於256
class bad_sum2;
  rand bit[7:0] len[];
  constraint c_len {len.sum<1024;
                    len.size() inside {[1:8]}; }
  function void display();
    $write("sum=%4d, val=", len.sum);
    foreach(len[i])
      $write("%4d ",len[i]);
    $display;
  endfunction
endclass

// ex6.51: 陣列約束: 32bit 會有overflow問題
class bad_sum3;
  rand bit[31:0] len[]; //uint FAIL
  constraint c_len {len.sum<1024;
                    len.size() inside {[1:8]}; }
  function void display();
    $write("sum=%4d, val=", len.sum);
    foreach(len[i])
      $write("%4d ",len[i]);
    $display;
  endfunction
endclass

// ex6.53: 陣列約束: 1024 = 2^10, 但可能有元素超過256
class bad_sum4;
  rand bit[9:0] len[];
  constraint c_len {len.sum<1024;
                    len.size() inside {[1:8]}; }
  function void display();
    $write("sum=%4d, val=", len.sum);
    foreach(len[i])
      $write("%4d ",len[i]);
    $display;
  endfunction
endclass

// ex6.55: 陣列約束: foreach限制每個元素
class good_sum5;
  rand bit[31:0] len[];
  constraint c_len {
    foreach (len[i])
      len[i] inside {[1:255]};
    len.sum<1024;
    len.size() inside {[1:8]};
  }
  function void display();
    $write("sum=%4d, val=", len.sum);
    foreach(len[i])
      $write("%4d ",len[i]);
    $display;
  endfunction
endclass




program automatic test;
  //bad_sum1 c; //ex6.46
  //bad_sum2 c; //ex6.49
  //bad_sum3 c; //ex6.51
  //bad_sum4 c; //ex6.53
  good_sum5 c;
  initial begin
    c = new();
    repeat(10) begin
      assert (c.randomize());
      c.display();
    end
  end
endprogram