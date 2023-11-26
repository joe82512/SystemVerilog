// Code your design here

/* 
  配合約束的覆蓋率 : 注意解的概率
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
    rand bit [2:0] hdr_len; //0~7
    rand bit [3:0] payload_len; //0~15
    rand bit [4:0] len; //0~31, 但最高只有22

    constraint length {
      len == hdr_len + payload_len;          //ex9.45 -> 約束len的產生
      solve len before hdr_len, payload_len; //ex9.46 -> 約束len的解
    }
  endclass
  Transaction tr;
  
  covergroup CovLen;
    coverpoint tr.len { bins len[] = {[0:22]}; }
  endgroup
  CovLen ck;

  initial begin
    tr = new();
    ck = new(); //實例化
    repeat (10000) begin
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