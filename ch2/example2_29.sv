// Code your design here
module my_sort;
  
initial begin
  
  int d[]='{9,1,8,3,4,4};
  struct packed {byte red, green, blue;} c[]; //自訂結構
  
  // ex 2.29
  d.sort(); //reverse(),rsort(),...etc
  foreach(d[i])
    $display("d[%0d]=%0d", i, d[i]);
  
  // ex 2.30
  c = new[10];
  foreach (c[i])
    c[i] = $urandom; //隨機賦值
  
  c.sort with (item.red); //根據red排序
  foreach (c[i])
    $display("r=%0d, g=%0d, b=%0d", c[i].red, c[i].green, c[i].blue);
  
  $display("---------------------");
  
  c.sort(x) with ({x.green,x.blue}); //根據green後blue排序
  foreach (c[i])
    $display("r=%0d, g=%0d, b=%0d", c[i].red, c[i].green, c[i].blue);
  
end

endmodule