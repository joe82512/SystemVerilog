// Code your design here
module my_task;
  
/* 編譯失敗 , 無bus定義 */
/*
  task 可以消耗時間#100/wait/@...etc , function 不能
  子程序建議使用 function , 無論 task 或 function都可以調用
  但 function內只能用 fork...join 內調用 task !!!
*/

task bus_read(input logic [31:0] addr,
              ref   logic [31:0] data);
  bus.request = 1'b1; //請求bus並驅動addr
  @(posedge bus.grant) bus.addr = addr; //驅動addr
  @(posedge bus.enable) data = bus.data; //等待儲存器的數據
  bus.request = 1'b0; //釋放bus並等待許可
  @(negedge bus.grant);
endtask

logic [31:0] addr, data;

initial fork
  bus_read(addr, data);
  thread2: begin
    @data; //data變化時觸發
    $display("read %h from bus", data);
  end
join

endmodule