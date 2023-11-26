// Code your design here
module my_vector;
  
initial begin
  
  bit [31:0] src[5] = '{5{5}}; //[5,5,5,5,5]
  
  $displayb ( //binary顯示
    src[0],, //101 兩個,,只是與下一個顯示分開
    src[0][0],, //1
    src[0][2:1] //10 [0]是vector [2:1]是位元
  );
  
end

endmodule