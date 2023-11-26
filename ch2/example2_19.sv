// Code your design here
module my_deque;
  
int j = 1;
int q2[$] = {3,4}; //deque,不用 '{},且性能較動態vector好
int q[$] = {0,2,5};

initial begin
  
  q.insert(1,j); //{0,1,2,5} 不能用 new 重新分配
  // q.insert(3,q2); //{0,1,2,3,4,5} 但VCS不支援
  q = {q[0:2],q2,q[3:$]}; //{0,1,2,3,4,5} 同上,換寫法
  q.delete(1); //{0,2,3,4,5} 刪除位置1
  
  q.push_front(6); //{6,0,2,3,4,5}
  j = q.pop_back; //{6,0,2,3,4}
  q.push_back(8); //{6,0,2,3,4,8}
  j = q.pop_front; //{0,2,3,4,8}
  
  foreach (q[i])
    $display(q[i]); 
  q.delete(); //{} 清空

end

endmodule