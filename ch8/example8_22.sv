// Code your design here

/* deepcopy
  用繼承化簡, 並加入引數
  但因為SV的多型/覆寫必須要同樣類別, 所以要特別做型別轉換
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
  
  //ex8.22
  virtual function void copy_data(Transaction copy);
    copy.src = src; // Copy the data fields
    copy.dst = dst;
    copy.data = data;
    copy.crc = crc;
  endfunction

  //ex8.24
  virtual function Transaction copy(Transaction to=null); //引數
    if (to == null)
      copy = new(); // Construct object
	else
      copy = to;    // Use exisiting
    copy_data(copy);
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
  virtual function void copy_data(Transaction tr); //注意型態轉換
    BadTr bad;
    super.copy_data(tr); // Copy base data
    $cast(bad, tr); // Cast base handle to ext’d
    bad.bad_crc = bad_crc; // Copy extended data
  endfunction
  
  //ex8.25
  virtual function Transaction copy(Transaction to=null); //引數
    BadTr bad;
    if (to == null)
      bad = new();
	else
      assert($cast(bad,to));
    copy_data(bad); // Copy data fields
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