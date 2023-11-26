// Code your design here

/* 條件約束造成"解的機率"不同 */

module my_random;
  //無約束
  class Unconstrained;
    rand bit x;      //0~1
    rand bit[1:0] y; //0~3
  endclass:Unconstrained
  
  //條件約束
  class Imp1;
    rand bit x;
    rand bit[1:0] y;
    constraint c_xy {
      (x==0)->y==0;  //x==0時, y必為0
    }
  endclass:Imp1
  
  //雙向約束
  class Imp2;
    rand bit x;
    rand bit[1:0] y;
    constraint c_xy {
      y > 0;         //y必 >0
      (x==0)->y==0;  //x==0時, y必為0
    }
  endclass:Imp2
  
  //修改機率: 不推薦使用
  class SolveBefore1;
    rand bit x;
    rand bit[1:0] y;
    constraint c_xy {
      (x==0)->y==0;  //x==0時, y必為0
      solve x before y; //x優先:x先佔1/2,再去分y
    }
  endclass:SolveBefore1
  
  class SolveBefore2;
    rand bit x;
    rand bit[1:0] y;
    constraint c_xy {
      (x==0)->y==0;  //x==0時, y必為0
      solve y before x; //y優先:y先佔1/4,再去分x
    }
  endclass:SolveBefore2

  Unconstrained p; //均1/8
  //Imp1 p; //均1/5, 與書上不同
  //Imp2 p; //均1/3
  //SolveBefore1 p;  //'{"0-0":1025, "1-0":259, "1-1":243, "1-2":223, "1-3":250}
  //SolveBefore2 p; //'{"0-0":233, "1-0":265, "1-1":482, "1-2":527, "1-3":493} 
  int hashmap[string];
  string s,s1,s2;
  initial begin
    p = new();
    repeat(2000) begin  
      assert(p.randomize());
      s = $psprintf("%0d-%0d",p.x,p.y);
      hashmap[s]++;
      // $display("(x,y)=(%0d,%0d)", p.x,p.y);
    end
    $display(hashmap);
  end
endmodule;