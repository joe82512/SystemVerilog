// Code your design here

/* 
  pre_randomize() post_randomize() 是調用randomize時會執行的隨機化函數
  順序: pre_randomize()->randomize()->post_randomize()
  這裡重新實作 pre_randomize(), 且沒使用rand, 故無法用randomize()
*/

module my_random;
  class Bathtub;
    int value;
    int WIDTH=50, DEPTH=4, seed=1;
    
    //繼承&覆寫
    function void pre_randomize();
      //指數遞減
      value = $dist_exponential(seed,DEPTH);
      //邊界
      if (value>WIDTH)
        value = WIDTH;
      //左右對稱
      if ($urandom_range(1)) //0或1的平均分布: 等同$urandom_range(0,1)
        value = WIDTH - value;
    endfunction:pre_randomize
  endclass:Bathtub

  Bathtub b;
  initial begin
    b = new();
    repeat(10) begin
      //assert(b.randomize()); //沒有定義隨機化變數
      b.pre_randomize();
      $display("value=%0d", b.value);
    end
  end
endmodule;