// Code your design here

/* 偽隨機數發生器 PRNG and seed: 建立隨機環境 */

//ex6.71
class eth_cfg;
  rand bit[3:0] in_use;
  rand bit[47:0] mac_addr[4];
  rand bit[3:0] is_100; //100MB mode
  rand bit[31:0] run_for_n_frames;
  //在 unicast 模式設置地址
  constraint local_unicast {
    foreach (mac_addr[i])
      mac_addr[i][41:40] == 2'b00;
  }
  //限制測試長度
  constraint reasonable {
    run_for_n_frames inside {[1:100]};
  }
endclass:eth_cfg

class eth_src;
  function void run;
    // ...
  endfunction
endclass:eth_src

class eth_mii;
  function void set_speed(int speed);
    // ...
  endfunction
endclass:eth_mii


//ex6.72 隨機化環境
class Environment;
  eth_cfg cfg;
  eth_src gen[4];
  eth_mii drv[4];

  function new();
    cfg = new();
  endfunction

  function void gen_cfg; //後續才隨機化, 不要寫在new()裡
    assert(cfg.randomize());
  endfunction

  function void build;
    foreach (gen[i])
      if (cfg.in_use[i]) begin
        gen[i] = new();
        drv[i] = new();
        if (cfg.is_100[i])
          drv[i].set_speed(100);
      end
  endfunction

  task run();
    foreach(gen[i])
      if (cfg.in_use[i]) begin
        gen[i].run();
        //...
      end
  endtask

  task wrap_up();
    //...
  endtask
endclass:Environment


//ex6.73 隨機配置的測試
program test;
  Environment env;
  
  initial begin
    env = new();
    env.gen_cfg; //隨機化設置
    
    //修改隨機值: 4ports全開
    env.cfg.in_use = 4'b1111;
    
    env.build(); //建立環境
    env.run();   //測試
    env.wrap_up();
  end
endprogram