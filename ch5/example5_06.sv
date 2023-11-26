// Code your design here

module my_class;

  class Transaction;
    bit [31:0] addr,crc,data[8];

    function new(logic[31:0] a=3,d=5);
      addr = a;
      foreach(data[i])
        data[i] = d;
    endfunction

    function void display;
      $display("Transaction:%h",addr);
    endfunction:display

    function void calc_crc;
      crc = addr^data.xor;
    endfunction:calc_crc

  endclass:Transaction



  class Driver;
    Transaction tr;
    function new();  //Driver 的new
      tr = new();    //Transaction 的new
      tr.display();
    endfunction
    
  endclass:Driver

  

  initial begin
    Transaction t, t1, t2; //聲明多個handle(object的指標,還不是object)
    //ex5.6
    t1 = new(); //分配地址
    t2 = t1;    //指向同一對象
    t1 = new(); //重新分配地址
    //ex5.7
    t = new();  //分配第一個
    t = new();  //分配第二個,並解除第一個
    t = null;   //解除分配第二個
    //ex5.8
    t = new();       //重新分配一個
    t.addr = 32'h42; //set
    t.display();     //調用 func: Transaction:00000042
  end
  
endmodule