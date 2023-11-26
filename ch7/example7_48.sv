// Code your design here

/* 測試平台(有缺) */

class Agent;
  mailbox gen2agt, agt2drv;
  Transaction tr;

  function new(mailbox gen2agt, agt2drv);
    this.gen2agt = gen2agt;
    this.agt2drv = agt2drv;
  endfunction

  task run();
    forever begin
      gen2agt.get(tr); //從上層取得 Task
      // ...
      agt2drv.put(tr); //傳遞 Task 往下層
    end
  endtask

  task wrap_up;
      // Empty for now
  endtask
  
endclass

class Config;
  bit[31:0] run_for_n_trans;
  constraint reasonable { run_for_n_trans inside {[1:1000]} };
endclass

class Environment;
  Generator gen;
  Agent agt;
  Driver drv;
  Monitor mon;
  Checker chk;
  Scoreboard scb;
  Config cfg;
  mailbox gen2agt, agt2drv, mon2chk;

  extern function new();
  extern function void gen_cfg();
  extern function void build();
  extern task run();
  extern task wrap_up();
  
endclass
  
  function Environment::new();
    cfg = new();
  endfunction
  
  function void Environment::gen_cfg();
    assert(cfg.randomize);
  endfunction
  
  function void Environment::build();
    // init mailbox
    gen2agt = new();
    agt2drv = new();
    mon2chk = new();
    
    // init Task
    gen = new(gen2agt);
    agt = new(gen2agt, agt2drv);
    drv = new(agt2drv);
    mon = new(mon2chk);
    chk = new(mon2chk);
    scb = new();
  endfunction
  
  task Environment::run;
    fork
      gen.run(run_for_n_trans);
      agt.run();
      drv.run();
      mon.run();
      chk.run();
      scb.run(run_for_n_trans);
    join
  endtask

  task Environment::wrap_up;
    fork
      gen.wrap_up();
      agt.wrap_up();
      drv.wrap_up();
      mon.wrap_up();
      chk.wrap_up();
      scb.wrap_up();
    join
  endtask


program automatic test;
  Environment env;

  initial begin
    env = new();
    env.gen_cfg();
    env.build();
    env.run();
    env.wrap_up();
  end
endprogram