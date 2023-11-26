// Code your design here

/* 產生多個隨機object: 隨機handle陣列,隨機化前先分配(new)所有element */

module my_class;
  parameter MAX_SIZE = 10;
  
  class RandStuff;
    rand int value; //rand
  endclass
  
  class RandArray;
    rand RandStuff array[];
    
    constraint c { array.size() inside {[1:MAX_SIZE]}; }
    
    function new();
      array = new[MAX_SIZE]; //分配動態陣列大小, 還是handle
      foreach (array[i])
        array[i] = new();    //class實例化, 已建立object
    endfunction
  endclass
  
  RandArray ra;
  initial begin
    ra = new();
    assert(ra.randomize());
    foreach (ra.array[i])
      $display(ra.array[i].value);
  end
endmodule