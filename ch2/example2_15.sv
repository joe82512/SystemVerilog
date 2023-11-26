// Code your design here
module my_vector;
  
initial begin
  /* 
     仿真器通常會以32bit為一個word去存放 ; 
     因此非合併會產生 32-bits * 4 , 但每一個word(32)只用到 8 而已 ;
     合併數組則是產生 (8*4)-bits * 1 , 壓縮為一個word(32)
  */
  bit [7:0] b_unpack[4];  //非合併數組,例 2.6
  bit [3:0][7:0] bytes;   //合併數組
  bit [3:0][7:0] barray[3]; //(8*4)-bits * 3
  
  bytes = 32'hCafe_Dada; //[ca,fe,da,da]
  $displayh (
    bytes,,     //cafedada
    bytes[3],,  //ca
    bytes[3][7] //1 <= [1100 1010]
  );
  
  
  barray[0] = 32'h0123_4567; //[01,23,45,67]
  barray[1] = 32'h1111_1111;
  $displayh (
    barray[0],,      //01234567
    barray[1],,      //11111111
    barray[0][1],,   //45
    barray[0][1][2]  //1 <= [0100 0101]
  );
  
end

endmodule