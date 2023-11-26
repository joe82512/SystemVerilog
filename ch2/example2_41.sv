// Code your design here
module my_transfer;
  
int i;
real f;

int h;
bit[7:0] b, g[4], j[4]='{8'ha,8'hb,8'hc,8'hd};
bit[7:0] q, r, s, t;

bit[15:0] wq[$] = {16'h1234, 16'h5678}; //deque
bit[7:0] bq[$];

typedef struct {int a;
                byte b;
                shortint c;
                int d;} my_struct_s;
my_struct_s st = '{32'haaaa_aaaa,
                   8'hbb,
                   16'hcccc,
                   32'hdddd_dddd};
byte b_arr[];

initial begin

  // 靜態轉換: 不檢查數值,非強制轉換
  i = int '(10.0 - 0.1); //四捨五入進位: 9.9->10, 9.4->9
  // i = (10.0 - 0.1); //同上
  f = real '(42);
  // f = 42; //同上
  $display("i=%0d,f=%0f", i, f);
  
  // 不能直接拆bit給非合併vector , 要用<<或>>
  h = {>> { j }};              // 0a0b0c0d
  $displayh(h);
  h = {<< { j }};              // b030d050 , d=[1101] <-> b=[1011]
  $displayh(h);
  h = {<< byte { j }};         // 0d0c0b0a
  $displayh(h);
  g = {<< byte { j }};         // [0d,0c,0b,0a]
  $displayh(g);
  b = {<< { 8'b0011_0101 }};   // 1010_1100
  $displayb(b);
  b = {<< 4 { 8'b0011_0101 }}; // 0101_0011 , 4個一組做群倒序
  $displayb(b);
  {>> {q, r, s, t}} = j;       // 0a0b0c0d , 分配
  $displayh(q,r,s,t);
  h = {>> {t, s, r, q}};       // 0d0c0b0a , 集合
  $displayh(h);
  
  // 不同長度的賦值分配
  bq = {>> { wq }};            // [12,34,56,78]
  $displayh(bq);
  bq = {8'h98, 8'h76, 8'h54, 8'h32};
  wq = {>> { bq }};            // [9876,5432]
  $displayh(wq);
  
// 不同結構賦值分配
  b_arr = {>> { st }};         // [aa,aa,aa,aa,bb,cc,cc,dd,dd,dd,dd]
  foreach(b_arr[i])
    $display("b_arr[%0d]=%0h",i,b_arr[i]);
  b_arr = '{8'h11, 8'h22, 8'h33, 8'h44, 8'h55,8'h66, 8'h77,
            8'h88, 8'h99, 8'haa, 8'hbb};
  st = {>> { b_arr }} ;        // 11223344,55,6677,8899aabb
  $display("st[a]=%0h",st.a);
  $display("st[b]=%0h",st.b);
  $display("st[c]=%0h",st.c);
  $display("st[d]=%0h",st.d);
  
end

endmodule