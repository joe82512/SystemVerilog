`ifndef INTERFACE__SV //避免重載
`define INTERFACE__SV

`include "definitions.sv"

interface cpu_ifc;
    logic BusMode, Sel, Rd_DS, Wr_RW, Rdy_Dtack;
    logic [11:0] Addr;
    CellCfgType DataIn, DataOut; //定義在definitions.sv

    modport Peripheral (
        input BusMode, Addr, Sel, DataIn, Rd_DS, Wr_RW,
        output DataOut, Rdy_Dtack
    );

    modport Test (
        output BusMode, Addr, Sel, DataIn, Rd_DS, Wr_RW,
        input DataOut, Rdy_Dtack
    );
endinterface:cpu_ifc

typedef virtual cpu_ifc.Test vCPU_T;



interface Utopia;
    parameter int IfWidth=8;

    logic [IfWidth-1:0] data;
    bit clk_in, clk_out;
    bit soc, en, clav, valid, ready, reset;
    wire selected; //Mentor Questa要設定wire, 否則預設logic會跟inout相衝 (VCS不必)

    ATMCellType ATMcell; //定義在definitions.sv

    modport TopReceive (
        input data, soc, clav,
        output clk_in, reset, ready, clk_out, en, ATMcell, valid
    );

    modport TopTransmit (
        input clav,
        inout selected,
        output clk_in, clk_out, ATMcell, data, soc, en, valid, reset, ready
    );

    modport CoreReceive (
        input clk_in, data, soc, clav, ready, reset,
        output clk_out, en, ATMcell, valid
    );

    modport CoreTransmit (
        input clk_in, clav, ATMcell, valid, reset,
        output clk_out, data, soc, en, ready
    );

    clocking cbr @(negedge clk_out);
        input clk_in, clk_out, ATMcell, valid, reset, en, ready;
        output data, soc, clav;
    endclocking:cbr
    modport TB_Rx (clocking cbr);

    clocking cbt @(negedge clk_out);
        input clk_out, clk_in, ATMcell, soc, en, valid, reset, data, ready;
        output clav;
    endclocking:cbt
    modport TB_Tx (clocking cbt);
    
endinterface:Utopia

typedef virtual Utopia vUtopia;
typedef virtual Utopia.TB_Rx vUtopiaRx;
typedef virtual Utopia.TB_Tx vUtopiaTx;

`endif //INTERFACE__SV