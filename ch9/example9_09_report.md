[2023-11-04 10:48:33 UTC] vlib work && vlog -writetoplevels questa.tops '-timescale' '1ns/1ns' design.sv testbench.sv  && vsim -f questa.tops -batch -do run.do -voptargs=+acc=npr 
QuestaSim-64 vlog 2021.3 Compiler 2021.07 Jul 13 2021
Start time: 06:48:33 on Nov 04,2023
vlog -writetoplevels questa.tops -timescale 1ns/1ns design.sv testbench.sv 
-- Compiling interface simple_bus
-- Compiling module mem
-- Compiling program test
-- Compiling module top

Top level modules:
	top
End time: 06:48:33 on Nov 04,2023, Elapsed time: 0:00:00
Errors: 0, Warnings: 0
# vsim top -batch -do "run.do" -voptargs="+acc=npr" 
# Start time: 06:48:33 on Nov 04,2023
# ** Note: (vsim-3812) Design is being optimized...
# //  Questa Sim-64
# //  Version 2021.3 linux_x86_64 Jul 13 2021
# //
# //  Copyright 1991-2021 Mentor Graphics Corporation
# //  All Rights Reserved.
# //
# //  QuestaSim and its associated documentation contain trade
# //  secrets and commercial or financial information that are the property of
# //  Mentor Graphics Corporation and are privileged, confidential,
# //  and exempt from disclosure under the Freedom of Information Act,
# //  5 U.S.C. Section 552. Furthermore, this information
# //  is prohibited from disclosure under the Trade Secrets Act,
# //  18 U.S.C. Section 1905.
# //
# Loading sv_std.std
# Loading work.top(fast)
# Loading work.simple_bus(fast__1)
# Loading work.mem(fast)
# Loading work.test(fast)
# 
# do run.do
# [5] addr=01111111 / 127, data=2
# [15] addr=00111111 / 63, data=4
# [25] addr=00011111 / 31, data=8
# [35] addr=00001111 / 15, data=16
# [45] addr=00000111 / 7, data=32
# [55] addr=00000011 / 3, data=64
# [65] addr=00000001 / 1, data=128
# [75] addr=00000000 / 0, data=0
# ** Note: $stop    : design.sv(49)
#    Time: 75 ns  Iteration: 1  Instance: /top/t1
# Break at design.sv line 49
# Coverage Report by instance with details
# 
# =================================================================================
# === Instance: /top/m1
# === Design Unit: work.mem
# =================================================================================
# 
# Directive Coverage:
#     Directives                       1         1         0   100.00%
# 
# DIRECTIVE COVERAGE:
# --------------------------------------------------------------------------------------------
# Name                                     Design Design   Lang File(Line)      Hits Status    
#                                          Unit   UnitType                                     
# --------------------------------------------------------------------------------------------
# /top/m1/cover__0                         mem    Verilog  SVA  design.sv(19)      8 Covered   
# 
# =================================================================================
# === Instance: /top/t1
# === Design Unit: work.test
# =================================================================================
# 
# Covergroup Coverage:
#     Covergroups                      1        na        na    43.75%
#         Coverpoints/Crosses          2        na        na        na
#             Covergroup Bins         16         7         9    43.75%
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/Write_cg                                 43.75%        100          -    Uncovered            
#     covered/total bins:                                     7         16          -                      
#     missing/total bins:                                     9         16          -                      
#     % Hit:                                             43.75%        100          -                      
#     Coverpoint #coverpoint__0#                         50.00%        100          -    Uncovered            
#         covered/total bins:                                 4          8          -                      
#         missing/total bins:                                 4          8          -                      
#         % Hit:                                         50.00%        100          -                      
#     Coverpoint #coverpoint__1#                         37.50%        100          -    Uncovered            
#         covered/total bins:                                 3          8          -                      
#         missing/total bins:                                 5          8          -                      
#         % Hit:                                         37.50%        100          -                      
#  Covergroup instance \/top/t1/wcg                      43.75%        100          -    Uncovered            
#     covered/total bins:                                     7         16          -                      
#     missing/total bins:                                     9         16          -                      
#     % Hit:                                             43.75%        100          -                      
#     Coverpoint #coverpoint__0#                         50.00%        100          -    Uncovered            
#         covered/total bins:                                 4          8          -                      
#         missing/total bins:                                 4          8          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin auto[0:31]                                      5          1          -    Covered              
#         bin auto[32:63]                                     1          1          -    Covered              
#         bin auto[64:95]                                     1          1          -    Covered              
#         bin auto[96:127]                                    0          1          -    ZERO                 
#         bin auto[128:159]                                   1          1          -    Covered              
#         bin auto[160:191]                                   0          1          -    ZERO                 
#         bin auto[192:223]                                   0          1          -    ZERO                 
#         bin auto[224:255]                                   0          1          -    ZERO                 
#     Coverpoint #coverpoint__1#                         37.50%        100          -    Uncovered            
#         covered/total bins:                                 3          8          -                      
#         missing/total bins:                                 5          8          -                      
#         % Hit:                                         37.50%        100          -                      
#         bin auto[0:31]                                      6          1          -    Covered              
#         bin auto[32:63]                                     1          1          -    Covered              
#         bin auto[64:95]                                     0          1          -    ZERO                 
#         bin auto[96:127]                                    1          1          -    Covered              
#         bin auto[128:159]                                   0          1          -    ZERO                 
#         bin auto[160:191]                                   0          1          -    ZERO                 
#         bin auto[192:223]                                   0          1          -    ZERO                 
#         bin auto[224:255]                                   0          1          -    ZERO                 
# 
# COVERGROUP COVERAGE:
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/Write_cg                                 43.75%        100          -    Uncovered            
#     covered/total bins:                                     7         16          -                      
#     missing/total bins:                                     9         16          -                      
#     % Hit:                                             43.75%        100          -                      
#     Coverpoint #coverpoint__0#                         50.00%        100          -    Uncovered            
#         covered/total bins:                                 4          8          -                      
#         missing/total bins:                                 4          8          -                      
#         % Hit:                                         50.00%        100          -                      
#     Coverpoint #coverpoint__1#                         37.50%        100          -    Uncovered            
#         covered/total bins:                                 3          8          -                      
#         missing/total bins:                                 5          8          -                      
#         % Hit:                                         37.50%        100          -                      
#  Covergroup instance \/top/t1/wcg                      43.75%        100          -    Uncovered            
#     covered/total bins:                                     7         16          -                      
#     missing/total bins:                                     9         16          -                      
#     % Hit:                                             43.75%        100          -                      
#     Coverpoint #coverpoint__0#                         50.00%        100          -    Uncovered            
#         covered/total bins:                                 4          8          -                      
#         missing/total bins:                                 4          8          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin auto[0:31]                                      5          1          -    Covered              
#         bin auto[32:63]                                     1          1          -    Covered              
#         bin auto[64:95]                                     1          1          -    Covered              
#         bin auto[96:127]                                    0          1          -    ZERO                 
#         bin auto[128:159]                                   1          1          -    Covered              
#         bin auto[160:191]                                   0          1          -    ZERO                 
#         bin auto[192:223]                                   0          1          -    ZERO                 
#         bin auto[224:255]                                   0          1          -    ZERO                 
#     Coverpoint #coverpoint__1#                         37.50%        100          -    Uncovered            
#         covered/total bins:                                 3          8          -                      
#         missing/total bins:                                 5          8          -                      
#         % Hit:                                         37.50%        100          -                      
#         bin auto[0:31]                                      6          1          -    Covered              
#         bin auto[32:63]                                     1          1          -    Covered              
#         bin auto[64:95]                                     0          1          -    ZERO                 
#         bin auto[96:127]                                    1          1          -    Covered              
#         bin auto[128:159]                                   0          1          -    ZERO                 
#         bin auto[160:191]                                   0          1          -    ZERO                 
#         bin auto[192:223]                                   0          1          -    ZERO                 
#         bin auto[224:255]                                   0          1          -    ZERO                 
# 
# TOTAL COVERGROUP COVERAGE: 43.75%  COVERGROUP TYPES: 1
# 
# DIRECTIVE COVERAGE:
# --------------------------------------------------------------------------------------------
# Name                                     Design Design   Lang File(Line)      Hits Status    
#                                          Unit   UnitType                                     
# --------------------------------------------------------------------------------------------
# /top/m1/cover__0                         mem    Verilog  SVA  design.sv(19)      8 Covered   
# 
# TOTAL DIRECTIVE COVERAGE: 100.00%  COVERS: 1
# 
# Total Coverage By Instance (filtered view): 71.87%
# 
# 
# End time: 06:48:34 on Nov 04,2023, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
Done