// Code your design here

/* note: 內嵌約束randomize() with, 只用一次的顯式約束 */

module my_random;
  class Transaction;
    rand bit[31:0] addr,data;
    constraint c1 {addr inside{[0:100],[1000:2000]};}
  endclass:Transaction

  Transaction t;
  initial begin
    t = new();
    repeat(10) begin
      assert(t.randomize() with {addr>=50;
                                 addr<=1500;
                                 data<10;} ); //not t.addr, t.data
      //driveBus(t);
      $display("addr=%0d, data=%0d", t.addr,t.data);
    end
    $display();
    repeat(10) begin
      assert(t.randomize() with {addr==2000;
                                 data>10;} ); //not t.addr, t.data
      //driveBus(t);
      $display("addr=%0d, data=%0d", t.addr,t.data);
    end
  end
endmodule;