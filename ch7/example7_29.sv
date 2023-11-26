// Code your design here

/*
  等待多個事件: wait fork會等待所有的子thread結束
  用多組 event.triggered 分別阻塞
  並改為計數器 wait
  且不用 event
*/

class Generator;
  static int thread_count = 0; //靜態變數
  
  task run();
    thread_count++; //create flag
    fork
      begin
        // ...
        $display("Run start");
        // -> done;
        $display("Run stop");
        thread_count--; //clear flag
      end
    join_none
  endtask
  
endclass

parameter N_GENERATORS = 3;
program automatic test;
  event done[N_GENERATORS];
  Generator gen[N_GENERATORS];

  initial begin
    // Create N generators
    foreach (gen[i])
      gen[i] = new();
    
    // Start them running
    foreach (gen[i])
      gen[i].run();

    wait (Generator::thread_count == 0);
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