// Code your design here

/*
  (1)covergroup 可輸入引數
  (2)修改覆蓋率報告的option (但EDA playground上不一定有顯示, 例如comment)
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
    rand bit [2:0] port;
    rand bit [2:0] port_a, port_b;
    rand bit [3:0] kind; // 0:15
  endclass
  Transaction tr;
  
  //ex9.38
  covergroup CoverPort (int mid);
    //ex9.40
    option.per_instance = 1; //預設關閉
    option.comment = $psprintf("%m"); //option影響個別結果
    //ex9.41
    type_option.comment = "Section 3.2.14 Port numbers"; //type_option影響global結果
    coverpoint tr.port {
      bins lo = {[0:mid-1]};
      bins hi = {[mid:$]};
    }
  endgroup
  CoverPort cp;

  //ex9.39
  covergroup CoverPortSelect (ref bit [2:0] port, input int mid, string comment);
    //ex9.42
    option.per_instance = 1; //預設關閉
    option.comment = comment; //option影響個別結果
    coverpoint port {
      bins lo = {[0:mid-1]};
      bins hi = {[mid:$]};
    }
  endgroup
  CoverPortSelect cpa, cpb;

  //ex9.43 & ex9.44
  covergroup CoverPortTarget;
    option.per_instance = 1; //預設關閉
    port: coverpoint tr.port;
    kind: coverpoint tr.kind;
    cross kind, port;
    option.cross_num_print_missing = 1_000; //顯示沒有被命中的bin
    option.goal = 90; //判斷cover或uncover的基準
  endgroup
  CoverPortTarget ct;

  initial begin
    tr = new();
    cp = new(5); // lo=0:4, hi=5:7
    cpa = new(tr.port_a, 4, "4:4 port"); // port_a, lo=0:4, hi=5:7
    cpb = new(tr.port_b, 2, "2:6 port"); // port_b, lo=0:1, hi=2:7
    ct = new();
    repeat (32) begin
      assert(tr.randomize);
      cp.sample(); // Gather coverage
      cpa.sample();
      cpb.sample();
      ct.sample();
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