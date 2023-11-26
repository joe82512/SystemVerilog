// Code your testbench here
// or browse Examples

program automatic test;
  // include "design.sv" //不用加`
  `include "design.sv" constraint Packet::c_external {length==1;} //要加`
  
  Packet p;
  initial begin
    p = new();
    
    assert(p.randomize());
    $display(p.length);
	$display(p.payload);
  end
endprogram