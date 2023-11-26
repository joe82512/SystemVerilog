// Code your design here

/* 把class移入package , 防止變數誤用 -> compiler FAIL */

package Mistake;
  class Bad;
    logic[31:0] data[];
    function void display;
      for (i=0; i<data.size();i++) //int -> compiler FAIL
        $display("data[%0d]=%x",i,data[i]);
    endfunction
  endclass
endpackage
               
program test;
  int i;
  import Mistake::*;
  
  initial begin
	Bad b;
    b = new;
    b.display();
  end
endprogram