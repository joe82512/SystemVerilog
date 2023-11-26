// Code your design here

/*
  blueprint
  目標: 插拔性->把tr抽離, 可替換tr輸入
  方法: 把 tr 建立跟初始化分離 , 在初始化之前灌入
*/

interface bus_ifc (input bit clk);
  logic[31:0] crc;

  clocking cb @(posedge clk);
    output crc;
  endclocking
  
  modport DUT(clocking cb);
endinterface

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
  virtual function Transaction copy();
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
  virtual function Transaction copy();
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


//ex8.4
class Driver;
  mailbox gen2drv;
  virtual bus_ifc.DUT ifc;
  
  function new(mailbox gen2drv, virtual bus_ifc.DUT ifc); //ch10: virtual interface
  	this.gen2drv = gen2drv;
    this.ifc = ifc;
  endfunction
  
  task run;
  	Transaction tr;
    forever begin
      gen2drv.get(tr); //取得tr
      tr.calc_crc(); //處理tr
      $display("[Drv A]->@%0t", $time);
      @(ifc.cb);
      ifc.cb.crc <= tr.crc; //發送tr
      // ...
      $display("[Drv B]->@%0t", $time);
      tr.display();
    end
  endtask
endclass

//ex8.6
class Generator;
  mailbox gen2drv;
  Transaction blueprint;
  
  function new(mailbox gen2drv);
  	this.gen2drv = gen2drv;
    blueprint = new(); //建立
  endfunction
  
  task run;
    Transaction tr;
    forever begin
      assert(blueprint.randomize);
      tr = blueprint.copy(); // ex8.21
      gen2drv.put(tr); //傳遞tr給driver
      $display("[Gen]->@%0t", $time);
    end
  endtask
endclass
    
//ex8.7
class Environment;
  virtual bus_ifc.DUT ifc;
  Generator gen;
  Driver drv;
  mailbox gen2drv;
  
  function new(virtual bus_ifc.DUT ifc);
    this.ifc = ifc;
  endfunction
  
  function void build();
    gen2drv = new(1); //定容1, 製造簡單同步
    gen = new(gen2drv);
    drv = new(gen2drv, ifc);
  endfunction
  
  task run();
    fork
      gen.run();
      drv.run();
    join_none
    wait fork; //等待子thread執行, 否則會提早結束仿真
  endtask
  
  task wrap_up();
    // scoreboard
  endtask
endclass

//ex8.9
program automatic test(bus_ifc.DUT ifc);
  Environment env;
  virtual bus_ifc.DUT v_ifc = ifc;
  
  initial begin
    env = new(v_ifc);    // Construct the environment
    env.build();         // Build testbench objects
    
    begin
      BadTr bad = new(); // Replace blueprint with the "bad" one
      env.gen.blueprint = bad;
    end
    
    env.run();           // Run the test
    env.wrap_up();       // Clean up afterwards
  end
endprogram
    

module top;
  bit clk;
  always #5 clk = !clk;
  
  bus_ifc ifc(clk);
  test t1(ifc);
  
  initial begin
    #100;
    $finish; //超過#100停止仿真
  end
endmodule:top



/*
  [Gen]->@0
  [Drv A]->@0
  [Gen]->@0
  [Drv B]->@5
   BadTr: bad_crc:0,  Tr: src=a311a307, dst=4f5b1214, crc=4e53cb4d
  [Drv A]->@5
  [Gen]->@5
  [Drv B]->@15
   BadTr: bad_crc:1,  Tr: src=442b2b72, dst=875bded6, crc=d0b59f40
  [Drv A]->@15
  [Gen]->@15
  [Drv B]->@25
   BadTr: bad_crc:0,  Tr: src=31bf3efe, dst=55b5b7f8, crc=1570ba65
  [Drv A]->@25
  [Gen]->@25
  [Drv B]->@35
   BadTr: bad_crc:1,  Tr: src=04e50db9, dst=79efa74d, crc=7826d839
  [Drv A]->@35
  [Gen]->@35
  [Drv B]->@45
   BadTr: bad_crc:1,  Tr: src=501bf406, dst=6e0388be, crc=2380cb8d
  [Drv A]->@45
  [Gen]->@45
  [Drv B]->@55
   BadTr: bad_crc:0,  Tr: src=4c0260d4, dst=2634d941, crc=06f10203
  [Drv A]->@55
  [Gen]->@55
  [Drv B]->@65
   BadTr: bad_crc:0,  Tr: src=a5047a55, dst=749f27ba, crc=0292ac18
  [Drv A]->@65
  [Gen]->@65
  [Drv B]->@75
   BadTr: bad_crc:0,  Tr: src=15acd42f, dst=862e60e4, crc=34018692
  [Drv A]->@75
  [Gen]->@75
  [Drv B]->@85
   BadTr: bad_crc:1,  Tr: src=6fd33555, dst=752f65eb, crc=7fb77634
  [Drv A]->@85
  [Gen]->@85
  [Drv B]->@95
   BadTr: bad_crc:1,  Tr: src=71d73eab, dst=be4c747a, crc=ec821429
  [Drv A]->@95
  [Gen]->@95
*/