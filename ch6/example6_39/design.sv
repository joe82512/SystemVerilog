// Code your design here

/* note: 約束常見方法(整理)-外部約束 P.158 */

class Packet;
  rand bit[7:0] length,payload[];
  constraint c_valid {length>0;
                      payload.size==length;}
  constraint c_external;
endclass:Packet