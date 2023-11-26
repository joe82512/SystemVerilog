// Code your design here
module my_struct;
  
typedef struct packed {bit [7:0] addr;
                       bit [7:0] pr;
                       bit [15:0] data;} Packet;

Packet scb[$]; //deque

// function
function void check_addr(bit [7:0] addr);
  int intq[$];
  intq = scb.find_index() with (item.addr==addr);
  case(intq.size())
    0:
      $display("Addr %0b not found in scoreboard", addr);
    1:begin
      $display("Find result: pr=%0b, data=%0b",scb[intq[0]].pr, scb[intq[0]].data); //show
      scb.delete(intq[0]); //delete
    end
    default:
      $display("Error:Multiple hits for addr %0b",addr);
  endcase
endfunction:check_addr



initial begin
  // create Packet element var*
  static Packet var1 = {8'b1, 8'b11, 16'b111};
  static Packet var2 = {8'b11, 8'b111, 16'b1111};
  static Packet var3 = {8'b111, 8'b1111, 16'b11111};
  static Packet var4 = {8'b111, 8'b11111, 16'b11111};
  
  // create Packet deque scb
  scb.insert(0, var1);           //[var1]
  scb.push_back(var2);           //[var1,var2]
  scb.push_front(var3);          //[var3,var1,var2]
  scb.insert(scb.size(), var4);  //[var3,var1,var2,var4]
  
  // show
  foreach(scb[i])
    $display("index=%0d, addr=%0b, pr=%0b, data=%0b",i, scb[i].addr, scb[i].pr, scb[i].data);
  
  // check
  check_addr(8'b1); //cnt=1, and pop 
  check_addr(8'b1); //cnt=0
  check_addr(8'b111); //cnt>1
  
  // show again
  foreach(scb[i])
    $display("index=%0d, addr=%0b, pr=%0b, data=%0b",i, scb[i].addr, scb[i].pr, scb[i].data);
  
end

endmodule