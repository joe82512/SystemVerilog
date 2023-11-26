// Code your design here

/* class中也可以有task */

module my_class;
 
  class Transaction;
	bit [31:0] addr,crc,data[8];
    
    function void display();
      $display("@%0t:TR addr=%h,crc=%h",$time,addr,crc);
      $write("\tdata[0-7]=");
      foreach (data[i])
        $write("%0d",data[i]);
      $display(); // \n
    endfunction
    
  endclass
  
  
  
  class PCI_Tran;
    bit [31:0] addr,data;
    
    function void display();
      $display("@%0t:PCI addr=%h,data=%h",$time,addr,data);
    endfunction
    
  endclass
  
  
  Transaction t;
  PCI_Tran pc;
  initial begin
    t = new();
    t.display();  //Transaction 的 display
    pc = new();
    pc.display(); //PCI_Tran 的 display
  end
  
endmodule