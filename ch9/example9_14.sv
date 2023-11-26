// Code your design here

/* 
  自定義 Bin -> 分類
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
    rand bit [2:0] hdr_len;     // [0:7]
    rand bit [3:0] payload_len; // [0:15]
    rand bit [3:0] kind;        // [0:15]
    rand int i;
  endclass
  Transaction tr;
  
  covergroup CovAll;
    //ex9.14
    len16: coverpoint (tr.hdr_len + tr.payload_len); //0~15
    len32: coverpoint (tr.hdr_len + tr.payload_len + 5'b0); //0~31, 2^5=32
    //ex9.15
    len: coverpoint (tr.hdr_len + tr.payload_len + 5'b0) { bins len[] = {[0:23]}; } //0~23
    //ex9.17
    kind: coverpoint tr.kind {
      bins zero = {0};     // 1 bin for kind==0
      bins lo = {[1:3],5}; // 1 bin for values 1:3 and 5
      bins hi[] = {[8:$]}; // 8 separate bins
      bins misc = default; // 1 bin for all the rest
    }
    //ex9.19
    int_signed: coverpoint tr.i {
      bins neg = {[$:-1]};
      bins zero = {0};
      bins pos = {[1:$]};
    }
  endgroup // CovAll
  CovAll ck;

  initial begin
    tr = new();
    ck = new(); //實例化
    repeat (32) begin
      assert(tr.randomize);
      // ifc.cb.port <= tr.port;
      // ifc.cb.data <= tr.data;
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