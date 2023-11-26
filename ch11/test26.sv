`include "definitions.sv"

program automatic test
    #(parameter int NumRx=4, parameter int NumTx=4) (
        Utopia.TB_Rx Rx[0:NumRx-1],
        Utopia.TB_Tx Tx[0:NumTx-1],
        cpu_ifc.Test mif,
        input logic rst, clk
    );

    `include "environment.sv"
    Environment env;

    class Config_1_cells extends Config;
        constraint one_cells {nCells == 1;}

        function new(input int NumRx,NumTx);
            super.new(NumRx,NumTx);
        endfunction:new
    endclass:Config_1_cells

    initial begin
        env = new(Rx, Tx, NumRx, NumTx, mif);

        begin //only 1 cells
            Config_1_cells c1 = new(NumRx,NumTx);
            env.cfg = c1;
        end

        env.gen_cfg();
        env.build();
        env.run();
        env.wrap_up();
    end
endprogram //test