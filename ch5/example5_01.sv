// Code your design here

module my_class;

class Transaction;
  bit [31:0] addr,crc,data[8];
  
  function new;
    addr=3;
    foreach(data[i])
      data[i]=5;
  endfunction

  function void display;
    $display("Transaction:%h",addr);
  endfunction:display

  function void calc_crc;
    crc = addr^data.xor; //3xor0
  endfunction:calc_crc
  
endclass:Transaction

  initial begin
    Transaction tr; //聲明handle
    tr = new();     //實例化,分配空間成object
    tr.display();   //Transaction:00000003
  end
  
endmodule