// Code your design here

/*
  停止thread衍生問題: 所有相同LABEL的thread都會被停掉
*/

program automatic test();
  parameter TIME_OUT = 20;
  task wait_for_time_out (int id);
    if (id==0)
      fork
        begin
          #2;
          $display("@%0t: disable wait_for_time_out", $time);
          disable wait_for_time_out; //造成此label的thread全關閉
        end
      join_none
    
    fork:just_a_little
      begin
        //#3; //若延時>2, 則不會執行, 因為task已關閉
        $display("@%0t: %m: %0d entering thread", $time,id);
        #TIME_OUT;
        $display("@%0t: %m: %0d done", $time,id);
      end
    join_none
    
  endtask
  
  initial begin
    wait_for_time_out(0);
    wait_for_time_out(1);
    wait_for_time_out(2);
    #(TIME_OUT*2) $display("@%0t: All done", $time);
  end
endprogram
    
/*
  @0: test.wait_for_time_out.just_a_little: 0 entering thread
  @0: test.wait_for_time_out.just_a_little: 1 entering thread
  @0: test.wait_for_time_out.just_a_little: 2 entering thread
  @2: disable wait_for_time_out
  @40: All done
*/