`ifndef CONFIG__SV //避免重載
`define CONFIG__SV

//隨機化配置: 約束
class Config;
    int nErrors, nWarnings; //錯誤,警告個數
    bit [31:0] numRx, numTx; //複製參數

    rand bit [31:0] nCells; //cell總數 1~999
    constraint c_nCells_valid { nCells > 0; }
    constraint c_nCells_reasonable { nCells < 1000; }

    rand bit in_use_Rx[]; //允許使用的通道
    constraint c_in_use_valid { in_use_Rx.sum > 0; } //至少一個通道

    rand bit [31:0] cells_per_chan[]; //通道的cell數
    constraint c_sum_ncells_sum { cells_per_chan.sum==nCells; } //cell全部分配給通道
    constraint zero_unused_channels { //未使用的通道cell數約束為0
        foreach (cells_per_chan[i]) {
            solve in_use_Rx[i] before cells_per_chan[i]; //先求解in_use_Rx
            if (in_use_Rx[i])
                cells_per_chan[i] inside {[1:nCells]};
            else
                cells_per_chan[i]==0;
        }
    }

    extern function new(input bit [31:0] numRx, numTx);
    extern virtual function void display(input string prefix="");
endclass:Config

//typedef struct packed {} CellCfgType; //定義在definitions.sv

function Config::new(input bit [31:0] numRx, numTx);
    this.numRx = numRx;
    in_use_Rx = new[numRx];
    this.numTx = numTx;
    cells_per_chan = new[numRx];
endfunction:new

function void Config::display(input string prefix);
    $write("%sConfig: numRx=%0d, numTx=%0d, nCells=%0d {", prefix, numRx, numTx, nCells);
    foreach (cells_per_chan[i])
        $write("%0d", cells_per_chan[i]);
    $write("}, enable RX: ", prefix);
    foreach (in_use_Rx[i])
        if (in_use_Rx[i]) $write("%0d",i);
    $display;
endfunction:display

`endif //CONFIG__SV