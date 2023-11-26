// Code your design here
module my_function;
  
/* 
  func 定義返回類型類似 C++ , 
  return 在 task 中也可以作 early break
*/

// example 3.20
typedef int fixed_array5[5];
fixed_array5 f5;

function fixed_array5 init1 (int start); //返回定義結構
  foreach (init1[i]) //掃init1
    init1[i] = i+start;
endfunction

// example 3.21
function void init2 (ref int f[5], input int start);
  foreach (f[i]) //掃f
    f[i] = i+start;
endfunction

int fa[5];

initial begin
  // example 3.20
  f5 = init1(5); //copy , 性能差
  foreach (f5[i])
    $display("f5[%0d]=%0d", i, f5[i]);
  
  // example 3.21
  init2(fa,5); //ref , 性能較好
  foreach (fa[i])
    $display("fa[%0d]=%0d", i, fa[i]);
  
end

endmodule