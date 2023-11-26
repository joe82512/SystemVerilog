// Code your design here
module my_struct;
  
/*
  經常對整體操作         -> 合併結構
  經常對結構內單一操作    -> 非合併結構
  不同格式對同一寄存器操作 -> 聯合結構
*/

initial begin
  // 定義新的數據結構
  typedef struct {int a;
                  byte b;
                  shortint c;
                  int d ;} my_struct_s;

  // 聯合結構: 不同格式的數據放在同一位置上 , 單純省空間建議用class或合併vector
  // unpack union 的 Compile Options 要加-lca , VCS才能跑
  typedef union {int i; real f;} num_u;

  // 合併結構 packed: 連續放置 , 比非合併省空間
  typedef struct packed {bit[7:0] r, g, b;} pixel_p_s;

  
  my_struct_s st = '{32'haaaa_aaaad,
                     8'hbb,
                     16'hcccc,
                     32'hdddd_dddd};
  num_u un;
  pixel_p_s my_pixel; // 注意定義順序 , 不能把 pixel_p_s my_pixel往下放
  
  un.f = 0.0;
  
  $display("str = %x %x %x %x ", st.a, st.b, st.c, st.d);
  
end

endmodule