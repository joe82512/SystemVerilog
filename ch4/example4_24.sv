// Code your design here

/* 
  port 雙向訊號(可以直接採樣/驅動)
*/
interface master_if (input bit clk);
  wire [7:0] data; //雙向訊號要用wire
  
  // 等待時鐘
  clocking cb @(posedge clk);
    inout data; //雙向: inout
  endclocking
    
endinterface


program test (master_if mif);
  initial begin
    mif.cb.data <= 'z;     //三態總線
    @mif.cb;               //wait
    $displayh(mif.cb.data);//read: zz
    @mif.cb;               //
    mif.cb.data <= 7'h5a;  //write
    @mif.cb;               //
    $displayh(mif.cb.data);//read: 5a
    @mif.cb;               //
    mif.cb.data <= 'z;     //釋放總線
  end
endprogram:test

    
module top;
  bit clk;

  always #5 clk = ~clk;
  master_if mif(clk);
  test t1 (mif);
  
  initial begin
    clk = 0;
    #100;
    $finish;
  end

endmodule