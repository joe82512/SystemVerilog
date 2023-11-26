// Code your design here

module my_class;

  class Transaction;
    bit [31:0] addr,crc,data[8];

    function new(logic[31:0] a=3,d=5); //default引數
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


  // class內調用其他class
  class Driver;
    Transaction tr;
    function new();  //Driver 的new
      tr = new();    //Transaction 的new
      tr.display();
    endfunction
    
  endclass:Driver

  

  initial begin
    Transaction tr;
    Driver driver;
    
    tr = new(10);   //addr=10, data=10(default)
    tr.display();   //Transaction:0000000a
    
    driver = new(); //Transaction:00000003
    
  end
  
endmodule