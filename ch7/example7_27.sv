// Code your design here

/*
  等待多個事件: wait fork會等待所有的子thread結束
  用多組 event.triggered 分別阻塞
*/

class Generator;
  event done;
  
  function new (event done); // Pass event from TB
    this.done = done;
  endfunction
  
  task run();
    fork
      begin
        // ...
        $display("Run start");
        -> done;
        $display("Run stop");
      end
    join_none
  endtask
  
endclass

parameter N_GENERATORS = 3;
program automatic test;
  event done[N_GENERATORS];
  Generator gen[N_GENERATORS];
  
  initial begin
    //create
    foreach (gen[i]) begin
      gen[i] = new(done[i]); // Create N generators
      gen[i].run();          // Start them running
    end
    
    // wait
    // Wait for all gen to finish by waiting for each event
    foreach (gen[i])
      fork
        automatic int k = i;
        wait(done[k].triggered);
      join_none
    
    wait fork; // Wait for all those triggers to finish
  end
endprogram
    
/*
  Run start
  Run stop
  Run start
  Run stop
  Run start
  Run stop
*/