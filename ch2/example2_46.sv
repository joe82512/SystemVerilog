// Code your design here
module my_enum;
  
/* 用於特定名稱的集合 , 第一個的position必為0 */

typedef enum {INIT, DECODE=2, IDLE} fsmstate_e; //0,2,3
// typedef enum {INIT=1, DECODE, IDLE} fsmstate_e; //FAIL, 第一個預設為0
fsmstate_e pstate, nstate;

typedef enum {RED, BLUE, GREEN} color_e;
color_e color, c2;
int c;

initial begin
  //FSM
  case (pstate)
      IDLE:
        nstate = INIT;
      INIT:
        nstate = DECODE;
      default:
        nstate = IDLE;
  endcase
  $display ("Next state is %s", nstate.name()); //DECODE
  
  // 不能用 foreach 掃
  color  = color.first;
  do begin
    $display ("Color = %0d / %s", color, color.name);
    color = color.next;
  end
  while (color != color.first); //完成LOOP

  // enum與data類型轉換
  color = BLUE;
  c = color; //int
  c++; //int
  //if (!$cast(color, c)) //動態轉換 $cast
  //  $display("Cast failed for color = %0d", c);
  $display("Color is %0d / %s", color, color.name);
  c++;
  c2 = color_e '(c); //靜態轉換, 不推薦, 因為c++已越界但無error
  $display("c2 is %0d/%s", c2, c2.name);
  if (!$cast(c2, c)) //動態轉換 $cast , 判斷已越界
    $display("Cast failed for c2 = %0d", c);

end

endmodule