// Code your design here

/*
  父類handle = 子類object : 可執行
  子類handle = 父類object : 不可執行, 因為子類已擴展, 用$cast檢查
*/

class Transaction;
  rand bit [31:0] src, dst, data[8];
  bit [31:0] crc;
  
  virtual function void calc_crc;
    crc = src ^ dst ^ data.xor;
  endfunction
  
  virtual function void display(input string prefix="");
    $display("%s Tr: src=%h, dst=%h, crc=%h", prefix,src,dst,crc);
  endfunction
endclass:Transaction

class BadTr extends Transaction;
  rand bit bad_crc;
  
  virtual function void calc_crc;
    super.calc_crc();        // Compute good CRC
    if (bad_crc) crc = ~crc; // Corrupt the CRC bits
  endfunction
  
  virtual function void display(input string prefix="");
    $write("%s BadTr: bad_crc:%b, " ,prefix,bad_crc);
    super.display();
  endfunction
endclass:BadTr

program automatic test;
  Transaction tr;
  BadTr bad, bad2;
  
  initial begin
    //ex8.12
    bad = new();
    assert(bad.randomize()); //初始隨機化
    tr = bad;          // Base handle points to extended obj
    $display(tr.src);
    tr.display;       // BadTr::display
    
    //ex8.13
    // tr = new();
    // bad = tr;         // ERROR: WILL NOT COMPILE
    // $display(bad.bad_crc); // bad_crc is not in base object
    
    //ex8.14
    if(!$cast(bad2,tr)) begin // try: bad2 = tr;
      $display("cannot assign tr to bad2");
    end
    else begin
      $cast(bad2,tr); // Simulation error if mismatch
      $display("bad_crc = %0d",bad2.bad_crc); // bad_crc exists in original obj
    end
  end
endprogram

/*
  3910850489
   BadTr: bad_crc:0,  Tr: src=e91ad7b9, dst=a1098c6c, crc=00000000
  bad_crc = 0
*/
