// Code your design here

/* 隨機控制: randcase */

module my_class;
  class LenDist;
    rand int len;
    constraint c { len dist {[0:2]:=1,
                             [3:5]:=8,
                             [6:7]:=1}; } //weight
  endclass
  
  LenDist lenD;
  int len;
  int treeCnt[string];
  bit[3:0] one_write_wt=1,one_read_wt=2;
  bit[3:0] mem_write_wt=2,io_write_wt=2,cfg_write_wt=6;
  bit[3:0] mem_read_wt=6,io_read_wt=2,cfg_read_wt=2;
  initial begin
    // ex6.66
    lenD = new();
    assert(lenD.randomize());
    $display("Chose len=%0d", lenD.len);
    
    // ex6.65:快速建立指定機率的隨機化
    randcase
    1: len=$urandom_range(0,2); //10%
    8: len=$urandom_range(3,5); //80%
    1: len=$urandom_range(6,7); //10%
    endcase
    $display("len=%0d",len);
    
    // ex6.67 決策樹
    repeat(1000) begin
      randcase
      one_write_wt: do_one_write();
      one_read_wt: do_one_read();
      //seq_write_wt: do_seq_write();
      //seq_read_wt: do_seq_read();
      endcase
    end
    $display(treeCnt); //顯示統計hashmap
  end
  
  //決策樹
  task do_one_write;
    randcase
    mem_write_wt: show_msg("do_mem_write()");
    io_write_wt: show_msg("do_io_write()");
    cfg_write_wt: show_msg("do_cfg_write()");
    endcase
  endtask
  
  task do_one_read;
    randcase
    mem_read_wt: show_msg("do_mem_read()");
    io_read_wt: show_msg("do_io_read()");
    cfg_read_wt: show_msg("do_cfg_read()");
    endcase
  endtask
  
  function void show_msg(string s);
    treeCnt[s]++;
    //$display(s);
  endfunction
endmodule