// Code your design here
module my_hashmap;
  
int hashmap[string]; //{str:int} 開銷較大
int cnt=1;
string s_cnt;

initial begin
  bit [31:0] assoc[bit[31:0]]; //開銷小
  bit [31:0] idx = 1;
  // 建立稀疏元素
  repeat (32) begin
    $sformat(s_cnt, "%0d", cnt); //int轉文字
    hashmap[s_cnt] = idx;
    assoc[idx] = idx;
    idx = idx<<1; //1->2->4->8->...
    cnt++;
  end
  
  // 不能用for掃 , 要用foreach或.next()
  foreach (hashmap[s])
    $display("hashmap[%0s]=%0d",s,hashmap[s]);
  
  // foreach (assoc[i])
  //   $display("assoc[%h]=%h",i,assoc[i]);
  
  
  // 與foreach相同
  if (assoc.first(idx))
    begin
      do
        $display("assoc[%d]=%h",idx,assoc[idx]); //用%d比較好展示
      while (assoc.next(idx));
    end
  
  assoc.first(idx);
  assoc.delete(idx); //刪除第一個element
  $display("The array now has %0d elements",assoc.num); //31
  
end

endmodule