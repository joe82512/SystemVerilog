// Code your design here

/* 傳輸數據, 用打包&解包(pack unpack), 不要傳遞整個object */

module my_class;
  
  class Transaction;
    bit [31:0] addr,crc,data[8];
    static int count = 0;
    int id;
    
    function new();
      id = count++;
    endfunction
    
    function void display();
      $write("Tr: id=%0d,addr=%x,crc=%x,data=",id,addr,crc);
      foreach(data[i])
        $write("%x ",data[i]);
      $display;
    endfunction
    
    function void pack(ref byte bytes[40]); //ref !!!
      bytes = {>>{addr,crc,data}};
    endfunction
    
    function Transaction unpack(ref byte bytes[40]); //ref !!!
      {>>{addr,crc,data}} = bytes;
    endfunction
  endclass
  
    
  Transaction tr,tr2;
  byte b[40]; //addr+crc+data = 40 byte
  initial begin
    tr=new();
    tr.addr=32'ha0a0a0a0;
    tr.crc=32'h1;
    foreach(tr.data[i])
      tr.data[i] = i;
    tr.pack(b);
    $write("Pack results: ");
    foreach(b[i])
      $write("%h",b[i]);
    $display;
    // Pack results: a0a0a0a0000000010000000000000001000000020000000300000004000000050000000600000007
    
    tr2 = new();
    tr2.unpack(b);
    tr2.display(); //void display
    // Tr: id=1,addr=a0a0a0a0,crc=00000001,data=00000000 00000001 00000002 00000003 00000004 00000005 00000006 00000007 
  end
  
endmodule