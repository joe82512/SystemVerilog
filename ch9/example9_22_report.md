[2023-11-04 11:22:13 UTC] vlib work && vlog -writetoplevels questa.tops '-timescale' '1ns/1ns' design.sv testbench.sv  && vsim -f questa.tops -batch -do run.do -voptargs=+acc=npr 
QuestaSim-64 vlog 2021.3 Compiler 2021.07 Jul 13 2021
Start time: 07:22:13 on Nov 04,2023
vlog -writetoplevels questa.tops -timescale 1ns/1ns design.sv testbench.sv 
-- Compiling interface busifc
-- Compiling program test
-- Compiling module top

Top level modules:
	top
End time: 07:22:13 on Nov 04,2023, Elapsed time: 0:00:00
Errors: 0, Warnings: 0
# vsim top -batch -do "run.do" -voptargs="+acc=npr" 
# Start time: 07:22:13 on Nov 04,2023
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
# Loading work.busifc(fast__1)
# Loading work.test(fast)
# 
# do run.do
# [@0] port=3
# [@5] port=3
# ** Error: (vsim-8565) Illegal state bin was hit at value=6. The bin counter for the illegal bin '\/top/t1/ck .Illegal_bin.hi' is 1.
#    Time: 15 ns  Iteration: 1  Instance: /top/t1
# [@15] port=6
# [@25] port=0
# [@35] port=1
# [@45] port=1
# [@55] port=4
# ** Error: (vsim-8565) Illegal state bin was hit at value=6. The bin counter for the illegal bin '\/top/t1/ck .Illegal_bin.hi' is 2.
#    Time: 65 ns  Iteration: 1  Instance: /top/t1
# [@65] port=6
# [@75] port=3
# ** Error: (vsim-8565) Illegal state bin was hit at value=6. The bin counter for the illegal bin '\/top/t1/ck .Illegal_bin.hi' is 3.
#    Time: 85 ns  Iteration: 1  Instance: /top/t1
# [@85] port=6
# [@95] port=4
# [@105] port=1
# [@115] port=5
# ** Error: (vsim-8565) Illegal state bin was hit at value=6. The bin counter for the illegal bin '\/top/t1/ck .Illegal_bin.hi' is 4.
#    Time: 125 ns  Iteration: 1  Instance: /top/t1
# [@125] port=6
# [@135] port=2
# ** Error: (vsim-8565) Illegal state bin was hit at value=7. The bin counter for the illegal bin '\/top/t1/ck .Illegal_bin.hi' is 5.
#    Time: 145 ns  Iteration: 1  Instance: /top/t1
# [@145] port=7
# [@155] port=3
# [@165] port=0
# [@175] port=0
# ** Error: (vsim-8565) Illegal state bin was hit at value=7. The bin counter for the illegal bin '\/top/t1/ck .Illegal_bin.hi' is 6.
#    Time: 185 ns  Iteration: 1  Instance: /top/t1
# [@185] port=7
# [@195] port=0
# [@205] port=1
# [@215] port=3
# [@225] port=5
# [@235] port=3
# [@245] port=3
# [@255] port=2
# [@265] port=4
# ** Error: (vsim-8565) Illegal state bin was hit at value=7. The bin counter for the illegal bin '\/top/t1/ck .Illegal_bin.hi' is 7.
#    Time: 275 ns  Iteration: 1  Instance: /top/t1
# [@275] port=7
# [@285] port=4
# [@295] port=4
# [@305] port=3
# Coverage = 100.00%
# ** Note: $stop    : design.sv(69)
#    Time: 315 ns  Iteration: 1  Instance: /top/t1
# Break in Module test at design.sv line 69
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
# /top/t1/#ublk#502948#60/immed__61
#                      design.sv(61)                      0          1
# 
# Covergroup Coverage:
#     Covergroups                      1        na        na   100.00%
#         Coverpoints/Crosses          6        na        na        na
#             Covergroup Bins         21        21         0   100.00%
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/CovPort                                 100.00%        100          -    Covered              
#     covered/total bins:                                    21         21          -                      
#     missing/total bins:                                     0         21          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint EX_enum                                100.00%        100          -    Covered              
#         covered/total bins:                                 3          3          -                      
#         missing/total bins:                                 0          3          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint Flip_port1                             100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint Flip_port2                             100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint Ignore_bin1                            100.00%        100          -    Covered              
#         covered/total bins:                                 6          6          -                      
#         missing/total bins:                                 0          6          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint Ignore_bin2                            100.00%        100          -    Covered              
#         covered/total bins:                                 3          3          -                      
#         missing/total bins:                                 0          3          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint Illegal_bin                            100.00%        100          -    Covered              
#         covered/total bins:                                 6          6          -                      
#         missing/total bins:                                 0          6          -                      
#         % Hit:                                        100.00%        100          -                      
#  Covergroup instance \/top/t1/ck                      100.00%        100          -    Covered              
#     covered/total bins:                                    21         21          -                      
#     missing/total bins:                                     0         21          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint EX_enum                                100.00%        100          -    Covered              
#         covered/total bins:                                 3          3          -                      
#         missing/total bins:                                 0          3          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[INIT]                                     12          1          -    Covered              
#         bin auto[DECODE]                                   11          1          -    Covered              
#         bin auto[IDLE]                                      9          1          -    Covered              
#     Coverpoint Flip_port1                             100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin t1                                              2          1          -    Covered              
#     Coverpoint Flip_port2                             100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin even                                           15          1          -    Covered              
#         bin odd                                            17          1          -    Covered              
#     Coverpoint Ignore_bin1                            100.00%        100          -    Covered              
#         covered/total bins:                                 6          6          -                      
#         missing/total bins:                                 0          6          -                      
#         % Hit:                                        100.00%        100          -                      
#         ignore_bin hi                                       7                     -    Occurred             
#         bin auto[0]                                         4          1          -    Covered              
#         bin auto[1]                                         4          1          -    Covered              
#         bin auto[2]                                         2          1          -    Covered              
#         bin auto[3]                                         8          1          -    Covered              
#         bin auto[4]                                         5          1          -    Covered              
#         bin auto[5]                                         2          1          -    Covered              
#     Coverpoint Ignore_bin2                            100.00%        100          -    Covered              
#         covered/total bins:                                 3          3          -                      
#         missing/total bins:                                 0          3          -                      
#         % Hit:                                        100.00%        100          -                      
#         ignore_bin hi                                       7                     -    Occurred             
#         bin auto[0:1]                                       8          1          -    Covered              
#         bin auto[2:3]                                      10          1          -    Covered              
#         bin auto[4:5]                                       7          1          -    Covered              
#     Coverpoint Illegal_bin                            100.00%        100          -    Covered              
#         covered/total bins:                                 6          6          -                      
#         missing/total bins:                                 0          6          -                      
#         % Hit:                                        100.00%        100          -                      
#         illegal_bin hi                                      7                     -    Occurred             
#         bin auto[0]                                         4          1          -    Covered              
#         bin auto[1]                                         4          1          -    Covered              
#         bin auto[2]                                         2          1          -    Covered              
#         bin auto[3]                                         8          1          -    Covered              
#         bin auto[4]                                         5          1          -    Covered              
#         bin auto[5]                                         2          1          -    Covered              
# 
# COVERGROUP COVERAGE:
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/CovPort                                 100.00%        100          -    Covered              
#     covered/total bins:                                    21         21          -                      
#     missing/total bins:                                     0         21          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint EX_enum                                100.00%        100          -    Covered              
#         covered/total bins:                                 3          3          -                      
#         missing/total bins:                                 0          3          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint Flip_port1                             100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint Flip_port2                             100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint Ignore_bin1                            100.00%        100          -    Covered              
#         covered/total bins:                                 6          6          -                      
#         missing/total bins:                                 0          6          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint Ignore_bin2                            100.00%        100          -    Covered              
#         covered/total bins:                                 3          3          -                      
#         missing/total bins:                                 0          3          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint Illegal_bin                            100.00%        100          -    Covered              
#         covered/total bins:                                 6          6          -                      
#         missing/total bins:                                 0          6          -                      
#         % Hit:                                        100.00%        100          -                      
#  Covergroup instance \/top/t1/ck                      100.00%        100          -    Covered              
#     covered/total bins:                                    21         21          -                      
#     missing/total bins:                                     0         21          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint EX_enum                                100.00%        100          -    Covered              
#         covered/total bins:                                 3          3          -                      
#         missing/total bins:                                 0          3          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[INIT]                                     12          1          -    Covered              
#         bin auto[DECODE]                                   11          1          -    Covered              
#         bin auto[IDLE]                                      9          1          -    Covered              
#     Coverpoint Flip_port1                             100.00%        100          -    Covered              
#         covered/total bins:                                 1          1          -                      
#         missing/total bins:                                 0          1          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin t1                                              2          1          -    Covered              
#     Coverpoint Flip_port2                             100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin even                                           15          1          -    Covered              
#         bin odd                                            17          1          -    Covered              
#     Coverpoint Ignore_bin1                            100.00%        100          -    Covered              
#         covered/total bins:                                 6          6          -                      
#         missing/total bins:                                 0          6          -                      
#         % Hit:                                        100.00%        100          -                      
#         ignore_bin hi                                       7                     -    Occurred             
#         bin auto[0]                                         4          1          -    Covered              
#         bin auto[1]                                         4          1          -    Covered              
#         bin auto[2]                                         2          1          -    Covered              
#         bin auto[3]                                         8          1          -    Covered              
#         bin auto[4]                                         5          1          -    Covered              
#         bin auto[5]                                         2          1          -    Covered              
#     Coverpoint Ignore_bin2                            100.00%        100          -    Covered              
#         covered/total bins:                                 3          3          -                      
#         missing/total bins:                                 0          3          -                      
#         % Hit:                                        100.00%        100          -                      
#         ignore_bin hi                                       7                     -    Occurred             
#         bin auto[0:1]                                       8          1          -    Covered              
#         bin auto[2:3]                                      10          1          -    Covered              
#         bin auto[4:5]                                       7          1          -    Covered              
#     Coverpoint Illegal_bin                            100.00%        100          -    Covered              
#         covered/total bins:                                 6          6          -                      
#         missing/total bins:                                 0          6          -                      
#         % Hit:                                        100.00%        100          -                      
#         illegal_bin hi                                      7                     -    Occurred             
#         bin auto[0]                                         4          1          -    Covered              
#         bin auto[1]                                         4          1          -    Covered              
#         bin auto[2]                                         2          1          -    Covered              
#         bin auto[3]                                         8          1          -    Covered              
#         bin auto[4]                                         5          1          -    Covered              
#         bin auto[5]                                         2          1          -    Covered              
# 
# TOTAL COVERGROUP COVERAGE: 100.00%  COVERGROUP TYPES: 1
# 
# ASSERTION RESULTS:
# --------------------------------------------------------------------
# Name                 File(Line)                   Failure      Pass 
#                                                   Count        Count
# --------------------------------------------------------------------
# /top/t1/#ublk#502948#60/immed__61
#                      design.sv(61)                      0          1
# 
# Total Coverage By Instance (filtered view): 100.00%
# 
# 
# End time: 07:22:14 on Nov 04,2023, Elapsed time: 0:00:01
# Errors: 7, Warnings: 0
Done