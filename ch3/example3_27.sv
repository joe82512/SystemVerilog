// Code your design here

`timescale 1ps/1ps // 時間單位(整數)/時間精度(小數)
module ps;
  initial begin
    real rdelay = 800fs;      // 以0.800儲存
    time tdelay = 800fs;      // 捨入後得到 1 , 因為"時間單位"1ps 且time為整數
    $timeformat(-15, 0, "fs", 5);
    #rdelay;                  // 時延後得到 1ps , 因為"時間精度"1ps 必須捨入
    $display("%t", rdelay);   // "800fs"
    $display("real: %t", $realtime); //實際上走 1ps
    #tdelay;                  // 再次延時 1ps
    $display("%t", tdelay);   // "1000fs"
    $display("real: %t", $realtime); //實際上走 1+1=2ps
  end
endmodule