// Code your design here

/*
  用 typedef 定義 virtual interface 為 type , 類似 global 作用
*/

//ex10.16
interface X_if (input logic clk);
logic [7:0] din, dout;
logic reset_l, load;

clocking cb @(posedge clk);
  output din, load;
  input dout;
endclocking

always @cb
  $strobe("@%0t:%m: out=%0d, in=%0d, ld=%0d, r=%0d", $time, dout, din, load, reset_l);

modport DUT (input clk, din, reset_l, load,
             output dout);
modport TB (clocking cb, output reset_l);
endinterface

//ex10.17
// Simple 8-bit counter with load and active-low reset
module dut(X_if.DUT xi);
logic [7:0] count;
assign xi.dout = count;
always @(posedge xi.clk or negedge xi.reset_l) begin
  if (!xi.reset_l) count <= 0;
  else if (xi.load) count <= xi.din;
  else count <= count+1; //計數
end
endmodule

//ex10.18
parameter NUM_XI = 2; // Number of design instances

module top;
// Clock generator
bit clk;
initial begin
  clk <= 0;
  forever #20 clk = ~clk;
end

// Instantiate N interfaces
X_if xi [NUM_XI] (clk);

// Instantiate the testbench
test tb();

// Generate N DUT instances
generate
for (genvar i=0; i<NUM_XI; i++) begin:dut_blk
  dut d (xi[i]);
end
endgenerate
endmodule:top

//ex10.21 -> 定義 virtual interface 為 type
typedef virtual X_if.TB vx_if;

//ex10.22 -> 不用重新定義 virtual interface
class Driver; //VCS必須寫在調用前, Mentor Questa不用
vx_if xi;   //VCS要指定X_if.TB, Mentor Questa不用
int id;

function new(vx_if xi, int id);
  this.xi = xi;
  this.id = id;
endfunction

task reset();
  $display("@%0t: %m: Start reset [%0d]", $time, id);

  // Reset the device
  xi.reset_l <= 1;
  xi.cb.load <= 0;
  xi.cb.din <= 0;
  @(xi.cb) xi.reset_l <= 0;
  @(xi.cb) xi.reset_l <= 1;
  $display("@%0t: %m: End reset [%0d]", $time, id);
endtask:reset

task load_op();
  $display("@%0t: %m: Start load [%0d]", $time, id);
  // ##1 xi.cb.load <= 1; //Mentor Questa 要定義default clocking, VCS不用
  repeat(1) @xi.cb;
  xi.cb.load <= 1;
  xi.cb.din <= id + 10;
  
  // ##1 xi.cb.load <= 0;
  repeat(1) @xi.cb;
  xi.cb.load <= 0;
  repeat(5) @(xi.cb);
  $display("@%0t: %m: End load [%0d]", $time, id);
endtask:load_op
endclass    

//ex10.21 -> 不用重新定義 virtual interface
program automatic test;
vx_if vxi[NUM_XI]; // Virtual ifc array
Driver driver[];

initial begin
  // Connect local virtual interface to top
  vxi = top.xi;
  
  // Create N drivers
  driver = new[NUM_XI];
  foreach (driver[i]) begin
    driver[i] = new(vxi[i], i);
  end

  foreach (driver[i]) begin
    automatic int j = i; //Mentor Questa 要定義automatic, VCS不用
    fork
      begin
        driver[j].reset();
        driver[j].load_op();
      end
    join_none
  end

  repeat (10) @(vxi[0].cb);
end
endprogram

