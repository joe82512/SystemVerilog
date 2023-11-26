// Code your design here

/* note: 約束常見方法(整理) */

module my_random;
  //設定上下限 ex6.33
  class Bounds;
    rand int size;
    int max_size=100; //default
    constraint c_size {size inside {[1:max_size]};}
  endclass:Bounds
  
  //設定weight ex6.34
  class ReadCommands;
    typedef enum {READ8,READ16,READ32} read_e;
    rand read_e read_cmd;
    int read8_wt=1,read16_wt=1,read32_wt=1;
    constraint c_read {
      read_cmd dist {READ8 :=read8_wt,
                     READ16 :=read16_wt,
                     READ32 :=read32_wt};
    }
  endclass:ReadCommands
  
  //設定非隨機值 ex6.35
  class Packet;
    rand bit[7:0] length,payload[];
    constraint c_valid {length>0;
                        payload.size==length;}
    function void display(string msg);
      $display("\n%s",msg);
      $write("Packet len=%0d, payload size=%0d, bytes=",
             length, payload.size() );
      for (int i=0; (i<4 && i<payload.size()); i++)
        $write("%0d",payload[i]);
      $display;
    endfunction:display
  endclass:Packet
  
  //指定變數隨機化 ex6.36
  class Rising;
    byte low=5; //給default
    rand byte med,hi;
    constraint up {low<med; med<hi;}
  endclass:Rising
  
  //if-else開啟或關閉約束 ex6.37
  class InstructionIf;
    typedef enum {NOP,HALT,CLR,NOT} opcode_e;
    rand opcode_e opcode;
    bit[1:0] n_operands;
    // ...
    constraint c_operands {
      if (n_operands==0)
        opcode==NOP || opcode==HALT;
      else if (n_operands==1)
        opcode==CLR || opcode==NOT;
      // ...
    }
  endclass:InstructionIf
  
  //constraint_mode開啟或關閉約束 ex6.38
  class Instruction;
    typedef enum {NOP,HALT,CLR,NOT} opcode_e;
    rand opcode_e opcode;
    constraint c_no_operands { opcode==NOP || opcode==HALT; }
    constraint c_one_operand { opcode==CLR || opcode==NOT; }
  endclass:Instruction
  
  
  
  Packet p;          //ex6.35
  Rising r;          //ex6.36
  Instruction instr; //ex6.38
  initial begin
    p = new();
    r = new();
    instr = new();
    
    assert(p.randomize());
    p.display("Simple randomize");
    // Packet len=150, payload size=150, bytes=185108167163
    
    p.length.rand_mode(0); //設為非隨機值
    p.length=42;
    assert(p.randomize());
    p.display("Randomize with rand_mode");
    // Packet len=150, payload size=150, bytes=185108167163
    
    
    r.randomize();    //隨機化 all rand
    $display("%0d<%0d<%0d", r.low,r.med,r.hi); //5<107<118
    r.randomize(med); //只隨機化 med
    $display("%0d<%0d<%0d", r.low,r.med,r.hi); //5<117<118
    r.randomize(low); //只隨機化 low -> 非隨機變數但可以隨機化
    $display("%0d<%0d<%0d", r.low,r.med,r.hi); //-92<117<118
    
    
    instr.constraint_mode(0); //關閉所有約束
    instr.c_no_operands.constraint_mode(1);
    assert(instr.randomize());
    $display("opcode=%s", instr.opcode.name); //opcode=HALT
    
    instr.constraint_mode(0); //關閉所有約束
    instr.c_one_operand.constraint_mode(1); //opcode=NOT
    assert(instr.randomize());
    $display("opcode=%s", instr.opcode.name);
  end
endmodule;