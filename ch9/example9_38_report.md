[2023-11-04 14:57:04 UTC] vlib work && vlog -writetoplevels questa.tops '-timescale' '1ns/1ns' design.sv testbench.sv  && vsim -f questa.tops -batch -do run.do -voptargs=+acc=npr 
QuestaSim-64 vlog 2021.3 Compiler 2021.07 Jul 13 2021
Start time: 10:57:05 on Nov 04,2023
vlog -writetoplevels questa.tops -timescale 1ns/1ns design.sv testbench.sv 
-- Compiling interface busifc
-- Compiling program test
-- Compiling module top

Top level modules:
	top
End time: 10:57:05 on Nov 04,2023, Elapsed time: 0:00:00
Errors: 0, Warnings: 0
# vsim top -batch -do "run.do" -voptargs="+acc=npr" 
# Start time: 10:57:05 on Nov 04,2023
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
# ** Note: $stop    : design.sv(79)
#    Time: 315 ns  Iteration: 1  Instance: /top/t1
# Break in Module test at design.sv line 79
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
# /top/t1/#ublk#502948#71/immed__72
#                      design.sv(72)                      0          1
# 
# Covergroup Coverage:
#     Covergroups                      3        na        na    88.62%
#         Coverpoints/Crosses          5        na        na        na
#             Covergroup Bins        158        55       103    34.81%
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/CoverPort                               100.00%        100          -    Covered              
#     covered/total bins:                                     2          2          -                      
#     missing/total bins:                                     0          2          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint #coverpoint__0#                        100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#  Covergroup instance \/top/t1/cp                      100.00%        100          -    Covered              
#     covered/total bins:                                     2          2          -                      
#     missing/total bins:                                     0          2          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint #coverpoint__0#                        100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin lo                                             23          1          -    Covered              
#         bin hi                                              9          1          -    Covered              
#  TYPE /top/t1/CoverPortSelect                         100.00%        100          -    Covered              
#     covered/total bins:                                     4          4          -                      
#     missing/total bins:                                     0          4          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint port                                   100.00%        100          -    Covered              
#         covered/total bins:                                 4          4          -                      
#         missing/total bins:                                 0          4          -                      
#         % Hit:                                        100.00%        100          -                      
#  Covergroup instance \/top/t1/cpa                     100.00%        100          -    Covered              
#     covered/total bins:                                     2          2          -                      
#     missing/total bins:                                     0          2          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint port                                   100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin lo                                              8          1          -    Covered              
#         bin hi                                             24          1          -    Covered              
#  Covergroup instance \/top/t1/cpb                     100.00%        100          -    Covered              
#     covered/total bins:                                     2          2          -                      
#     missing/total bins:                                     0          2          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint port                                   100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin lo                                              7          1          -    Covered              
#         bin hi                                             25          1          -    Covered              
#  TYPE /top/t1/CoverPortTarget                          65.88%        100          -    Uncovered            
#     covered/total bins:                                    49        152          -                      
#     missing/total bins:                                   103        152          -                      
#     % Hit:                                             32.23%        100          -                      
#     Coverpoint port                                   100.00%        100          -    Covered              
#         covered/total bins:                                 8          8          -                      
#         missing/total bins:                                 0          8          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint kind                                    75.00%        100          -    Uncovered            
#         covered/total bins:                                12         16          -                      
#         missing/total bins:                                 4         16          -                      
#         % Hit:                                         75.00%        100          -                      
#     Cross #cross__0#                                   22.65%        100          -    Uncovered            
#         covered/total bins:                                29        128          -                      
#         missing/total bins:                                99        128          -                      
#         % Hit:                                         22.65%        100          -                      
#  Covergroup instance \/top/t1/ct                       65.88%         90          -    Uncovered            
#     covered/total bins:                                    49        152          -                      
#     missing/total bins:                                   103        152          -                      
#     % Hit:                                             32.23%        100          -                      
#     Coverpoint port                                   100.00%        100          -    Covered              
#         covered/total bins:                                 8          8          -                      
#         missing/total bins:                                 0          8          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0]                                         4          1          -    Covered              
#         bin auto[1]                                         4          1          -    Covered              
#         bin auto[2]                                         2          1          -    Covered              
#         bin auto[3]                                         8          1          -    Covered              
#         bin auto[4]                                         5          1          -    Covered              
#         bin auto[5]                                         2          1          -    Covered              
#         bin auto[6]                                         4          1          -    Covered              
#         bin auto[7]                                         3          1          -    Covered              
#     Coverpoint kind                                    75.00%        100          -    Uncovered            
#         covered/total bins:                                12         16          -                      
#         missing/total bins:                                 4         16          -                      
#         % Hit:                                         75.00%        100          -                      
#         bin auto[0]                                         0          1          -    ZERO                 
#         bin auto[1]                                         3          1          -    Covered              
#         bin auto[2]                                         3          1          -    Covered              
#         bin auto[3]                                         2          1          -    Covered              
#         bin auto[4]                                         1          1          -    Covered              
#         bin auto[5]                                         3          1          -    Covered              
#         bin auto[6]                                         0          1          -    ZERO                 
#         bin auto[7]                                         0          1          -    ZERO                 
#         bin auto[8]                                         3          1          -    Covered              
#         bin auto[9]                                         1          1          -    Covered              
#         bin auto[10]                                        2          1          -    Covered              
#         bin auto[11]                                        4          1          -    Covered              
#         bin auto[12]                                        4          1          -    Covered              
#         bin auto[13]                                        0          1          -    ZERO                 
#         bin auto[14]                                        3          1          -    Covered              
#         bin auto[15]                                        3          1          -    Covered              
#     Cross #cross__0#                                   22.65%        100          -    Uncovered            
#         covered/total bins:                                29        128          -                      
#         missing/total bins:                                99        128          -                      
#         % Hit:                                         22.65%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <auto[15],auto[7]>                          1          1          -    Covered              
#             bin <auto[11],auto[7]>                          1          1          -    Covered              
#             bin <auto[10],auto[7]>                          1          1          -    Covered              
#             bin <auto[15],auto[6]>                          1          1          -    Covered              
#             bin <auto[11],auto[6]>                          1          1          -    Covered              
#             bin <auto[2],auto[6]>                           1          1          -    Covered              
#             bin <auto[1],auto[6]>                           1          1          -    Covered              
#             bin <auto[3],auto[5]>                           1          1          -    Covered              
#             bin <auto[1],auto[5]>                           1          1          -    Covered              
#             bin <auto[14],auto[4]>                          1          1          -    Covered              
#             bin <auto[11],auto[4]>                          1          1          -    Covered              
#             bin <auto[8],auto[4]>                           1          1          -    Covered              
#             bin <auto[5],auto[4]>                           1          1          -    Covered              
#             bin <auto[2],auto[4]>                           1          1          -    Covered              
#             bin <auto[15],auto[3]>                          1          1          -    Covered              
#             bin <auto[14],auto[3]>                          2          1          -    Covered              
#             bin <auto[12],auto[3]>                          1          1          -    Covered              
#             bin <auto[11],auto[3]>                          1          1          -    Covered              
#             bin <auto[8],auto[3]>                           2          1          -    Covered              
#             bin <auto[1],auto[3]>                           1          1          -    Covered              
#             bin <auto[9],auto[2]>                           1          1          -    Covered              
#             bin <auto[3],auto[2]>                           1          1          -    Covered              
#             bin <auto[12],auto[1]>                          1          1          -    Covered              
#             bin <auto[10],auto[1]>                          1          1          -    Covered              
#             bin <auto[5],auto[1]>                           1          1          -    Covered              
#             bin <auto[4],auto[1]>                           1          1          -    Covered              
#             bin <auto[12],auto[0]>                          2          1          -    Covered              
#             bin <auto[5],auto[0]>                           1          1          -    Covered              
#             bin <auto[2],auto[0]>                           1          1          -    Covered              
#             bin <auto[13],*>                                0          1          8    ZERO                 
#             bin <auto[7],*>                                 0          1          8    ZERO                 
#             bin <auto[6],*>                                 0          1          8    ZERO                 
#             bin <auto[0],*>                                 0          1          8    ZERO                 
#             bin <auto[14],auto[7]>                          0          1          1    ZERO                 
#             bin <auto[12],auto[7]>                          0          1          1    ZERO                 
#             bin <auto[9],auto[7]>                           0          1          1    ZERO                 
#             bin <auto[8],auto[7]>                           0          1          1    ZERO                 
#             bin <auto[5],auto[7]>                           0          1          1    ZERO                 
#             bin <auto[4],auto[7]>                           0          1          1    ZERO                 
#             bin <auto[3],auto[7]>                           0          1          1    ZERO                 
#             bin <auto[2],auto[7]>                           0          1          1    ZERO                 
#             bin <auto[1],auto[7]>                           0          1          1    ZERO                 
#             bin <auto[14],auto[6]>                          0          1          1    ZERO                 
#             bin <auto[12],auto[6]>                          0          1          1    ZERO                 
#             bin <auto[10],auto[6]>                          0          1          1    ZERO                 
#             bin <auto[9],auto[6]>                           0          1          1    ZERO                 
#             bin <auto[8],auto[6]>                           0          1          1    ZERO                 
#             bin <auto[5],auto[6]>                           0          1          1    ZERO                 
#             bin <auto[4],auto[6]>                           0          1          1    ZERO                 
#             bin <auto[3],auto[6]>                           0          1          1    ZERO                 
#             bin <auto[15],auto[5]>                          0          1          1    ZERO                 
#             bin <auto[14],auto[5]>                          0          1          1    ZERO                 
#             bin <auto[12],auto[5]>                          0          1          1    ZERO                 
#             bin <auto[11],auto[5]>                          0          1          1    ZERO                 
#             bin <auto[10],auto[5]>                          0          1          1    ZERO                 
#             bin <auto[9],auto[5]>                           0          1          1    ZERO                 
#             bin <auto[8],auto[5]>                           0          1          1    ZERO                 
#             bin <auto[5],auto[5]>                           0          1          1    ZERO                 
#             bin <auto[4],auto[5]>                           0          1          1    ZERO                 
#             bin <auto[2],auto[5]>                           0          1          1    ZERO                 
#             bin <auto[15],auto[4]>                          0          1          1    ZERO                 
#             bin <auto[12],auto[4]>                          0          1          1    ZERO                 
#             bin <auto[10],auto[4]>                          0          1          1    ZERO                 
#             bin <auto[9],auto[4]>                           0          1          1    ZERO                 
#             bin <auto[4],auto[4]>                           0          1          1    ZERO                 
#             bin <auto[3],auto[4]>                           0          1          1    ZERO                 
#             bin <auto[1],auto[4]>                           0          1          1    ZERO                 
#             bin <auto[10],auto[3]>                          0          1          1    ZERO                 
#             bin <auto[9],auto[3]>                           0          1          1    ZERO                 
#             bin <auto[5],auto[3]>                           0          1          1    ZERO                 
#             bin <auto[4],auto[3]>                           0          1          1    ZERO                 
#             bin <auto[3],auto[3]>                           0          1          1    ZERO                 
#             bin <auto[2],auto[3]>                           0          1          1    ZERO                 
#             bin <auto[15],auto[2]>                          0          1          1    ZERO                 
#             bin <auto[14],auto[2]>                          0          1          1    ZERO                 
#             bin <auto[12],auto[2]>                          0          1          1    ZERO                 
#             bin <auto[11],auto[2]>                          0          1          1    ZERO                 
#             bin <auto[10],auto[2]>                          0          1          1    ZERO                 
#             bin <auto[8],auto[2]>                           0          1          1    ZERO                 
#             bin <auto[5],auto[2]>                           0          1          1    ZERO                 
#             bin <auto[4],auto[2]>                           0          1          1    ZERO                 
#             bin <auto[2],auto[2]>                           0          1          1    ZERO                 
#             bin <auto[1],auto[2]>                           0          1          1    ZERO                 
#             bin <auto[15],auto[1]>                          0          1          1    ZERO                 
#             bin <auto[14],auto[1]>                          0          1          1    ZERO                 
#             bin <auto[11],auto[1]>                          0          1          1    ZERO                 
#             bin <auto[9],auto[1]>                           0          1          1    ZERO                 
#             bin <auto[8],auto[1]>                           0          1          1    ZERO                 
#             bin <auto[3],auto[1]>                           0          1          1    ZERO                 
#             bin <auto[2],auto[1]>                           0          1          1    ZERO                 
#             bin <auto[1],auto[1]>                           0          1          1    ZERO                 
#             bin <auto[15],auto[0]>                          0          1          1    ZERO                 
#             bin <auto[14],auto[0]>                          0          1          1    ZERO                 
#             bin <auto[11],auto[0]>                          0          1          1    ZERO                 
#             bin <auto[10],auto[0]>                          0          1          1    ZERO                 
#             bin <auto[9],auto[0]>                           0          1          1    ZERO                 
#             bin <auto[8],auto[0]>                           0          1          1    ZERO                 
#             bin <auto[4],auto[0]>                           0          1          1    ZERO                 
#             bin <auto[3],auto[0]>                           0          1          1    ZERO                 
#             bin <auto[1],auto[0]>                           0          1          1    ZERO                 
# 
# COVERGROUP COVERAGE:
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/CoverPort                               100.00%        100          -    Covered              
#     covered/total bins:                                     2          2          -                      
#     missing/total bins:                                     0          2          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint #coverpoint__0#                        100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#  Covergroup instance \/top/t1/cp                      100.00%        100          -    Covered              
#     covered/total bins:                                     2          2          -                      
#     missing/total bins:                                     0          2          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint #coverpoint__0#                        100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin lo                                             23          1          -    Covered              
#         bin hi                                              9          1          -    Covered              
#  TYPE /top/t1/CoverPortSelect                         100.00%        100          -    Covered              
#     covered/total bins:                                     4          4          -                      
#     missing/total bins:                                     0          4          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint port                                   100.00%        100          -    Covered              
#         covered/total bins:                                 4          4          -                      
#         missing/total bins:                                 0          4          -                      
#         % Hit:                                        100.00%        100          -                      
#  Covergroup instance \/top/t1/cpa                     100.00%        100          -    Covered              
#     covered/total bins:                                     2          2          -                      
#     missing/total bins:                                     0          2          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint port                                   100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin lo                                              8          1          -    Covered              
#         bin hi                                             24          1          -    Covered              
#  Covergroup instance \/top/t1/cpb                     100.00%        100          -    Covered              
#     covered/total bins:                                     2          2          -                      
#     missing/total bins:                                     0          2          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint port                                   100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin lo                                              7          1          -    Covered              
#         bin hi                                             25          1          -    Covered              
#  TYPE /top/t1/CoverPortTarget                          65.88%        100          -    Uncovered            
#     covered/total bins:                                    49        152          -                      
#     missing/total bins:                                   103        152          -                      
#     % Hit:                                             32.23%        100          -                      
#     Coverpoint port                                   100.00%        100          -    Covered              
#         covered/total bins:                                 8          8          -                      
#         missing/total bins:                                 0          8          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint kind                                    75.00%        100          -    Uncovered            
#         covered/total bins:                                12         16          -                      
#         missing/total bins:                                 4         16          -                      
#         % Hit:                                         75.00%        100          -                      
#     Cross #cross__0#                                   22.65%        100          -    Uncovered            
#         covered/total bins:                                29        128          -                      
#         missing/total bins:                                99        128          -                      
#         % Hit:                                         22.65%        100          -                      
#  Covergroup instance \/top/t1/ct                       65.88%         90          -    Uncovered            
#     covered/total bins:                                    49        152          -                      
#     missing/total bins:                                   103        152          -                      
#     % Hit:                                             32.23%        100          -                      
#     Coverpoint port                                   100.00%        100          -    Covered              
#         covered/total bins:                                 8          8          -                      
#         missing/total bins:                                 0          8          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0]                                         4          1          -    Covered              
#         bin auto[1]                                         4          1          -    Covered              
#         bin auto[2]                                         2          1          -    Covered              
#         bin auto[3]                                         8          1          -    Covered              
#         bin auto[4]                                         5          1          -    Covered              
#         bin auto[5]                                         2          1          -    Covered              
#         bin auto[6]                                         4          1          -    Covered              
#         bin auto[7]                                         3          1          -    Covered              
#     Coverpoint kind                                    75.00%        100          -    Uncovered            
#         covered/total bins:                                12         16          -                      
#         missing/total bins:                                 4         16          -                      
#         % Hit:                                         75.00%        100          -                      
#         bin auto[0]                                         0          1          -    ZERO                 
#         bin auto[1]                                         3          1          -    Covered              
#         bin auto[2]                                         3          1          -    Covered              
#         bin auto[3]                                         2          1          -    Covered              
#         bin auto[4]                                         1          1          -    Covered              
#         bin auto[5]                                         3          1          -    Covered              
#         bin auto[6]                                         0          1          -    ZERO                 
#         bin auto[7]                                         0          1          -    ZERO                 
#         bin auto[8]                                         3          1          -    Covered              
#         bin auto[9]                                         1          1          -    Covered              
#         bin auto[10]                                        2          1          -    Covered              
#         bin auto[11]                                        4          1          -    Covered              
#         bin auto[12]                                        4          1          -    Covered              
#         bin auto[13]                                        0          1          -    ZERO                 
#         bin auto[14]                                        3          1          -    Covered              
#         bin auto[15]                                        3          1          -    Covered              
#     Cross #cross__0#                                   22.65%        100          -    Uncovered            
#         covered/total bins:                                29        128          -                      
#         missing/total bins:                                99        128          -                      
#         % Hit:                                         22.65%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <auto[15],auto[7]>                          1          1          -    Covered              
#             bin <auto[11],auto[7]>                          1          1          -    Covered              
#             bin <auto[10],auto[7]>                          1          1          -    Covered              
#             bin <auto[15],auto[6]>                          1          1          -    Covered              
#             bin <auto[11],auto[6]>                          1          1          -    Covered              
#             bin <auto[2],auto[6]>                           1          1          -    Covered              
#             bin <auto[1],auto[6]>                           1          1          -    Covered              
#             bin <auto[3],auto[5]>                           1          1          -    Covered              
#             bin <auto[1],auto[5]>                           1          1          -    Covered              
#             bin <auto[14],auto[4]>                          1          1          -    Covered              
#             bin <auto[11],auto[4]>                          1          1          -    Covered              
#             bin <auto[8],auto[4]>                           1          1          -    Covered              
#             bin <auto[5],auto[4]>                           1          1          -    Covered              
#             bin <auto[2],auto[4]>                           1          1          -    Covered              
#             bin <auto[15],auto[3]>                          1          1          -    Covered              
#             bin <auto[14],auto[3]>                          2          1          -    Covered              
#             bin <auto[12],auto[3]>                          1          1          -    Covered              
#             bin <auto[11],auto[3]>                          1          1          -    Covered              
#             bin <auto[8],auto[3]>                           2          1          -    Covered              
#             bin <auto[1],auto[3]>                           1          1          -    Covered              
#             bin <auto[9],auto[2]>                           1          1          -    Covered              
#             bin <auto[3],auto[2]>                           1          1          -    Covered              
#             bin <auto[12],auto[1]>                          1          1          -    Covered              
#             bin <auto[10],auto[1]>                          1          1          -    Covered              
#             bin <auto[5],auto[1]>                           1          1          -    Covered              
#             bin <auto[4],auto[1]>                           1          1          -    Covered              
#             bin <auto[12],auto[0]>                          2          1          -    Covered              
#             bin <auto[5],auto[0]>                           1          1          -    Covered              
#             bin <auto[2],auto[0]>                           1          1          -    Covered              
#             bin <auto[13],*>                                0          1          8    ZERO                 
#             bin <auto[7],*>                                 0          1          8    ZERO                 
#             bin <auto[6],*>                                 0          1          8    ZERO                 
#             bin <auto[0],*>                                 0          1          8    ZERO                 
#             bin <auto[14],auto[7]>                          0          1          1    ZERO                 
#             bin <auto[12],auto[7]>                          0          1          1    ZERO                 
#             bin <auto[9],auto[7]>                           0          1          1    ZERO                 
#             bin <auto[8],auto[7]>                           0          1          1    ZERO                 
#             bin <auto[5],auto[7]>                           0          1          1    ZERO                 
#             bin <auto[4],auto[7]>                           0          1          1    ZERO                 
#             bin <auto[3],auto[7]>                           0          1          1    ZERO                 
#             bin <auto[2],auto[7]>                           0          1          1    ZERO                 
#             bin <auto[1],auto[7]>                           0          1          1    ZERO                 
#             bin <auto[14],auto[6]>                          0          1          1    ZERO                 
#             bin <auto[12],auto[6]>                          0          1          1    ZERO                 
#             bin <auto[10],auto[6]>                          0          1          1    ZERO                 
#             bin <auto[9],auto[6]>                           0          1          1    ZERO                 
#             bin <auto[8],auto[6]>                           0          1          1    ZERO                 
#             bin <auto[5],auto[6]>                           0          1          1    ZERO                 
#             bin <auto[4],auto[6]>                           0          1          1    ZERO                 
#             bin <auto[3],auto[6]>                           0          1          1    ZERO                 
#             bin <auto[15],auto[5]>                          0          1          1    ZERO                 
#             bin <auto[14],auto[5]>                          0          1          1    ZERO                 
#             bin <auto[12],auto[5]>                          0          1          1    ZERO                 
#             bin <auto[11],auto[5]>                          0          1          1    ZERO                 
#             bin <auto[10],auto[5]>                          0          1          1    ZERO                 
#             bin <auto[9],auto[5]>                           0          1          1    ZERO                 
#             bin <auto[8],auto[5]>                           0          1          1    ZERO                 
#             bin <auto[5],auto[5]>                           0          1          1    ZERO                 
#             bin <auto[4],auto[5]>                           0          1          1    ZERO                 
#             bin <auto[2],auto[5]>                           0          1          1    ZERO                 
#             bin <auto[15],auto[4]>                          0          1          1    ZERO                 
#             bin <auto[12],auto[4]>                          0          1          1    ZERO                 
#             bin <auto[10],auto[4]>                          0          1          1    ZERO                 
#             bin <auto[9],auto[4]>                           0          1          1    ZERO                 
#             bin <auto[4],auto[4]>                           0          1          1    ZERO                 
#             bin <auto[3],auto[4]>                           0          1          1    ZERO                 
#             bin <auto[1],auto[4]>                           0          1          1    ZERO                 
#             bin <auto[10],auto[3]>                          0          1          1    ZERO                 
#             bin <auto[9],auto[3]>                           0          1          1    ZERO                 
#             bin <auto[5],auto[3]>                           0          1          1    ZERO                 
#             bin <auto[4],auto[3]>                           0          1          1    ZERO                 
#             bin <auto[3],auto[3]>                           0          1          1    ZERO                 
#             bin <auto[2],auto[3]>                           0          1          1    ZERO                 
#             bin <auto[15],auto[2]>                          0          1          1    ZERO                 
#             bin <auto[14],auto[2]>                          0          1          1    ZERO                 
#             bin <auto[12],auto[2]>                          0          1          1    ZERO                 
#             bin <auto[11],auto[2]>                          0          1          1    ZERO                 
#             bin <auto[10],auto[2]>                          0          1          1    ZERO                 
#             bin <auto[8],auto[2]>                           0          1          1    ZERO                 
#             bin <auto[5],auto[2]>                           0          1          1    ZERO                 
#             bin <auto[4],auto[2]>                           0          1          1    ZERO                 
#             bin <auto[2],auto[2]>                           0          1          1    ZERO                 
#             bin <auto[1],auto[2]>                           0          1          1    ZERO                 
#             bin <auto[15],auto[1]>                          0          1          1    ZERO                 
#             bin <auto[14],auto[1]>                          0          1          1    ZERO                 
#             bin <auto[11],auto[1]>                          0          1          1    ZERO                 
#             bin <auto[9],auto[1]>                           0          1          1    ZERO                 
#             bin <auto[8],auto[1]>                           0          1          1    ZERO                 
#             bin <auto[3],auto[1]>                           0          1          1    ZERO                 
#             bin <auto[2],auto[1]>                           0          1          1    ZERO                 
#             bin <auto[1],auto[1]>                           0          1          1    ZERO                 
#             bin <auto[15],auto[0]>                          0          1          1    ZERO                 
#             bin <auto[14],auto[0]>                          0          1          1    ZERO                 
#             bin <auto[11],auto[0]>                          0          1          1    ZERO                 
#             bin <auto[10],auto[0]>                          0          1          1    ZERO                 
#             bin <auto[9],auto[0]>                           0          1          1    ZERO                 
#             bin <auto[8],auto[0]>                           0          1          1    ZERO                 
#             bin <auto[4],auto[0]>                           0          1          1    ZERO                 
#             bin <auto[3],auto[0]>                           0          1          1    ZERO                 
#             bin <auto[1],auto[0]>                           0          1          1    ZERO                 
# 
# TOTAL COVERGROUP COVERAGE: 88.62%  COVERGROUP TYPES: 3
# 
# ASSERTION RESULTS:
# --------------------------------------------------------------------
# Name                 File(Line)                   Failure      Pass 
#                                                   Count        Count
# --------------------------------------------------------------------
# /top/t1/#ublk#502948#71/immed__72
#                      design.sv(72)                      0          1
# 
# Total Coverage By Instance (filtered view): 94.31%
# 
# 
# End time: 10:57:06 on Nov 04,2023, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
Done