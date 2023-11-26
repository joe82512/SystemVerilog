// Code your design here
module timing;
  
timeunit 1ns;
timeprecision 1ps;

initial begin
  $timeformat(-9, 3, "ns", 8); //(ns,小數點,單位,顯示數值的最小寬度)
  #1     $display("%t", $realtime);   //1.000ns
  #2ns   $display("%t", $realtime);   //3.000ns
  #0.1ns $display("%t", $realtime);   //3.100ns
  #41ps  $display("%t", $realtime);   //3.141ns
end

endmodule