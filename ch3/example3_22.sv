// Code your design here
module my_program;
  
/* 從 ex3.21 改寫: 用 automatic 解決 ; task寫法第四章更完整 */

/*
  局部變數其實在仿真前就已經建立 , 例如 checksum
  因此若沒聲明 automatic 自動儲存則會使用靜態儲存 ,
  會使用同一個 memory 儲存 (靜態儲存區),
  使用 automatic 會分開 memory 儲存 (stack儲存區)
  此外 "同時" 調用 task 也會造成參數競爭
*/

function automatic void print_checksum (ref bit[31:0] a[],
                              input bit[31:0] low=0,
                              input int high=-1);
  bit [31:0] checksum = 0;
  // checksum = 0; //重新賦值強制重置 , ex3.25 方法
  $display("now checksum: %0d", checksum); //checksum重新建立

  if (high==-1 || high>=a.size())
    high=a.size()-1;

  for (int i=low;i<=high;i++)
    checksum ^= a[i]; //書上用+= , 這裡仿ex3.10
  $display("The array checksum is %0d", checksum);
endfunction

initial begin

  bit [31:0] a[] = '{0,10,10,8,8}; //不能用定長數組
  print_checksum(a);               //pair XOR = 0
  print_checksum(a,2);             //10 = [2:$]
  print_checksum(a,,3);            // 8 = [$:3]
  print_checksum(a,2,3);           // 2 = [2:3]

end

endmodule