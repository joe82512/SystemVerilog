`ifndef SCOREBOARD__SV //避免重載
`define SCOREBOARD__SV

class Expect_cells;
    NNI_cell q[$];
    int iexpect, iactual;
endclass:Expect_cells

class Scoreboard;
    Config cfg;
    Expect_cells expect_cells[];
    NNI_cell cellq[$];
    int iexpect, iactual;

    extern function new(Config cfg);
    extern virtual function void wrap_up();
    extern function void save_expected(UNI_cell ucell);
    extern function void check_actual(input NNI_cell c, input int portn);
    extern function void display(string prefix="");
endclass:Scoreboard

//建構子
function Scoreboard::new(Config cfg);
    this.cfg = cfg;
    expect_cells = new[cfg.numTx];
    foreach (expect_cells[i])
        expect_cells[i] = new();
endfunction

//從 driver 獲得期望的 cell -> Scb_Driver_cbs::post_tx()
function void Scoreboard::save_expected(UNI_cell ucell);
    NNI_cell ncell = ucell.to_NNI;
    CellCfgType CellCfg = top.squat.lut.read(ncell.VPI);

    $display("@%0t: Scb save: VPI=%0x, Forward=%b", $time, ncell.VPI, CellCfg.FWD);

    ncell.display($sformatf("@%0t: Scb save: ", $time));

    //找到cell要轉發的Tx port
    for (int i=0; i<cfg.numTx; i++)
        if (CellCfg.FWD[i]) begin
            expect_cells[i].q.push_back(ncell); //save cell
            expect_cells[i].iexpect++;
            iexpect++;
        end
endfunction:save_expected

//由 monitor 接收 cell -> Scb_Monitor_cbs::post_rx()
function void Scoreboard::check_actual(input NNI_cell c, input int portn);
    NNI_cell match;
    int match_idx;

    c.display($sformatf("@%0t: Scb check: ", $time));

    if (expect_cells[portn].q.size() == 0) begin
        $display("@%0t: ERROR: %m cell not found because scoreboard for TX%0d empty", $time, portn);
        c.display("Not Found: ");
        cfg.nErrors++;
        return;
    end

    expect_cells[portn].iactual++;
    iactual++;

    foreach (expect_cells[portn].q[i]) begin
        if (expect_cells[portn].q[i].compare(c)) begin
            $display("@%0t: Match found for cell", $time);
            expect_cells[portn].q.delete(i);
            return;
        end
    end

    $display("@%0t: ERROR: %m cell not found", $time);
    c.display("Not Found: ");
    cfg.nErrors++;
endfunction:check_actual

//顯示仿真報告 -> env的wrap_up引用此函數
function void Scoreboard::wrap_up();
    $display("@%0t: %m %0d expected cells, %0d actual cells received", $time, iexpect, iactual);

    //殘餘cell
    foreach (expect_cells[i]) begin
        if (expect_cells[i].q.size()) begin
            $display("@%0t: %m cells remaining in Tx[%0d] scoreboard at end of test", $time, i);
            this.display("Unclaimed: ");
            cfg.nErrors++;
        end
    end
endfunction:wrap_up

//輸出scoreboard內容
function void Scoreboard::display(string prefix);
    $display("@%0t: %m so far %0d expected cells, %0d actual cells received", $time, iexpect, iactual);
    
    foreach (expect_cells[i]) begin
        $display("Tx[%0d]: exp=%0d, act=%0d", i, expect_cells[i].iexpect, expect_cells[i].iactual);
        foreach (expect_cells[i].q[j])
            expect_cells[i].q[j].display($sformatf("%sScoreboard: Tx%0d: ", prefix, i));
    end
endfunction:display

`endif //SCOREBOARD__SV