// Code your design here

/* 
  分類交叉覆蓋率
*/

interface busifc (input bit clk);
  logic[31:0] data;
  logic[ 2:0] port;

  clocking cb @(posedge clk);
    output data, port;
  endclocking
  
  modport TB(clocking cb);
endinterface

program automatic test(busifc.TB ifc);
  class Transaction;
    rand bit a, b;
  endclass
  Transaction tr;
  
  //ex9.35
  covergroup CrossBinNames;
    option.per_instance = 1; //建議要開
    a: coverpoint tr.a {
      bins a0 = {0};
      bins a1 = {1};
      option.weight=0; // Only count cross
    }
    b: coverpoint tr.b {
      bins b0 = {0};
      bins b1 = {1};
      option.weight=0; // Only count cross
    }
    ab: cross a, b {
      bins a0b0 = binsof(a.a0) && binsof(b.b0); //(0,0)
      bins a1b0 = binsof(a.a1) && binsof(b.b0); //(1,0)
      bins b1 = binsof(b.b1);                   //(X,1)
    }
  endgroup
  CrossBinNames ck_name;

  //ex9.36: 不用先定義個別bin
  covergroup CrossBinsofIntersect;
    option.per_instance = 1; //建議要開
    a: coverpoint tr.a { option.weight=0; } // Only count cross
    b: coverpoint tr.b { option.weight=0; } // Only count cross
    ab: cross a, b { 
      bins a0b0 = binsof(a) intersect {0} && //<a[0],b[0]>
                  binsof(b) intersect {0};
      bins a1b0 = binsof(a) intersect {1} && //<a[1],b[0]>
                  binsof(b) intersect {0};
      bins b1 = binsof(b) intersect {1};     //<a[*],b[1]>
    }
  endgroup
  CrossBinsofIntersect ck_intersect;

  //ex9.37: 直接用2-bits分類
  covergroup CrossManual;
    option.per_instance = 1; //建議要開
    ab: coverpoint {tr.a, tr.b} {
      bins a0b0 = {2'b00};
      bins a1b0 = {2'b10};
      wildcard bins b1 = {2'b?1}; //X1
    }
  endgroup
  CrossManual ck_manual;

  initial begin
    tr = new();
    ck_name = new(); //實例化
    ck_intersect = new();
    ck_manual = new();
    repeat (4) begin
      assert(tr.randomize);
      ck_name.sample(); // Gather coverage
      ck_intersect.sample();
      ck_manual.sample();
      $display("(a,b)=(%0b,%0b)", tr.a, tr.b);
      @ifc.cb;
    end
    $stop; //不能用$finish, 否則report出不來
  end
endprogram

module top;
  bit clk;
  always #5 clk = !clk;
  
  busifc ifc(clk);
  test t1(ifc);
endmodule:top