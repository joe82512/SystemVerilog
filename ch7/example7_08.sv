// Code your design here

/*
  (1) 動態建立thread
  (2) join_none不影響主thread執行
  (3) wait fork等待子thread都執行完畢, 否則主thread執行完即結束仿真
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
  always@ (posedge bus.clk) begin
    bus.addr <= 2;
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
  
  task check_trans(Transaction tr);
    fork
      begin
        #13; //刻意delay讓randomize()先做完
        wait (bus.cb.addr == tr.addr);
        $display("@%0t: Addr match %0d", $time, tr.addr);
      end
    join_none //不影響主thread
  endtask
  
  Transaction tr;
  initial begin
    @(bus.cb); //等DUT產生+pos(clk)
    repeat (10) begin
      tr = new();
      assert(tr.randomize());
      transmit(tr);
      check_trans(tr); //動態建立thread
    end
    wait fork; //等待所有子程序完成, 否則check_trans來不及跑不完, 主thread已關閉
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
  @18: Addr match 2
  @18: Addr match 2
*/