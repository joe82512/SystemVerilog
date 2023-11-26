// Code your design here

/* weight as array */

module my_random;
  class Weighted;
    rand int val;
    int array[] = '{1,1,2,3,5,8,8,8,8,8}; //權重有效, 與書上寫的不同

    constraint c {val inside array;}
  endclass:Weighted
  
  task transmit (Weighted w); //object 作為引數
    $display("w=%0d",w.val);
  endtask

  Weighted w;
  initial begin
    int count[9],maxx[$];
    w = new();
    repeat(2000) begin
      assert(w.randomize());
      count[w.val]++;
    end
    
    maxx = count.max();
    foreach (count[i])
      if (count[i]) begin
        $write("count[%0d]=%5d",i,count[i]);
        repeat (count[i]*40/maxx[0]) $write("* ");
        $display;
      end
  end
  /*
    count[1]=  381* * * * * * * * * * * * * * * 
    count[2]=  219* * * * * * * * 
    count[3]=  212* * * * * * * * 
    count[5]=  175* * * * * * 
    count[8]= 1013* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
  */
endmodule;