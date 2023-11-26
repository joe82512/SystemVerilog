// Code your design here

/* 用靜態儲存會造成變數共享, 因此要用automatic */

program bad_code;
  initial begin
    for (int j=0; j<3; j++)
      fork
        $write(j);
      join_none
    #0 $display;
  end
  /* 3 3 3 */
endprogram

program test;
  initial begin
    #10; //delay 避免多個program的顯示混亂
    for (int j=0; j<3; j++)
      fork
        automatic int k = j; // Make copy of index
        $write(k);
      join_none
    #0 $display;
  end
  /* 0 1 2 */
endprogram

program automatic bug_free;
  initial begin
    #20; //delay 避免多個program的顯示混亂
    for (int j=0; j<3; j++) begin
      int k = j; // Make copy of index
      fork
        $write(k);
      join_none
    end
    #0 $display;
  end
  /* 0 1 2 */
endprogram