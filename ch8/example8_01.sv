// Code your design here

/*
  繼承: 用extends繼承類
  (1) 父類的func要加virtual
  (2) 唯獨new()不能加virtual
  (3) 不支持多重繼承
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
    super.display(); //繼承方法
  endfunction
endclass:BadTr

program automatic test;
  BadTr badTr;
  
  initial begin
    badTr = new();
    assert(badTr.randomize()); //初始隨機化
    repeat(3) begin
      assert(badTr.randomize(bad_crc)); //只隨機化bad_crc
      badTr.calc_crc();
      badTr.display();
    end
  end
endprogram

/*
 BadTr: bad_crc:1,  Tr: src=e91ad7b9, dst=a1098c6c, crc=b93b9ade
 BadTr: bad_crc:0,  Tr: src=e91ad7b9, dst=a1098c6c, crc=46c46521
 BadTr: bad_crc:1,  Tr: src=e91ad7b9, dst=a1098c6c, crc=b93b9ade
*/