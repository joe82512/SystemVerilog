`ifndef GENERATOR__SV //避免重載
`define GENERATOR__SV

`include "transcation.sv"

class UNI_generator;
    UNI_cell blueprint;	//blueprint for generator
    mailbox gen2drv;	//mailbox to driver
    event drv2gen;	    //event if driver done
    int nCells;	        //generator cells
    int	PortID;	        //generator Rx port

    function new(input mailbox gen2drv,
                input event drv2gen,
		        input int nCells,
		        input int PortID);
        this.gen2drv = gen2drv;
        this.drv2gen = drv2gen;
        this.nCells  = nCells;
        this.PortID  = PortID;
        blueprint = new();
    endfunction:new

    task run();
        UNI_cell c; //不要定義變數名稱為 cell
        repeat (nCells) begin
            assert(blueprint.randomize());
            $cast(c, blueprint.copy());
            c.display($sformatf("@%0t: Gen%0d: ", $time, PortID)); //$psprintf 用於VCS
            gen2drv.put(c);
            @drv2gen; //等待driver完成
        end
    endtask:run

endclass:UNI_generator

class NNI_generator;
    NNI_cell blueprint;	//blueprint for generator
    mailbox gen2drv;	//mailbox to driver
    event drv2gen;	    //event if driver done
    int nCells;	        //generator cells
    int	PortID;	        //generator Rx port

    function new(input mailbox gen2drv,
                input event drv2gen,
		        input int nCells,
		        input int PortID);
        this.gen2drv = gen2drv;
        this.drv2gen = drv2gen;
        this.nCells  = nCells;
        this.PortID  = PortID;
        blueprint = new();
    endfunction:new

    task run();
        NNI_cell c;
        repeat (nCells) begin
            assert(blueprint.randomize());
            $cast(c, blueprint.copy());
            c.display($sformatf("@%0t: Gen%0d: ", $time, PortID)); //$psprintf 用於VCS
            gen2drv.put(c);
            @drv2gen; //等待driver完成
        end
    endtask:run
endclass:NNI_generator

`endif //GENERATOR__SV