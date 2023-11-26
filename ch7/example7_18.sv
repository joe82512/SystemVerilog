// Code your design here

/*
  停止指定thread: 依靠LABEL
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
    bus.addr <= 20;//錯誤值
  end
endmodule
    
class Transaction;
  rand bit[31:0] addr;
  constraint c {addr inside {[1:3]};}
endclass

program automatic test(bus_ifc.TB bus);
  task transmit (Transaction tr, string s);
    $display("%s->@%0t: addr=%0d", s, $time, tr.addr);
    // $display("cb addr=%0d",bus.cb.addr);
  endtask
  
  parameter TIME_OUT = 10; //比top module的#100短才行
  task check_trans(Transaction tr, string s);
    fork
      begin
        wait (bus.cb.addr == tr.addr);
        $display("%s--->@%0t: Addr match %0d", s, $time, tr.addr);
      end
      begin
        #(TIME_OUT+5);
        $display("%s--->TIMEOUT", s); //有顯示代表thread沒被關閉
      end
    join_none
  endtask
  
  Transaction tr0, tr1, tr2;
  initial begin
    @(bus.cb); //等DUT產生+pos(clk)
    repeat (5) begin
      tr0 = new();
      assert(tr0.randomize());
      //transmit(tr0,"tr0");
      tr1 = new();
      assert(tr1.randomize());
      //transmit(tr1,"tr1");
      tr2 = new();
      assert(tr2.randomize());
      //transmit(tr2,"tr2");
      
      check_trans(tr0,"tr0");        //thread0
      fork                           //thread1
        begin
          check_trans(tr1,"tr1");    //thread2
          fork:threads_inner         //thread3
            check_trans(tr2,"tr2");  //thread4
          join
          #(TIME_OUT/2) disable threads_inner; //stop thread3~4
        end
      join
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
  tr0--->TIMEOUT
  tr1--->TIMEOUT
  tr0--->TIMEOUT
  tr1--->TIMEOUT
  tr0--->TIMEOUT
  tr1--->TIMEOUT
  tr0--->TIMEOUT
  tr1--->TIMEOUT
  tr0--->TIMEOUT
  tr1--->TIMEOUT
*/