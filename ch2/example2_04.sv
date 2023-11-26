// Code your design here
module my_vector;
   
// 固定長度 vector
int lo_hi[0:15];      //int (16,1)
int c_style[16];      //int (16,1)
int array2[0:7][0:3]; //int (8,4)
integer array4[2][2]; //(2,2)

// 常數 vector
int ascend[8] = '{0,1,2,3,4,5,6,7};

initial begin
  array2[7][3] = 1; // set
  $display("array2(7,3)", array2[7][3]); //1
  
  /* 越界的default 雙狀態為0, 四狀態為X, wire的無驅動輸出為Z */
  $display("array2(7,4)", array2[7][4]); //0, default
  $display("X :", array4[2][2]); //x, default
  
  /* for loop */
  ascend[1:3] = '{11,22,33}; //[0,11,22,33,4,5,6,7]
  for (int i=0; i<$size(ascend); i++)
    $display("ascend[%0d]=%0d", i, ascend[i]);
  
  ascend[4:7] = '{4{8}}; //[0,11,22,33,8,8,8,8]
  foreach (ascend[i])
    $display("ascend[%0d]=%0d", i, ascend[i]);

end

endmodule