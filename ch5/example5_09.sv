// Code your design here

/* 靜態變數在同一種class內共用 , 即 class 內的 global */

module my_class;

  class Transaction;
	static int count=0; //靜態變數
    int id;             //非靜態變數
       
    function new();
      id = count++;
    endfunction
    
  endclass:Transaction

  Transaction t1, t2;
  initial begin
    t1 = new();
    $display("First id=%0d,count=%0d",t1.id,t1.count); //id=0,count=1
    t2 = new();
    $display("Second id=%0d,count=%0d",t2.id,t2.count); //id=1,count=2
    
    $display("Static: %0d",Transaction::count); //直接從class引用
  end
  
endmodule