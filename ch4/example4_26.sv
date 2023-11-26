// Code your design here

/* 
  clock generator: 不要把clk驅動放在program內 , 且最好獨立出來
  另外 program 內不能有 always, 用 initial forever 取代
*/
interface master_if (input bit clk);
  wire [7:0] data; //雙向訊號要用wire
  
  // 等待時鐘
  clocking cb @(posedge clk);
    inout data; //雙向: inout
  endclocking
    
endinterface

module clock_generator (output bit clk);
  always #5 clk = ~clk;
endmodule

program test (master_if mif);
  initial forever begin    //initial forever 取代 always, $finish停止
    mif.cb.data <= 'z;     //三態總線
    @mif.cb;               //wait
    $display("@%0t: %0h",$time, mif.cb.data); //read: zz
    @mif.cb;               //
    mif.cb.data <= 7'h5a;  //write
    @mif.cb;               //
    $display("@%0t: %0h",$time, mif.cb.data); //read: 5a
    @mif.cb;               //
    mif.cb.data <= 'z;     //釋放總線
  end
endprogram:test

    
module top;
  bit clk;

  clock_generator cg (clk);
  master_if mif(clk);
  test t1 (mif);
  
  initial begin
    // clk = 0; //驅動衝突
    #100;
    $finish;
    /*
      @5: zz
      @25: 5a
      @45: zz
      @65: 5a
      @85: zz
    */
  end

endmodule