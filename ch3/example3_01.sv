// Code your design here
module my_program;
 
initial begin:example //begin後可加label提高可讀性
  
  integer array[10], sum, j;
  
  for (int i=0;i<10;i++)
    array[i] = i;
  
  sum = array[9]; //{0,1,2,3, ... ,9}
  j = 8;
  
  // do while
  do begin //more than 1-line
    sum += array[j]; //9+8+...+0
    $display("j=%0d", j); //8~0
  end
  while (j--);
  
  $display("Sum=%4d", sum); //45
  
end:example

endmodule