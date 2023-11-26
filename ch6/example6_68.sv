// Code your design here

/* 自定義偽隨機數發生器(PRNG) */

module my_class;
  reg[31:0] state = 32'h12345678; //8*4
  function logic[31:0] my_random;
    logic[63:0] s64;
    s64 = state * state;
    state = (s64 >> 16) + state;
    my_random = state;
  endfunction
  
  initial begin
    my_random();
    $display(state);
  end
endmodule