[2023-11-04 10:22:23 UTC] vlib work && vlog -writetoplevels questa.tops '-timescale' '1ns/1ns' design.sv testbench.sv  && vsim -f questa.tops -batch -do run.do -voptargs=+acc=npr 
QuestaSim-64 vlog 2021.3 Compiler 2021.07 Jul 13 2021
Start time: 06:22:23 on Nov 04,2023
vlog -writetoplevels questa.tops -timescale 1ns/1ns design.sv testbench.sv 
-- Compiling interface busifc
** Warning: design.sv(58): (vlog-2244) Variable 'v_ifc' is implicitly static. You must either explicitly declare it as static or automatic
or remove the initialization in the declaration of variable.
-- Compiling package design_sv_unit
-- Compiling program test
** Warning: design.sv(58): (vlog-2244) Variable 'v_ifc' is implicitly static. You must either explicitly declare it as static or automatic
or remove the initialization in the declaration of variable.
-- Compiling module top

Top level modules:
	top
End time: 06:22:23 on Nov 04,2023, Elapsed time: 0:00:00
Errors: 0, Warnings: 2
# vsim top -batch -do "run.do" -voptargs="+acc=npr" 
# Start time: 06:22:23 on Nov 04,2023
# ** Note: (vsim-3812) Design is being optimized...
# ** Warning: design.sv(58): (vopt-2244) Variable 'v_ifc' is implicitly static. You must either explicitly declare it as static or automatic
# or remove the initialization in the declaration of variable.
# ** Note: (vsim-12126) Error and warning message counts have been restored: Errors=0, Warnings=1.
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
# Loading work.design_sv_unit(fast)
# Loading work.top(fast)
# Loading work.busifc(fast__2)
# Loading work.test(fast)
# Loading work.busifc(fast)
# 
# do run.do
# ** Note: $stop    : design.sv(83)
#    Time: 100 ns  Iteration: 0  Instance: /top
# Break at design.sv line 83
# Coverage Report by instance with details
# 
# =================================================================================
# === Instance: /top/t1
# === Design Unit: work.test
# =================================================================================
# 
# Assertion Coverage:
#     Assertions                       1         1         0   100.00%
# --------------------------------------------------------------------
# Name                 File(Line)                   Failure      Pass 
#                                                   Count        Count
# --------------------------------------------------------------------
# /top/t1/#ublk#502948#54/#ublk#502948#63/immed__65
#                      design.sv(65)                      0          1
# 
# =================================================================================
# === Instance: /design_sv_unit
# === Design Unit: work.design_sv_unit
# =================================================================================
# 
# Covergroup Coverage:
#     Covergroups                      1        na        na    87.50%
#         Coverpoints/Crosses          1        na        na        na
#             Covergroup Bins          8         7         1    87.50%
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /design_sv_unit/Transactor/CovPort               87.50%        100          -    Uncovered            
#     covered/total bins:                                     7          8          -                      
#     missing/total bins:                                     1          8          -                      
#     % Hit:                                             87.50%        100          -                      
#     Coverpoint #coverpoint__0#                         87.50%        100          -    Uncovered            
#         covered/total bins:                                 7          8          -                      
#         missing/total bins:                                 1          8          -                      
#         % Hit:                                         87.50%        100          -                      
#         bin auto[0]                                         2          1          -    Covered              
#         bin auto[1]                                         1          1          -    Covered              
#         bin auto[2]                                         1          1          -    Covered              
#         bin auto[3]                                         0          1          -    ZERO                 
#         bin auto[4]                                         1          1          -    Covered              
#         bin auto[5]                                         2          1          -    Covered              
#         bin auto[6]                                         2          1          -    Covered              
#         bin auto[7]                                         2          1          -    Covered              
# 
# COVERGROUP COVERAGE:
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /design_sv_unit/Transactor/CovPort               87.50%        100          -    Uncovered            
#     covered/total bins:                                     7          8          -                      
#     missing/total bins:                                     1          8          -                      
#     % Hit:                                             87.50%        100          -                      
#     Coverpoint #coverpoint__0#                         87.50%        100          -    Uncovered            
#         covered/total bins:                                 7          8          -                      
#         missing/total bins:                                 1          8          -                      
#         % Hit:                                         87.50%        100          -                      
#         bin auto[0]                                         2          1          -    Covered              
#         bin auto[1]                                         1          1          -    Covered              
#         bin auto[2]                                         1          1          -    Covered              
#         bin auto[3]                                         0          1          -    ZERO                 
#         bin auto[4]                                         1          1          -    Covered              
#         bin auto[5]                                         2          1          -    Covered              
#         bin auto[6]                                         2          1          -    Covered              
#         bin auto[7]                                         2          1          -    Covered              
# 
# TOTAL COVERGROUP COVERAGE: 87.50%  COVERGROUP TYPES: 1
# 
# ASSERTION RESULTS:
# --------------------------------------------------------------------
# Name                 File(Line)                   Failure      Pass 
#                                                   Count        Count
# --------------------------------------------------------------------
# /top/t1/#ublk#502948#54/#ublk#502948#63/immed__65
#                      design.sv(65)                      0          1
# 
# Total Coverage By Instance (filtered view): 93.75%
# 
# 
# End time: 06:22:24 on Nov 04,2023, Elapsed time: 0:00:01
# Errors: 0, Warnings: 1
Done