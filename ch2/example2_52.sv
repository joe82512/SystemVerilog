// Code your design here
module my_c;
  
const byte colon = ":"; //常數
string s; //字串
bit[7:0] b8;
bit one = 1'b1;

task my_log(string message);
  $display("@%0t: %s", $time, message); //把信息打印到日志里
endtask

initial begin
  s = "IEEE ";
  $display(s.getc(0)); //73 , ascii('I')
  $display(s.tolower()); //ieee 

  s.putc(s.len()-1, "-"); //replace(s[-1],"-")
  s = {s, "P1800"}; //IEEE-P1800
  $display(s);
  $display(s.substr(2,5)); // EE-P
  
  // task
  my_log($psprintf("%s %5d", s, 42)); //$psprintf 轉string 
  
  // 位元寬度
  $displayb(one + one);            // A；1+1=0
  b8 = one + one;
  $displayb (b8);                  // B：1+1=2 . 8-bit
  $displayb(one + one + 2'b0);     // C：1+1=2 , 靠常數 2-bit
  $displayb(2'(one) + one);        // D：1+1=2 , 靠靜態轉換 2-bit
end

endmodule