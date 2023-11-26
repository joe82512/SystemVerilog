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

    class Driver_cbs_drop extends Driver_cbs;
        virtual task pre_tx(input ATM_cell cell, ref bit drop);
            // Randomly drop 1 out of every 100 transactions
            drop = ($urandom_range(0,99) == 0);
        endtask
    endclass

    initial begin
        env = new(Rx, Tx, NumRx, NumTx, mif);
        env.gen_cfg();
        env.build();

        begin //注入故障
            Driver_cbs_drop dcd = new();
            env.drv.cbs.push_back(dcd); //放入driver
        end

        env.run();
        env.wrap_up();
    end
endprogram //test