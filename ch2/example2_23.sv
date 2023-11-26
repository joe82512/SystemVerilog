// Code your design here
module my_vector;
  
/* 與書中結果不同 */

bit on[10];
int total;

initial begin
  foreach (on[i]) begin
    on[i] = i;
  end
     
  $display("on.sum=%0d", on.sum); //[0,1,0,1,0,1,...]
  
  $display("on.sum=%0d", on.sum+32'd0); //still 1, not 5
  
  total = on.sum;
  $display("total=%0d", total); //1, not5
  
  if (on.sum>=32'd5) //False
    $display("sum has 5 or more 1;s");
  
  $display("int sum=%0d", on.sum with (int'(item)) ); // 5
  
end

endmodule