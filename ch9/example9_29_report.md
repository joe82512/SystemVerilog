[2023-11-04 11:31:31 UTC] vlib work && vlog -writetoplevels questa.tops '-timescale' '1ns/1ns' design.sv testbench.sv  && vsim -f questa.tops -batch -do run.do -voptargs=+acc=npr 
QuestaSim-64 vlog 2021.3 Compiler 2021.07 Jul 13 2021
Start time: 07:31:32 on Nov 04,2023
vlog -writetoplevels questa.tops -timescale 1ns/1ns design.sv testbench.sv 
-- Compiling interface busifc
-- Compiling program test
-- Compiling module top

Top level modules:
	top
End time: 07:31:32 on Nov 04,2023, Elapsed time: 0:00:00
Errors: 0, Warnings: 0
# vsim top -batch -do "run.do" -voptargs="+acc=npr" 
# Start time: 07:31:32 on Nov 04,2023
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
# Coverage = 67.78%
# ** Note: $stop    : design.sv(56)
#    Time: 315 ns  Iteration: 1  Instance: /top/t1
# Break in Module test at design.sv line 56
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
# /top/t1/#ublk#502948#50/immed__51
#                      design.sv(51)                      0          1
# 
# Covergroup Coverage:
#     Covergroups                      1        na        na    67.77%
#         Coverpoints/Crosses          3        na        na        na
#             Covergroup Bins         78        30        48    38.46%
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/CovPort                                  67.77%        100          -    Uncovered            
#     covered/total bins:                                    30         78          -                      
#     missing/total bins:                                    48         78          -                      
#     % Hit:                                             38.46%        100          -                      
#     Coverpoint port                                   100.00%        100          -    Covered              
#         covered/total bins:                                 8          8          -                      
#         missing/total bins:                                 0          8          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint kind                                    80.00%        100          -    Uncovered            
#         covered/total bins:                                 8         10          -                      
#         missing/total bins:                                 2         10          -                      
#         % Hit:                                         80.00%        100          -                      
#     Cross #cross__0#                                   23.33%        100          -    Uncovered            
#         covered/total bins:                                14         60          -                      
#         missing/total bins:                                46         60          -                      
#         % Hit:                                         23.33%        100          -                      
#  Covergroup instance \/top/t1/ck                       67.77%        100          -    Uncovered            
#     covered/total bins:                                    30         78          -                      
#     missing/total bins:                                    48         78          -                      
#     % Hit:                                             38.46%        100          -                      
#     Coverpoint port                                   100.00%        100          -    Covered              
#         covered/total bins:                                 8          8          -                      
#         missing/total bins:                                 0          8          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin port[0]                                         4          1          -    Covered              
#         bin port[1]                                         4          1          -    Covered              
#         bin port[2]                                         2          1          -    Covered              
#         bin port[3]                                         8          1          -    Covered              
#         bin port[4]                                         5          1          -    Covered              
#         bin port[5]                                         2          1          -    Covered              
#         bin port[6]                                         4          1          -    Covered              
#         bin port[7]                                         3          1          -    Covered              
#     Coverpoint kind                                    80.00%        100          -    Uncovered            
#         covered/total bins:                                 8         10          -                      
#         missing/total bins:                                 2         10          -                      
#         % Hit:                                         80.00%        100          -                      
#         bin zero                                            0          1          -    ZERO                 
#         bin lo                                              8          1          -    Covered              
#         bin hi[8]                                           3          1          -    Covered              
#         bin hi[9]                                           1          1          -    Covered              
#         bin hi[10]                                          2          1          -    Covered              
#         bin hi[11]                                          4          1          -    Covered              
#         bin hi[12]                                          4          1          -    Covered              
#         bin hi[13]                                          0          1          -    ZERO                 
#         bin hi[14]                                          3          1          -    Covered              
#         bin hi[15]                                          3          1          -    Covered              
#         default bin misc                                    4                     -    Occurred             
#     Cross #cross__0#                                   23.33%        100          -    Uncovered            
#         covered/total bins:                                14         60          -                      
#         missing/total bins:                                46         60          -                      
#         % Hit:                                         23.33%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <hi[15],port[6]>                            1          1          -    Covered              
#             bin <hi[11],port[6]>                            1          1          -    Covered              
#             bin <hi[11],port[4]>                            1          1          -    Covered              
#             bin <hi[14],port[4]>                            1          1          -    Covered              
#             bin <hi[8],port[4]>                             1          1          -    Covered              
#             bin <hi[15],port[3]>                            1          1          -    Covered              
#             bin <hi[11],port[3]>                            1          1          -    Covered              
#             bin <hi[9],port[2]>                             1          1          -    Covered              
#             bin <hi[14],port[3]>                            2          1          -    Covered              
#             bin <hi[12],port[3]>                            1          1          -    Covered              
#             bin <hi[8],port[3]>                             2          1          -    Covered              
#             bin <hi[10],port[1]>                            1          1          -    Covered              
#             bin <hi[12],port[1]>                            1          1          -    Covered              
#             bin <hi[12],port[0]>                            2          1          -    Covered              
#             bin <hi[13],*>                                  0          1          7    ZERO                 
#             bin <zero,*>                                    0          1          7    ZERO                 
#             bin <*,port[5]>                                 0          1          9    ZERO                 
#             bin <hi[9],port[6]>                             0          1          1    ZERO                 
#             bin <hi[14],port[6]>                            0          1          1    ZERO                 
#             bin <hi[8],port[6]>                             0          1          1    ZERO                 
#             bin <hi[10],port[6]>                            0          1          1    ZERO                 
#             bin <hi[12],port[6]>                            0          1          1    ZERO                 
#             bin <hi[15],port[4]>                            0          1          1    ZERO                 
#             bin <hi[9],port[4]>                             0          1          1    ZERO                 
#             bin <hi[10],port[4]>                            0          1          1    ZERO                 
#             bin <hi[12],port[4]>                            0          1          1    ZERO                 
#             bin <hi[15],port[2]>                            0          1          1    ZERO                 
#             bin <hi[11],port[2]>                            0          1          1    ZERO                 
#             bin <hi[14],port[2]>                            0          1          1    ZERO                 
#             bin <hi[8],port[2]>                             0          1          1    ZERO                 
#             bin <hi[10],port[2]>                            0          1          1    ZERO                 
#             bin <hi[12],port[2]>                            0          1          1    ZERO                 
#             bin <hi[9],port[3]>                             0          1          1    ZERO                 
#             bin <hi[10],port[3]>                            0          1          1    ZERO                 
#             bin <hi[15],port[1]>                            0          1          1    ZERO                 
#             bin <hi[11],port[1]>                            0          1          1    ZERO                 
#             bin <hi[9],port[1]>                             0          1          1    ZERO                 
#             bin <hi[14],port[1]>                            0          1          1    ZERO                 
#             bin <hi[8],port[1]>                             0          1          1    ZERO                 
#             bin <hi[15],port[0]>                            0          1          1    ZERO                 
#             bin <hi[14],port[0]>                            0          1          1    ZERO                 
#             bin <hi[8],port[0]>                             0          1          1    ZERO                 
#         Illegal and Ignore Bins:
#             ignore_bin lo                                   8                     -    Occurred             
#             ignore_bin md                                   0                     -    ZERO                 
#             ignore_bin hi                                   3                     -    Occurred             
# 
# COVERGROUP COVERAGE:
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/CovPort                                  67.77%        100          -    Uncovered            
#     covered/total bins:                                    30         78          -                      
#     missing/total bins:                                    48         78          -                      
#     % Hit:                                             38.46%        100          -                      
#     Coverpoint port                                   100.00%        100          -    Covered              
#         covered/total bins:                                 8          8          -                      
#         missing/total bins:                                 0          8          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint kind                                    80.00%        100          -    Uncovered            
#         covered/total bins:                                 8         10          -                      
#         missing/total bins:                                 2         10          -                      
#         % Hit:                                         80.00%        100          -                      
#     Cross #cross__0#                                   23.33%        100          -    Uncovered            
#         covered/total bins:                                14         60          -                      
#         missing/total bins:                                46         60          -                      
#         % Hit:                                         23.33%        100          -                      
#  Covergroup instance \/top/t1/ck                       67.77%        100          -    Uncovered            
#     covered/total bins:                                    30         78          -                      
#     missing/total bins:                                    48         78          -                      
#     % Hit:                                             38.46%        100          -                      
#     Coverpoint port                                   100.00%        100          -    Covered              
#         covered/total bins:                                 8          8          -                      
#         missing/total bins:                                 0          8          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin port[0]                                         4          1          -    Covered              
#         bin port[1]                                         4          1          -    Covered              
#         bin port[2]                                         2          1          -    Covered              
#         bin port[3]                                         8          1          -    Covered              
#         bin port[4]                                         5          1          -    Covered              
#         bin port[5]                                         2          1          -    Covered              
#         bin port[6]                                         4          1          -    Covered              
#         bin port[7]                                         3          1          -    Covered              
#     Coverpoint kind                                    80.00%        100          -    Uncovered            
#         covered/total bins:                                 8         10          -                      
#         missing/total bins:                                 2         10          -                      
#         % Hit:                                         80.00%        100          -                      
#         bin zero                                            0          1          -    ZERO                 
#         bin lo                                              8          1          -    Covered              
#         bin hi[8]                                           3          1          -    Covered              
#         bin hi[9]                                           1          1          -    Covered              
#         bin hi[10]                                          2          1          -    Covered              
#         bin hi[11]                                          4          1          -    Covered              
#         bin hi[12]                                          4          1          -    Covered              
#         bin hi[13]                                          0          1          -    ZERO                 
#         bin hi[14]                                          3          1          -    Covered              
#         bin hi[15]                                          3          1          -    Covered              
#         default bin misc                                    4                     -    Occurred             
#     Cross #cross__0#                                   23.33%        100          -    Uncovered            
#         covered/total bins:                                14         60          -                      
#         missing/total bins:                                46         60          -                      
#         % Hit:                                         23.33%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <hi[15],port[6]>                            1          1          -    Covered              
#             bin <hi[11],port[6]>                            1          1          -    Covered              
#             bin <hi[11],port[4]>                            1          1          -    Covered              
#             bin <hi[14],port[4]>                            1          1          -    Covered              
#             bin <hi[8],port[4]>                             1          1          -    Covered              
#             bin <hi[15],port[3]>                            1          1          -    Covered              
#             bin <hi[11],port[3]>                            1          1          -    Covered              
#             bin <hi[9],port[2]>                             1          1          -    Covered              
#             bin <hi[14],port[3]>                            2          1          -    Covered              
#             bin <hi[12],port[3]>                            1          1          -    Covered              
#             bin <hi[8],port[3]>                             2          1          -    Covered              
#             bin <hi[10],port[1]>                            1          1          -    Covered              
#             bin <hi[12],port[1]>                            1          1          -    Covered              
#             bin <hi[12],port[0]>                            2          1          -    Covered              
#             bin <hi[13],*>                                  0          1          7    ZERO                 
#             bin <zero,*>                                    0          1          7    ZERO                 
#             bin <*,port[5]>                                 0          1          9    ZERO                 
#             bin <hi[9],port[6]>                             0          1          1    ZERO                 
#             bin <hi[14],port[6]>                            0          1          1    ZERO                 
#             bin <hi[8],port[6]>                             0          1          1    ZERO                 
#             bin <hi[10],port[6]>                            0          1          1    ZERO                 
#             bin <hi[12],port[6]>                            0          1          1    ZERO                 
#             bin <hi[15],port[4]>                            0          1          1    ZERO                 
#             bin <hi[9],port[4]>                             0          1          1    ZERO                 
#             bin <hi[10],port[4]>                            0          1          1    ZERO                 
#             bin <hi[12],port[4]>                            0          1          1    ZERO                 
#             bin <hi[15],port[2]>                            0          1          1    ZERO                 
#             bin <hi[11],port[2]>                            0          1          1    ZERO                 
#             bin <hi[14],port[2]>                            0          1          1    ZERO                 
#             bin <hi[8],port[2]>                             0          1          1    ZERO                 
#             bin <hi[10],port[2]>                            0          1          1    ZERO                 
#             bin <hi[12],port[2]>                            0          1          1    ZERO                 
#             bin <hi[9],port[3]>                             0          1          1    ZERO                 
#             bin <hi[10],port[3]>                            0          1          1    ZERO                 
#             bin <hi[15],port[1]>                            0          1          1    ZERO                 
#             bin <hi[11],port[1]>                            0          1          1    ZERO                 
#             bin <hi[9],port[1]>                             0          1          1    ZERO                 
#             bin <hi[14],port[1]>                            0          1          1    ZERO                 
#             bin <hi[8],port[1]>                             0          1          1    ZERO                 
#             bin <hi[15],port[0]>                            0          1          1    ZERO                 
#             bin <hi[14],port[0]>                            0          1          1    ZERO                 
#             bin <hi[8],port[0]>                             0          1          1    ZERO                 
#         Illegal and Ignore Bins:
#             ignore_bin lo                                   8                     -    Occurred             
#             ignore_bin md                                   0                     -    ZERO                 
#             ignore_bin hi                                   3                     -    Occurred             
# 
# TOTAL COVERGROUP COVERAGE: 67.77%  COVERGROUP TYPES: 1
# 
# ASSERTION RESULTS:
# --------------------------------------------------------------------
# Name                 File(Line)                   Failure      Pass 
#                                                   Count        Count
# --------------------------------------------------------------------
# /top/t1/#ublk#502948#50/immed__51
#                      design.sv(51)                      0          1
# 
# Total Coverage By Instance (filtered view): 83.88%
# 
# 
# End time: 07:31:33 on Nov 04,2023, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
Done