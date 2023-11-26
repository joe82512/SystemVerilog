// Code your design here
module my_function;
  
/* ref:節省資源 , 建議用於automatic函數 */

// 用const能防止func改到a[]
function void print_checksum (const ref bit[31:0] a[]);
  bit [31:0] checksum = 0;
  for (int i=0;i<a.size();i++)
    checksum ^= a[i];
  $display("The array checksum is %0d", checksum);
endfunction

initial begin
  
  bit [31:0] a[] = '{0,10,10,8,8}; //不能用定長數組
  print_checksum(a); //pair XOR = 0
  
end

endmodule