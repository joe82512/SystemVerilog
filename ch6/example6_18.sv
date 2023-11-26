// Code your design here

/* inside盡量不要動態調整,性能差 -> 取唯一隨機值用randc */

module my_random;
  class RandcInside;
    int array[];
    randc bit[15:0] index;
    
    function new(input int a[]);
      array = a;
    endfunction
    
    function int pick();
      return array[index];
    endfunction
    
    constraint c_size {index<array.size;}
  endclass:RandcInside

  RandcInside ri;
  initial begin
    ri = new('{1,3,5,7,9,11,13});
    repeat(ri.array.size) begin
      assert(ri.randomize());
      $display("Picked %2d [%0d]", ri.pick(),ri.index);
    end
  end
endmodule;