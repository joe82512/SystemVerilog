top.sv          {define: `Txport, `Rxport}
                {utopia.sv, cpu_ifc.sv, squat.sv, test.sv}

squat.sv        {utopia.sv, cpu_ifc.sv, LookupTable.sv, utopia1_atm_rx.sv, utopia1_atm_tx.sv}
    definitions.sv

    cpu_ifc.sv
        definitions.sv

    LookupTable.sv
        definitions.sv

    utopia1_atm_rx.sv   {utopia.sv}
        utopia.sv
            definitions.sv

    utopia1_atm_tx.sv   {utopia.sv}
        utopia.sv
            definitions.sv

test.sv
    definitions.sv
    environment.sv
        generator.sv
            atm_cell.sv
                definitions.sv
        driver.sv
            atm_cell.sv
                definitions.sv
        monitor.sv
            atm_cell.sv
                definitions.sv
        config.sv

        scoreboard.sv
            atm_cell.sv
                definitions.sv
        coverage.sv

        cpu_driver.sv
            atm_cell.sv
                definitions.sv
            cpu_ifc.sv
                definitions.sv