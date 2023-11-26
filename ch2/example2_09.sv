// Code your design here
module my_vector;
  
int md[2][3] = '{'{0,1,2}, '{3,4,5}};

initial begin
  $display("Initial Value:");
  foreach (md[i,j]) //所有(i,j) ,先掃j再掃i
    $display("md[%0d][%0d]=%0d", i, j, md[i][j]);

  $display("New Value:");
  md = '{'{9,8,7}, '{3{32'd5}}}; //二維常數vector
  foreach (md[i,j])
    $display("md[%0d][%0d]=%0d", i, j, md[i][j]);
end

endmodule