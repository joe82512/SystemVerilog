// Code your design here

/* weight as enum */

module my_random;
  class Days;
    typedef enum {SUN,MON,TUE,WED,THU,FRI,SAT} days_e;
    days_e choices[$];
    rand days_e choice;
    constraint cday {choice inside choices;}
  endclass:Days

  Days days;
  initial begin
    days = new();
    days.choices = {Days::SUN,Days::SAT}; //修改約束範圍
    repeat(10) begin
      assert(days.randomize());
      $display("Random weekend day %s", days.choice.name);
    end
    $display(); //類似\n
    days.choices = {Days::MON,Days::TUE,Days::WED,
                   Days::THU,Days::FRI};
    repeat(10) begin
      assert(days.randomize());
      $display("Random week day %s", days.choice.name);
    end
  end
endmodule;