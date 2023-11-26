// Code your design here

/* class裡調用class: class定義順序? */

module my_class;
  
  //ex5.22 : 可以讓Statistics比Transaction晚定義
  typedef class Statistics; //先聲明class , 不聲明則要考慮順序
  
  class Statistics;
    time startT, stopT;
    static int ntrans = 0;
    static time total_elapsed_time = 0;
    
    function time how_long;
      how_long = stopT - startT;
      ntrans++;
      total_elapsed_time += how_long;
    endfunction
    
    function void start;
      startT = $time;
      $display("set startT");
    endfunction
    
  endclass
  
  class Transaction;
    bit [31:0] addr,crc,data[8];
    Statistics stats;
    
    function new();
      stats = new(); //實例化
    endfunction
    
    task create_packet();
      stats.start();
    endtask
    
  endclass
  
  initial begin
    Transaction tr;
    tr = new();
    tr.create_packet(); //set startT
  end
  
endmodule