// Code your design here

/* 約束問題: 隨機唯一值 */


// ex6.57: 產生地增值
class Ascend;
  rand bit[7:0] d[10]; //uint FAIL
  constraint c {
    foreach (d[i])
      if (i>0)
        d[i] > d[i-1];
  }
  function void display();
    $write("sum=%4d, val=", d.sum);
    foreach(d[i])
      $write("%4d ",d[i]);
    $display;
  endfunction
endclass

// ex6.58: 產生唯一值, 但很慢
class UniqueSlow;
  rand bit[7:0] ua[10];
  constraint c {
    foreach (ua[i])
      foreach (ua[j])
        if (i!=j)
          ua[i] != ua[j];
  }
  function void display();
    $write("sum=%4d, val=", ua.sum);
    foreach(ua[i])
      $write("%4d ",ua[i]);
    $display;
  endfunction
endclass

// ex6.59: 產生唯一值, 用randc
class randc8;
  randc bit[7:0] val;
endclass

class LittleUniqueArray;
  bit[7:0] ua[10];
  
  function void pre_randomize;
    randc8 rc8;
    rc8 = new();
    foreach (ua[i]) begin
      assert(rc8.randomize());
      ua[i] = rc8.val;
    end
  endfunction
  
  function void display();
    $write("sum=%4d, val=", ua.sum);
    foreach(ua[i])
      $write("%4d ",ua[i]);
    $display;
  endfunction
endclass


program automatic test;
  Ascend a; //ex6.57
  //UniqueSlow a; //ex6.58
  LittleUniqueArray l; //ex6.59
  
  initial begin
    a = new();
    l = new();
    repeat(10) begin
      assert(a.randomize());
      a.display();
      
      l.pre_randomize();
      l.display();
    end
  end
endprogram