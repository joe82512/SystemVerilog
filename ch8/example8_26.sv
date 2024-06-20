// Code your design here

/*
  抽象類別: 可視作類別的模板
  (1)不能實例化, 要extends後才能實例化
  (2)純虛方法只能在抽象類別中定義, 但抽象類別不一定要用純虛方法
*/

virtual class BaseTr;
  static int count; //靜態變數
  int id;

  function new();
    id = count++;
  endfunction

  pure virtual function bit compare(input BaseTr to);
  pure virtual function BaseTr copy(input BaseTr to = null);
  pure virtual function void display(input string prefix="");
endclass:BaseTr

class Transaction extends BaseTr;
  rand bit [31:0] src, dst, crc, data[8];

  extern virtual function bit compare(input BaseTr to);
  extern virtual function BaseTr copy(input BaseTr to = null);
  extern virtual function void copy_data(input Transaction copy);
  extern virtual function void display(input string prefix="");
  extern function new();
endclass:Transaction

function bit Transaction::compare(BaseTr to);
  Transaction tr;
  assert($cast(tr,to));
  return (
    (this.src==tr.src)&&
    (this.dst==tr.dst)&&
    (this.crc==tr.crc)&&
    (this.data==tr.data)
  );
endfunction

function BaseTr Transaction::copy(BaseTr to=null);
  Transaction cp;
  if (to == null)
    cp = new();
  else
    $cast(cp,to);
  copy_data(cp);
  return cp;
endfunction

function void Transaction::copy_data(Transaction copy);
  copy.src = src;
  copy.dst = dst;
  copy.data = data;
  copy.crc = crc;
endfunction

function void Transaction::display(string prefix="");
  $display("%s Tr[%0d]: src=%h, dst=%h, crc=%h", prefix,id,src,dst,crc);
endfunction

function Transaction::new();
  super.new();
endfunction

program automatic test;
  BaseTr br;
  Transaction tr;
  bit bool;
  
  initial begin
    tr = new();
    assert(tr.randomize());
    tr.display();

    br = tr.copy();
    bool = tr.compare(br);
    $display("A: %0d", bool);

    assert(br.randomize());
    bool = tr.compare(br);
    $display("B: %0d", bool);
  end
endprogram

/*
   Tr[0]: src=e91ad7b9, dst=a1098c6c, crc=a13af8a7
  A: 1
  B: 0
*/
