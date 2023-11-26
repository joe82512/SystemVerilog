// Code your design here

/*
  建構簡易測試平台:
  driver / generator / env / test
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


//ex8.4
class Driver;
  mailbox gen2drv;
  virtual bus_ifc.DUT ifc;  //ch10: virtual interface
  
  function new(mailbox gen2drv, virtual bus_ifc.DUT ifc);
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

//ex8.5
class Generator;
  mailbox gen2drv;
  Transaction tr;
  
  function new(mailbox gen2drv);
  	this.gen2drv = gen2drv;
  endfunction
  
  task run;
    forever begin
      tr = new();
      assert(tr.randomize()); //隨機化
      gen2drv.put(tr); //傳遞tr
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

//ex8.8
program automatic test(bus_ifc.DUT ifc);
  Environment env;
  virtual bus_ifc.DUT v_ifc = ifc;
  
  initial begin
    env = new(v_ifc); // Construct the environment
    env.build();      // Build testbench objects
    env.run();        // Run the test
    env.wrap_up();    // Clean up afterwards
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
   Tr: src=f7493328, dst=b36931a9, crc=ec5bdd9a
  [Drv A]->@5
  [Gen]->@5
  [Drv B]->@15
   Tr: src=f9a56ddf, dst=3be67cb8, crc=f75c9003
  [Drv A]->@15
  [Gen]->@15
  [Drv B]->@25
   Tr: src=8a68fcb8, dst=8978feee, crc=874b6f94
  [Drv A]->@25
  [Gen]->@25
  [Drv B]->@35
   Tr: src=6b9de011, dst=42ee42aa, crc=d55bf1f1
  [Drv A]->@35
  [Gen]->@35
  [Drv B]->@45
   Tr: src=75c6b45c, dst=9db05fab, crc=7d42105a
  [Drv A]->@45
  [Gen]->@45
  [Drv B]->@55
   Tr: src=dd8f4222, dst=24bdfcb4, crc=069ca1e1
  [Drv A]->@55
  [Gen]->@55
  [Drv B]->@65
   Tr: src=1c180d47, dst=9074b3f9, crc=c8484d4c
  [Drv A]->@65
  [Gen]->@65
  [Drv B]->@75
   Tr: src=38167119, dst=d9a4fe1f, crc=17f7dbfc
  [Drv A]->@75
  [Gen]->@75
  [Drv B]->@85
   Tr: src=d702c3c2, dst=f4a45af6, crc=26d9af84
  [Drv A]->@85
  [Gen]->@85
  [Drv B]->@95
   Tr: src=ccbeccd1, dst=9ce1121f, crc=e46cd918
  [Drv A]->@95
  [Gen]->@95
*/