// Code your design here
module my_vector;
  
initial begin
  
  byte twoD[4][6];
  // create 2D vector
  foreach(twoD[i,j])
    twoD[i][j] = i*10+j;

  // show vector
  foreach (twoD[i]) begin //只掃i
    $write("%2d:",i); //給$display
    foreach(twoD[,j]) // 只掃j
      $write("%3d",twoD[i][j]);
    $display;
  end
  
end

endmodule