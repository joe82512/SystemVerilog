// Code your design here

/*
  event 可作為參數傳遞
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
        -> done; //this.done
        $display("Run stop");
      end
    join_none
  endtask
  
endclass

program automatic test;
  event gen_done;
  Generator gen;
  initial begin
    gen = new(gen_done);      // Instantiate testbench
    gen.run();                // Run transactor
    wait(gen_done.triggered); // Wait for finish, triggered 不能加 ()
  end
endprogram
    
/*
  Run start
  Run stop
*/