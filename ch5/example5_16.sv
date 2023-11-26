// Code your design here

/* program 用於描述系統中不同module的交互 */
// $root.limit FAIL ?

module top;
  int limit=5; //$root.top.limit , 不能直接用$root.limit
endmodule
  
program automatic p;
  int limit=4; //$root.p.limit
  
  class Foo;
    int limit=3; //$root.p.Foo.limit
    int array[];
    
    function void print (int limit=2); //$root.p.Foo.print.limit
      for (int i=0; i<limit; i++) begin
        array[i] = i;
        $display("array[%0d]=%0d",i,array[i]);
      end
    endfunction
  endclass
  
  initial begin
    //完全不寫 //$root.p.limit -> 4
    // int limit = $root.top.limit; //$root.top.limit -> 5
    Foo bar;
    
    bar = new;
    bar.array = new[limit];
    bar.print(limit);
    // bar.print(bar.limit); //$root.p.Foo.limit -> 3
    // bar.print(); //$root.p.Foo.print.limit -> 2
  end
  
endprogram