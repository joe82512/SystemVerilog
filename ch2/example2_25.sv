// Code your design here
module my_func;
  
initial begin
  
  /* vector定位函數返回的是deque而非純量 */
  
  int f[6] = '{1,6,2,6,8,6}; //定長vector
  int d[] = '{2,4,6,8,10};   //可變長度vector
  int q[$] = '{1,3,5,7};     //deque
  int tq[$];                 //deque
  int count, total;          //純量
  
  tq = q.min();
  $write("min(q) = ");
  $write(tq);
  $display(); //'{1}
  
  tq = d.max();
  $write("max(d) = ");
  $write(tq);
  $display(); //'{10}
  
  tq = f.unique(); //set
  $write("unique(f) = ");
  $write(tq);
  $display(); //'{1, 6, 2, 8}
  
  // ex2.26
  tq = d.find with (item > 3); //filter
  $write("d[i]>3 = ");
  $write(tq);
  $display(); //'{4, 6, 8, 10}
  
  // filter 另一種寫法
  tq.delete();
  foreach (d[i])
    if (d[i] > 3)
      tq.push_back (d[i]);
  $display(tq); //'{4, 6, 8, 10}
  
  tq = d.find_index with (item > 3);
  $display(tq); //'{1, 2, 3, 4} 
  tq = d.find_first with (item > 99);
  $display(tq); //'{}
  tq = d.find_first_index with (item == 8);
  $display(tq); //'{3}
  tq = d.find_last with (item == 4);
  $display(tq); //'{4}
  tq = d.find_last_index with (item == 4);
  $display(tq); //'{1}
  
  // ex2.28
  d = '{9,1,8,3,4,4};
  count = d.sum with ((item>7)*1); //must *1
  total = d.sum with ((item>7)*item);
  $display("count=%0d ,total=%0d", count, total);
  count = d.sum with ((item<8)*1); //must *1
  total = d.sum with ((item<8)?item:0);
  $display("count=%0d ,total=%0d", count, total);
  
end

endmodule