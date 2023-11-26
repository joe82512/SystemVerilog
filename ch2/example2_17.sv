// Code your design here
module my_vector;
  
int dyn[],d2[]; //動態vector, 長度可調; 數據相同可跟定長vector賦值

initial begin
  
  dyn = new[5]; //必須 new 去分配
  
  foreach (dyn[j])
    dyn[j]=j;
  
  d2 = dyn;
  d2[0] = 5;
  $display (dyn[0],d2[0]); //0,5
  
  dyn = new[20](dyn);
  $display (dyn); //{0,1,2,3,4,5,0,0,0,...}
  dyn = new[100];
  dyn.delete(); //刪除全部element => 釋放空間
  
end

endmodule