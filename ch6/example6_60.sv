// Code your design here

/* 約束問題: 隨機唯一值 */


// ex6.60: 唯一值發生器
class RandcRange;
  randc bit[15:0] value;
  int max_value;
  
  function new(int max_value=10);
    this.max_value = max_value;
  endfunction
  
  constraint c_max_value { value < max_value; }
endclass

// ex6.61: 產生唯一值的class
class UniqueArray;
  int max_array_size, max_value;
  rand bit[7:0] a[];
  constraint c_size { a.size() inside {[1:max_array_size]}; }
  
  function new(int max_array_size=2, max_value=2);
    this.max_array_size = max_array_size;
    if (max_value < max_array_size)
      this.max_value = max_array_size; //擴增value上限, 才能塞滿唯一值
    else
      this.max_value = max_value;
  endfunction
  
  function void post_randomize; //覆寫post_randomize
    RandcRange rr;
    rr = new(max_value);
    foreach (a[i]) begin
      assert(rr.randomize());
      a[i] = rr.value;
      $display(a[i]);
    end
  endfunction
  
  function void display();
    $write("Size[%3d]:", a.size());
    foreach(a[i])
      $write("%4d ",a[i]);
    $display;
  endfunction
endclass

// ex6.62: program
program automatic test;
  UniqueArray ua;
  
  initial begin
    ua = new(10); //array size
    repeat(10) begin
      //ua.post_randomize();  //為何不用調用? -> 對rand起作用的是randomize()
      assert(ua.randomize()); //randomsize會同時使用, 覆寫!
      ua.display();
    end
  end
endprogram