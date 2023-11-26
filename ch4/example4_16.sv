// Code your design here

/* 
  DUT 跟 TEST 的競爭: (1)#n延遲 (2)時間劃分區塊4.4.4
*/

module memory(input wire start,write,
              input wire[7:0] addr,data);
  logic[7:0] mem[256];
  always @(posedge start) begin //抓取 start 上升沿
    if (write) begin
      mem[addr] <= data;
      $display("addr=%0h, data=%0h", addr, data);
    end
    // ...
  end
endmodule


module test(output logic start,write,
            output logic[7:0] addr,data);
  initial begin
    start = 0;
    write = 0;
    #10;       //延遲去防止競爭
    addr = 8'h42;
    data = 8'h5a;
    start = 1; //start posedge 時 addr/data/write 是否已改變? -> 競爭
    write = 1;
    // ...
    #10;
    start = 0;
    write = 0;
    #10;
    addr = 8'h22;
    data = 8'haa;
    start = 1;
    write = 1;
  end
  
endmodule


module top;
  logic start,write;
  logic[7:0] addr,data;
  bit clk,rst;

  memory m1(start,write,addr,data);
  test t1(start,write,addr,data);
  
  initial begin
    #100;
    $finish;
  end
endmodule