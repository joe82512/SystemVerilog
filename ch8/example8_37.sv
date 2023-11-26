// Code your design here

/* blueprint + 引數多型 */

//ex8.26
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



//ex8.37
class Generator #(type T=BaseTr); //多型
  mailbox gen2drv;
  T blueprint;
  
  function new(mailbox gen2drv);
  	this.gen2drv = gen2drv;
    blueprint = new(); //建立
  endfunction
  
  task run();
    T tr; //多型
    BaseTr br;
    forever begin
      assert(blueprint.randomize);
      br = blueprint.copy(); // ex8.21
      $cast(tr,br); //型別轉換
      gen2drv.put(tr); //傳遞tr給test
    end
  endtask
endclass

//ex8.38
program automatic test;
  initial begin
    Generator #(Transaction) gen;
    mailbox gen2drv;
    gen2drv = new(1); //定容1, 製造簡單同步
    gen = new(gen2drv);
    fork
      gen.run();

      repeat(5) begin
        Transaction tr;
        gen2drv.peek(tr);
        tr.display();
        gen2drv.get(tr);
      end
    join_any
  end
endprogram

/*
 Tr[1]: src=e91ad7b9, dst=a1098c6c, crc=a13af8a7
 Tr[2]: src=61a0985b, dst=49839480, crc=74d1d18a
 Tr[3]: src=17ad833a, dst=ef72da56, crc=5be75d33
 Tr[4]: src=e7b4dc07, dst=aa69ad52, crc=5869ed59
 Tr[5]: src=b295cbe0, dst=a969a54c, crc=c9e48d64
*/