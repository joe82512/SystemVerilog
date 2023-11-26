// Code your design here

/* 
  停止單一thread:
  join_any等待其中一個子thread結束 + disable刪除thread
*/

interface bus_ifc(input bit clk);
  logic[31:0] addr;

  clocking cb @(posedge clk);
    input addr;
    //...
  endclocking
  
  modport TB(clocking cb);
    modport DUT(output addr,
                input clk);

endinterface

module driver(bus_ifc.DUT bus);
  //邊緣觸發, 第一次才開始定義, 第二次才能採樣
  always@ (posedge bus.clk) begin
    bus.addr <= 2;//錯誤值
  end
endmodule
    
class Transaction;
  rand bit[31:0] addr;
  constraint c {addr inside {[1:3]};}
endclass

program automatic test(bus_ifc.TB bus);
  task transmit (Transaction tr);
    $display("@%0t: addr=%0d", $time, tr.addr);
    // $display("cb addr=%0d",bus.cb.addr);
  endtask
  
  parameter TIME_OUT = 11; //>10, 5+10=15 即第二次posedge(clk)
  // (1)比top module的#100短 (2)比第二次posedge(clk)還長
  task check_trans(Transaction tr);
    fork
      begin
        // 等待其中一個thread結束, 用join_any
        fork:timeout_block
          //thread1
          begin
            wait (bus.cb.addr == tr.addr);
            $display("@%0t: Addr match %0d", $time, tr.addr);
          end
          //thread2
          #TIME_OUT $display("@%0t: Error: timeout", $time);
        join_any
        disable timeout_block; //刪除子thread, 故只會產生一次!
      end
    join_none
  endtask
  
  Transaction tr;
  initial begin
    @(bus.cb); //等DUT產生+pos(clk): 第一次posedge(clk)
    repeat (10) begin
      tr = new();
      assert(tr.randomize());
      transmit(tr);
      check_trans(tr);
    end
    wait fork; //等待所有子程序完成
  end
endprogram
    
module top;
  bit clk;
  always #5 clk = !clk;
  
  bus_ifc bus(clk);
  driver d1(bus);
  test t1(bus);
  
  initial begin
    #100;
    $finish; //停止仿真
  end
endmodule:top
    


/*
  case [bus.addr = 20]
  @5: addr=1
  @5: addr=1
  @5: addr=2
  @5: addr=1
  @5: addr=3
  @5: addr=1
  @5: addr=1
  @5: addr=1
  @5: addr=3
  @5: addr=2
  @15: Error: timeout
  
  case [bus.addr = 2]
  @5: addr=1
  @5: addr=1
  @5: addr=2
  @5: addr=1
  @5: addr=3
  @5: addr=1
  @5: addr=1
  @5: addr=1
  @5: addr=3
  @5: addr=2
  @15: Addr match 2
*/