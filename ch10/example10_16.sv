// Code your design here

/*
  (1)virtual interface: 虛擬接口, 是handle 非object;
                        橋接靜態模組/接口與動態對象的唯一機制
  (2)XMR: 跨模組引用寫法 ;
          因為端口是用來傳遞不斷變化的數值,
          比起把端口作為引數, XMR更佳, 但兩者皆可
  (3)interface可以定義task, 但不建議->10.3

  註: 用不同 Simulator 可能會有不同語法錯誤(不夠嚴謹), 這裡主要用Questa
*/

//ex10.16 -> 8-bits counter
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

//ex10.17 -> DUT
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

//ex10.18 -> test harness
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

//ex10.20 -> Driver with virtual interface
class Driver;          //VCS必須寫在調用前, Mentor Questa不用
  virtual X_if.TB xi;  //VCS要指定X_if.TB, Mentor Questa不用
  int id;

  function new(virtual X_if.TB xi, int id);
    this.xi = xi;
    this.id = id;
  endfunction

  task reset();
    $display("@%0t: %m: Start reset [%0d]", $time, id);

    // Reset the device
    xi.reset_l <= 1;
    xi.cb.load <= 0;
    xi.cb.din <= 0;
    @(xi.cb) xi.reset_l <= 0; //20
    @(xi.cb) xi.reset_l <= 1; //20 +40
    $display("@%0t: %m: End reset [%0d]", $time, id);
  endtask:reset

  task load_op();
    $display("@%0t: %m: Start load [%0d]", $time, id);
    // ##1 xi.cb.load <= 1; //Mentor Questa 要定義default clocking, VCS不用
    repeat(1) @xi.cb; //60(reset) +40=100
    xi.cb.load <= 1;
    xi.cb.din <= id + 10;
    
    // ##1 xi.cb.load <= 0;
    repeat(1) @xi.cb; //60(reset)+40 +40=140
    xi.cb.load <= 0;
    repeat (5) @(xi.cb); //60(reset)+40+40 +40*5=340
    $display("@%0t: %m: End load [%0d]", $time, id);
  endtask:load_op
endclass    

//ex10.19 -> testbench
program automatic test;
  virtual X_if.TB vxi[NUM_XI]; // Virtual ifc array
  Driver driver[];

  initial begin
    // Connect local virtual interface to top
    vxi = top.xi; //XMR跨模組引用
    
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

    repeat (10) @(vxi[0].cb); //20+40*9=380
  end
endprogram

/*
  # @0: design_sv_unit.Driver.reset: Start reset [1]
  # @0: design_sv_unit.Driver.reset: Start reset [0]
  # @20:top.xi[0]: out=0, in=0, ld=0, r=0
  # @20:top.xi[1]: out=0, in=0, ld=0, r=0
  # @60: design_sv_unit.Driver.reset: End reset [0]
  # @60: design_sv_unit.Driver.load_op: Start load [0]
  # @60: design_sv_unit.Driver.reset: End reset [1]
  # @60: design_sv_unit.Driver.load_op: Start load [1]
  # @60:top.xi[0]: out=0, in=0, ld=0, r=1
  # @60:top.xi[1]: out=0, in=0, ld=0, r=1
  # @100:top.xi[0]: out=1, in=10, ld=1, r=1
  # @100:top.xi[1]: out=1, in=11, ld=1, r=1
  # @140:top.xi[0]: out=10, in=10, ld=0, r=1
  # @140:top.xi[1]: out=11, in=11, ld=0, r=1
  # @180:top.xi[0]: out=11, in=10, ld=0, r=1
  # @180:top.xi[1]: out=12, in=11, ld=0, r=1
  # @220:top.xi[0]: out=12, in=10, ld=0, r=1
  # @220:top.xi[1]: out=13, in=11, ld=0, r=1
  # @260:top.xi[0]: out=13, in=10, ld=0, r=1
  # @260:top.xi[1]: out=14, in=11, ld=0, r=1
  # @300:top.xi[0]: out=14, in=10, ld=0, r=1
  # @300:top.xi[1]: out=15, in=11, ld=0, r=1
  # @340: design_sv_unit.Driver.load_op: End load [0]
  # @340: design_sv_unit.Driver.load_op: End load [1]
  # @340:top.xi[0]: out=15, in=10, ld=0, r=1
  # @340:top.xi[1]: out=16, in=11, ld=0, r=1
*/