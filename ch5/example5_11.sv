// Code your design here

/* 靜態方法(func): 讀寫靜態變數 */

typedef enum {MODE_ON, MODE_OFF} MODE_E;

class Config;
  MODE_E mode;
  
  function new(MODE_E m);
    mode = m;
  endfunction
endclass


module my_class;
 
  class Transaction;
	static Config cfg;  //靜態變數
  static int count=0;
	MODE_E mode;
    
	function new();
      mode = cfg.mode;
	endfunction
    
    // 靜態方法
    static function void display_statics();
      $display("Transaction cfg.mode=%s,count=%0d",cfg.mode.name(),count);
      count++;
    endfunction
    
  endclass
  
  Config cfg;
  initial begin
    cfg = new(MODE_ON);             //實例化, 並設定MODE_ON
    Transaction::cfg = cfg;         //直接設置靜態變數
    Transaction::display_statics(); //Transaction cfg.mode=MODE_ON,count=0
    
    cfg = new(MODE_OFF);            //實例化, 並設定MODE_OFF
    Transaction::cfg = cfg;         //直接設置靜態變數
    Transaction::display_statics(); //Transaction cfg.mode=MODE_OFF,count=1
  end
  
endmodule