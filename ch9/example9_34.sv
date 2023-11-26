// Code your design here

/* 
  covergroup coverage -> 計算的總覆蓋率結果
  instance coverage   -> 設定的覆蓋率涵蓋多少module/func/task/program...etc
   => 這裡的修改覆蓋率權重, 是修改covergroup coverage, 從report來看
  ( kind:80%*5 + port:100%*0 + cross:28.75%*10 ) / (5+0+10) = 45.83%
  # TOTAL COVERGROUP COVERAGE: 45.83%  COVERGROUP TYPES: 1
  # Total Coverage By Instance (filtered view): 72.91%
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
    option.per_instance = 1; //建議要開
    port: coverpoint tr.port {
      bins port[] = {[0:$]};
      option.weight = 0; // Don’t count towards total
    }
    kind: coverpoint tr.kind {
      bins zero = {0};
      bins lo = {[1:3]};
      bins hi[] = {[8:$]};
      bins misc = default;
      option.weight = 5; // Count in total
    }
    cross kind, port {
      option.weight = 10; // Give cross extra weight
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