// Code your design here

/* 建立多個 object */

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
  
  function void create (ref Transaction t); //ref !!!
    t = new();
    t.addr = 42;
  endfunction
    
  task transmit (Transaction t);
    // CBbus.rx_data <= t.data;
    t.stats.startT = $time;
    $display("addr=%0d",t.addr);
  endtask
  
  // ex5.27
  task generator_good(int n);
    Transaction t;
    repeat(n) begin
      t = new(); //object在這裡實例
      t.addr = $random();
      // $display("Sending addr=%0d",t.addr); //已放在transmit
      transmit(t);
    end
  endtask
  
  // ex5.28
  task generator();
    Transaction tarray[10]; //書上寫錯
    foreach (tarray[i]) begin
      tarray[i] = new(); //object在這裡實例
      tarray[i].addr = i;
      transmit(tarray[i]);
    end
  endtask
    
    
  initial begin
    generator_good(10);
    $display("=== ARRAY ===");
    generator();
  end
  
endmodule