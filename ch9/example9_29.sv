// Code your design here

/* 
  cross coverage: [A]100% + [B]100% -> [AB]不一定100% !
  注意 ignore 的 binsof 要先定義才有效 , 例如: [1:3]有效, [8:$]則無效
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
    rand bit [ 3:0] kind; // 0:15
    rand bit [ 2:0] port; // 0:7
  endclass
  Transaction tr;
  
  covergroup CovPort;
    port: coverpoint tr.port {
			bins port[] = {[0:$]}; //ex9.31
    }
    kind: coverpoint tr.kind {
			bins zero = {0}; //ex9.31
			bins lo = {[1:3]};
			bins hi[] = {[8:$]};
			bins misc = default;
    }
    // cross kind, port; // Cross kind and port
    cross kind, port { //ex3.33
			ignore_bins hi = binsof(port) intersect {7};      //排除<kind[*],port[7]>
			ignore_bins md = binsof(port) intersect {0} &&
											 binsof(kind) intersect {[9:11]}; //排除<kind[9:11],port[0]>
			ignore_bins lo = binsof(kind.lo);                 //排除<kind[1:3],port[*]>
		}
  endgroup
  CovPort ck;

  initial begin
    tr = new();
    ck = new(); //實例化
    repeat (32) begin
      assert(tr.randomize);
      ck.sample(); // Gather coverage
      @ifc.cb;
    end
    $display ("Coverage = %.2f%%", ck.get_coverage());
    $stop; //不能用$finish, 否則report出不來
  end
endprogram

module top;
  bit clk;
  always #5 clk = !clk;
  
  busifc ifc(clk);
  test t1(ifc);
endmodule:top