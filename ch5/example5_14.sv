// Code your design here

/* function外置, 靠class::連接 (提高可讀性而已) */

module my_class;
 
  class Transaction;
	bit [31:0] addr,crc,data[8];
    extern function void display(); //外置func
  endclass
  
  function void Transaction::display(); //靠::連接class
    $display("@%0t:TR addr=%h,crc=%h",$time,addr,crc);
    $write("\tdata[0-7]=");
    foreach (data[i])
      $write("%0d",data[i]);
    $display(); // \n
  endfunction
  
  
  class PCI_Tran;
    bit [31:0] addr,data;
    extern function void display(); //外置func
  endclass
      
  function void PCI_Tran::display(); //靠::連接class
    $display("@%0t:PCI addr=%h,data=%h",$time,addr,data);
  endfunction
    
  
  
  Transaction t;
  PCI_Tran pc;
  initial begin
    t = new();
    t.display();
    pc = new();
    pc.display();
  end
  
endmodule