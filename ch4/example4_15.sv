// Code your design here

/* 
  logic 可以直接驅動
  wire 必須 先assign 後驅動
*/

interface asynch_if ();
  logic l;
  wire w;
  
endinterface


module test (asynch_if ifc);
  logic local_wire;
  assign ifc.w = local_wire;
  
  initial begin
    ifc.l <= 0;
    local_wire <= 1;
  end
  
endmodule


module top;
  asynch_if ifc();
  test t1 (ifc);
  
  initial begin
    #1; //等待啟動 否則為(X,X)
    $display("l=%0d,w=%0d", ifc.l, ifc.w); //(0,1)
    $finish;
  end
endmodule