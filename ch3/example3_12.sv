// Code your design here
module my_function;
  
/* parameter default */

function void print_checksum (ref bit[31:0] a[],
                              input bit[31:0] low=0,
                              input int high=-1);
  bit [31:0] checksum = 0;
  // checksum = 0; //重新賦值強制重置 , 書上沒寫
  $display("now checksum: %0d", checksum); //checksum繼承上一次
  
  if (high==-1 || high>=a.size())
    high=a.size()-1;
  
  for (int i=low;i<=high;i++)
    checksum ^= a[i]; //書上用+= , 這裡仿ex3.10
  $display("The array checksum is %0d", checksum);
endfunction

initial begin
  
  bit [31:0] a[] = '{0,10,10,8,8}; //不能用定長數組
  print_checksum(a);               //pair XOR = 0
  print_checksum(a,2);             //10 = [2:$] =>  0^10 = 10
  print_checksum(a,,3);            // 8 = [$:3] => 10^8  = 2
  print_checksum(a,2,3);           // 2 = [2:3] =>  2^2  = 0
  
end

endmodule