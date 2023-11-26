// Code your design here

/*
  blueprint
  目標: 插拔性->把tr抽離, 可替換tr輸入->擴大成不同約束的tr類
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
    $display("%s Tr: src=%0d, dst=%0d, crc=%h", prefix,src,dst,crc); //%d方便檢查約束
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

//ex8.10
class Nearby extends Transaction;
  constraint c_nearby {
    dst inside {[src-100:src+100]};
  }
endclass:Nearby

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
        Nearby nb = new(); // Replace blueprint with Nearby
        env.gen.blueprint = nb;
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
   Tr: src=4065990422, dst=4065990430, crc=287bd005
  [Drv A]->@5
  [Gen]->@5
  [Drv B]->@15
   Tr: src=604507340, dst=604507284, crc=40775543
  [Drv A]->@15
  [Gen]->@15
  [Drv B]->@25
   Tr: src=3387343593, dst=3387343642, crc=395659c4
  [Drv A]->@25
  [Gen]->@25
  [Drv B]->@35
   Tr: src=3757425894, dst=3757425971, crc=bdd2f075
  [Drv A]->@35
  [Gen]->@35
  [Drv B]->@45
   Tr: src=1992525453, dst=1992525460, crc=0e0d5053
  [Drv A]->@45
  [Gen]->@45
  [Drv B]->@55
   Tr: src=1572533289, dst=1572533251, crc=3e0526c9
  [Drv A]->@55
  [Gen]->@55
  [Drv B]->@65
   Tr: src=3665497972, dst=3665497930, crc=f56a4e52
  [Drv A]->@65
  [Gen]->@65
  [Drv B]->@75
   Tr: src=2007213410, dst=2007213376, crc=20c65b7c
  [Drv A]->@75
  [Gen]->@75
  [Drv B]->@85
   Tr: src=4201589579, dst=4201589544, crc=3520055f
  [Drv A]->@85
  [Gen]->@85
  [Drv B]->@95
   Tr: src=3452402731, dst=3452402824, crc=65557a66
  [Drv A]->@95
  [Gen]->@95
*/