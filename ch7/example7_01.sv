// Code your design here

/*
  fork join: 子thread執行, 等待全部完成後繼續主thread
  fork join_any: 子thread執行, 任一thread完成後繼續主thread
  fork join_none: 子thread執行, 並繼續主thread
*/

program fork_test;
  initial begin
    $display("@%0t: start fork...join example", $time);
    #10 $display("@%0t: sequential after #10", $time);
    fork
      #5  $display("@%0t: parallel start", $time);    //較好分辨的test case
      #50 $display("@%0t: parallel after #50", $time);
      #10 $display("@%0t: parallel after #10", $time);
      begin
        #30 $display("@%0t: sequential after #30", $time);
        #10 $display("@%0t: sequential after #10", $time);
      end
    join
    //join_none
    //join_any
    $display("@%0t: after join", $time);
    #80 $display("@%0t: finish after #80", $time);
  end
endprogram

/* fork...join
  @0: start fork...join example
  @10: sequential after #10
  @15: parallel start
  @20: parallel after #10
  @40: sequential after #30
  @50: sequential after #10
  @60: parallel after #50
  @60: after join
  @140: finish after #80
*/

/* fork...join_none
  @0: start fork...join example
  @10: sequential after #10
  @10: after join
  @15: parallel start
  @20: parallel after #10
  @40: sequential after #30
  @50: sequential after #10
  @60: parallel after #50
  @90: finish after #80
*/

/* fork...join_any
  @0: start fork...join example
  @10: sequential after #10
  @15: parallel start
  @15: after join
  @20: parallel after #10
  @40: sequential after #30
  @50: sequential after #10
  @60: parallel after #50
  @95: finish after #80
*/