// Code your design here

/* this: 指向class本身 */

module my_class;
  class Scoping;
    string oname;
    
    function new(string oname);
      this.oname = oname;
    endfunction
    
  endclass
  
  initial begin
    Scoping scop;
    scop = new("A");
    $display(scop.oname); //A
  end
endmodule