// Code your design here

/*
  event:事件觸發, 可用於thread同步
  @ 邊緣觸發
  .triggered 電平觸發
*/

program automatic edge_trig();
  event e1, e2;
  initial begin
    $display("@%0t: 1: before edge trigger", $time);
    -> e1;
    @e2;
    $display("@%0t: 1: after edge trigger", $time);
  end
  
  initial begin
    $display("@%0t: 2: before edge trigger", $time);
    -> e2;
    @e1; //等不到邊緣->atch
    $display("@%0t: 2: after edge trigger", $time);
  end
endprogram

program automatic level_trig();
  event e1, e2;
  initial begin
    #10; //避免跟edge_trig()重疊顯示
    $display("@%0t: 1: before level trigger", $time);
    -> e1;
    wait (e2.triggered); //注意: 用在loop裡容易變成無限循環
    $display("@%0t: 1: after level trigger", $time);
  end
  
  initial begin
    #10; //避免跟edge_trig()重疊顯示
    $display("@%0t: 2: before level trigger", $time);
    -> e2;
    wait (e1.triggered);
    $display("@%0t: 2: after level trigger", $time);
  end
endprogram


    
/*
  @0: 1: before edge trigger
  @0: 2: before edge trigger
  @0: 1: after edge trigger
  
  @10: 1: before level trigger
  @10: 2: before level trigger
  @10: 2: after level trigger
  @10: 1: after level trigger
*/