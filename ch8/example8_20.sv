// Code your design here

/* deepcopy */

class Transaction;
  rand bit [31:0] src, dst, data[8];
  bit [31:0] crc;
  
  virtual function void calc_crc;
    crc = src ^ dst ^ data.xor;
  endfunction
  
  virtual function void display(input string prefix="");
    $display("%s Tr: src=%h, dst=%h, crc=%h", prefix,src,dst,crc);
  endfunction
  
  //ex8.20
  virtual function Transaction copy(); //return Transaction
    copy = new();
    copy.src = src; // Copy data fields
    copy.dst = dst;
    copy.data = data;
    copy.crc = crc;
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
  
  //ex8.21
  virtual function Transaction copy(); //return Transaction
    BadTr bad;
    bad = new();
    bad.src = src; // Copy data fields
    bad.dst = dst;
    bad.data = data;
    bad.crc = crc;
    bad.bad_crc = bad_crc;
    return bad;
  endfunction
endclass:BadTr

program automatic test;
  Transaction tr;
  BadTr bad;
  
  initial begin
    bad = new();
    assert(bad.randomize());
    $write("bad->");
    bad.display();
    
    tr = bad.copy();
    assert(tr.randomize());
    $write("bad->");
    bad.display();
    $write("tr ->");
    tr.display();
  end
endprogram

/*
  bad-> BadTr: bad_crc:0,  Tr: src=e91ad7b9, dst=a1098c6c, crc=00000000
  bad-> BadTr: bad_crc:0,  Tr: src=e91ad7b9, dst=a1098c6c, crc=00000000
  tr -> BadTr: bad_crc:0,  Tr: src=a311a307, dst=4f5b1214, crc=00000000
*/