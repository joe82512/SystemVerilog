[2023-11-04 10:34:13 UTC] vlib work && vlog -writetoplevels questa.tops '-timescale' '1ns/1ns' design.sv testbench.sv  && vsim -f questa.tops -batch -do run.do -voptargs=+acc=npr 
QuestaSim-64 vlog 2021.3 Compiler 2021.07 Jul 13 2021
Start time: 06:34:14 on Nov 04,2023
vlog -writetoplevels questa.tops -timescale 1ns/1ns design.sv testbench.sv 
-- Compiling package design_sv_unit
-- Compiling program test

Top level modules:
	test
End time: 06:34:14 on Nov 04,2023, Elapsed time: 0:00:00
Errors: 0, Warnings: 0
# vsim test -batch -do "run.do" -voptargs="+acc=npr" 
# Start time: 06:34:14 on Nov 04,2023
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
# Loading work.design_sv_unit(fast)
# Loading work.test(fast)
# 
# do run.do
# ** Note: $stop    : design.sv(82)
#    Time: 0 ns  Iteration: 0  Instance: /test
# Break at design.sv line 82
# Coverage Report by instance with details
# 
# =================================================================================
# === Instance: /test
# === Design Unit: work.test
# =================================================================================
# 
# Assertion Coverage:
#     Assertions                       1         1         0   100.00%
# --------------------------------------------------------------------
# Name                 File(Line)                   Failure      Pass 
#                                                   Count        Count
# --------------------------------------------------------------------
# /test/#ublk#502948#62/#ublk#502948#76/immed__78
#                      design.sv(78)                      0          1
# 
# =================================================================================
# === Instance: /design_sv_unit
# === Design Unit: work.design_sv_unit
# =================================================================================
# 
# Covergroup Coverage:
#     Covergroups                      1        na        na   100.00%
#         Coverpoints/Crosses          1        na        na        na
#             Covergroup Bins          8         8         0   100.00%
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /design_sv_unit/Driver_cbs_coverage/CovPort     100.00%        100          -    Covered              
#     covered/total bins:                                     8          8          -                      
#     missing/total bins:                                     0          8          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint #coverpoint__0#                        100.00%        100          -    Covered              
#         covered/total bins:                                 8          8          -                      
#         missing/total bins:                                 0          8          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0]                                         3          1          -    Covered              
#         bin auto[1]                                         4          1          -    Covered              
#         bin auto[2]                                         2          1          -    Covered              
#         bin auto[3]                                         3          1          -    Covered              
#         bin auto[4]                                         6          1          -    Covered              
#         bin auto[5]                                         4          1          -    Covered              
#         bin auto[6]                                         3          1          -    Covered              
#         bin auto[7]                                         5          1          -    Covered              
# 
# COVERGROUP COVERAGE:
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /design_sv_unit/Driver_cbs_coverage/CovPort     100.00%        100          -    Covered              
#     covered/total bins:                                     8          8          -                      
#     missing/total bins:                                     0          8          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint #coverpoint__0#                        100.00%        100          -    Covered              
#         covered/total bins:                                 8          8          -                      
#         missing/total bins:                                 0          8          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0]                                         3          1          -    Covered              
#         bin auto[1]                                         4          1          -    Covered              
#         bin auto[2]                                         2          1          -    Covered              
#         bin auto[3]                                         3          1          -    Covered              
#         bin auto[4]                                         6          1          -    Covered              
#         bin auto[5]                                         4          1          -    Covered              
#         bin auto[6]                                         3          1          -    Covered              
#         bin auto[7]                                         5          1          -    Covered              
# 
# TOTAL COVERGROUP COVERAGE: 100.00%  COVERGROUP TYPES: 1
# 
# ASSERTION RESULTS:
# --------------------------------------------------------------------
# Name                 File(Line)                   Failure      Pass 
#                                                   Count        Count
# --------------------------------------------------------------------
# /test/#ublk#502948#62/#ublk#502948#76/immed__78
#                      design.sv(78)                      0          1
# 
# Total Coverage By Instance (filtered view): 100.00%
# 
# 
# End time: 06:34:15 on Nov 04,2023, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
Done