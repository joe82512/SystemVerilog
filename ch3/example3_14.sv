// Code your design here
module my_task;
  
/* 注意引數的方向會繼承上一個 , 最好都定義 ref or inpiut? */

task many(input int a=1, b=2, c=3, d=4);
  $display("%0d %0d %0d %0d", a,b,c,d);
endtask

initial begin
  many(6,7,8,9);
  many();
  many(.c(5));    //c=5
  many(,6,.d(8)); //b=6,d=8
end

endmodule