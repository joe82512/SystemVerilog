[2023-11-04 14:07:22 UTC] vlib work && vlog -writetoplevels questa.tops '-timescale' '1ns/1ns' design.sv testbench.sv  && vsim -f questa.tops -batch -do run.do -voptargs=+acc=npr 
QuestaSim-64 vlog 2021.3 Compiler 2021.07 Jul 13 2021
Start time: 10:07:22 on Nov 04,2023
vlog -writetoplevels questa.tops -timescale 1ns/1ns design.sv testbench.sv 
-- Compiling interface busifc
-- Compiling program test
-- Compiling module top

Top level modules:
	top
End time: 10:07:22 on Nov 04,2023, Elapsed time: 0:00:00
Errors: 0, Warnings: 0
# vsim top -batch -do "run.do" -voptargs="+acc=npr" 
# Start time: 10:07:22 on Nov 04,2023
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
# Coverage = 45.83%
# ** Note: $stop    : design.sv(55)
#    Time: 315 ns  Iteration: 1  Instance: /top/t1
# Break in Module test at design.sv line 55
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
# /top/t1/#ublk#502948#49/immed__50
#                      design.sv(50)                      0          1
# 
# Covergroup Coverage:
#     Covergroups                      1        na        na    45.83%
#         Coverpoints/Crosses          3        na        na        na
#             Covergroup Bins         98        39        59    39.79%
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/CovPort                                  45.83%        100          -    Uncovered            
#     covered/total bins:                                    39         98          -                      
#     missing/total bins:                                    59         98          -                      
#     % Hit:                                             39.79%        100          -                      
#     Coverpoint port                                     0.00%        100          -    ZERO                 
#         covered/total bins:                                 8          8          -                      
#         missing/total bins:                                 0          8          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint kind                                    80.00%        100          -    Uncovered            
#         covered/total bins:                                 8         10          -                      
#         missing/total bins:                                 2         10          -                      
#         % Hit:                                         80.00%        100          -                      
#     Cross #cross__0#                                   28.75%        100          -    Uncovered            
#         covered/total bins:                                23         80          -                      
#         missing/total bins:                                57         80          -                      
#         % Hit:                                         28.75%        100          -                      
#  Covergroup instance \/top/t1/ck                       45.83%        100          -    Uncovered            
#     covered/total bins:                                    39         98          -                      
#     missing/total bins:                                    59         98          -                      
#     % Hit:                                             39.79%        100          -                      
#     Coverpoint port [1]                               100.00%        100          -    Covered              
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
#     Cross #cross__0#                                   28.75%        100          -    Uncovered            
#         covered/total bins:                                23         80          -                      
#         missing/total bins:                                57         80          -                      
#         % Hit:                                         28.75%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <hi[15],port[7]>                            1          1          -    Covered              
#             bin <hi[11],port[7]>                            1          1          -    Covered              
#             bin <hi[10],port[7]>                            1          1          -    Covered              
#             bin <hi[15],port[6]>                            1          1          -    Covered              
#             bin <hi[11],port[6]>                            1          1          -    Covered              
#             bin <hi[14],port[4]>                            1          1          -    Covered              
#             bin <hi[11],port[4]>                            1          1          -    Covered              
#             bin <hi[8],port[4]>                             1          1          -    Covered              
#             bin <hi[15],port[3]>                            1          1          -    Covered              
#             bin <hi[14],port[3]>                            2          1          -    Covered              
#             bin <hi[12],port[3]>                            1          1          -    Covered              
#             bin <hi[11],port[3]>                            1          1          -    Covered              
#             bin <hi[8],port[3]>                             2          1          -    Covered              
#             bin <hi[9],port[2]>                             1          1          -    Covered              
#             bin <hi[12],port[1]>                            1          1          -    Covered              
#             bin <hi[10],port[1]>                            1          1          -    Covered              
#             bin <hi[12],port[0]>                            2          1          -    Covered              
#             bin <lo,port[6]>                                2          1          -    Covered              
#             bin <lo,port[5]>                                2          1          -    Covered              
#             bin <lo,port[4]>                                1          1          -    Covered              
#             bin <lo,port[3]>                                1          1          -    Covered              
#             bin <lo,port[2]>                                1          1          -    Covered              
#             bin <lo,port[0]>                                1          1          -    Covered              
#             bin <hi[13],*>                                  0          1          8    ZERO                 
#             bin <zero,*>                                    0          1          8    ZERO                 
#             bin <hi[14],port[7]>                            0          1          1    ZERO                 
#             bin <hi[12],port[7]>                            0          1          1    ZERO                 
#             bin <hi[9],port[7]>                             0          1          1    ZERO                 
#             bin <hi[8],port[7]>                             0          1          1    ZERO                 
#             bin <lo,port[7]>                                0          1          1    ZERO                 
#             bin <hi[14],port[6]>                            0          1          1    ZERO                 
#             bin <hi[12],port[6]>                            0          1          1    ZERO                 
#             bin <hi[10],port[6]>                            0          1          1    ZERO                 
#             bin <hi[9],port[6]>                             0          1          1    ZERO                 
#             bin <hi[8],port[6]>                             0          1          1    ZERO                 
#             bin <hi[15],port[5]>                            0          1          1    ZERO                 
#             bin <hi[14],port[5]>                            0          1          1    ZERO                 
#             bin <hi[12],port[5]>                            0          1          1    ZERO                 
#             bin <hi[11],port[5]>                            0          1          1    ZERO                 
#             bin <hi[10],port[5]>                            0          1          1    ZERO                 
#             bin <hi[9],port[5]>                             0          1          1    ZERO                 
#             bin <hi[8],port[5]>                             0          1          1    ZERO                 
#             bin <hi[15],port[4]>                            0          1          1    ZERO                 
#             bin <hi[12],port[4]>                            0          1          1    ZERO                 
#             bin <hi[10],port[4]>                            0          1          1    ZERO                 
#             bin <hi[9],port[4]>                             0          1          1    ZERO                 
#             bin <hi[10],port[3]>                            0          1          1    ZERO                 
#             bin <hi[9],port[3]>                             0          1          1    ZERO                 
#             bin <hi[15],port[2]>                            0          1          1    ZERO                 
#             bin <hi[14],port[2]>                            0          1          1    ZERO                 
#             bin <hi[12],port[2]>                            0          1          1    ZERO                 
#             bin <hi[11],port[2]>                            0          1          1    ZERO                 
#             bin <hi[10],port[2]>                            0          1          1    ZERO                 
#             bin <hi[8],port[2]>                             0          1          1    ZERO                 
#             bin <hi[15],port[1]>                            0          1          1    ZERO                 
#             bin <hi[14],port[1]>                            0          1          1    ZERO                 
#             bin <hi[11],port[1]>                            0          1          1    ZERO                 
#             bin <hi[9],port[1]>                             0          1          1    ZERO                 
#             bin <hi[8],port[1]>                             0          1          1    ZERO                 
#             bin <lo,port[1]>                                0          1          1    ZERO                 
#             bin <hi[15],port[0]>                            0          1          1    ZERO                 
#             bin <hi[14],port[0]>                            0          1          1    ZERO                 
#             bin <hi[11],port[0]>                            0          1          1    ZERO                 
#             bin <hi[10],port[0]>                            0          1          1    ZERO                 
#             bin <hi[9],port[0]>                             0          1          1    ZERO                 
#             bin <hi[8],port[0]>                             0          1          1    ZERO                 
# 
# COVERGROUP COVERAGE:
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/CovPort                                  45.83%        100          -    Uncovered            
#     covered/total bins:                                    39         98          -                      
#     missing/total bins:                                    59         98          -                      
#     % Hit:                                             39.79%        100          -                      
#     Coverpoint port                                     0.00%        100          -    ZERO                 
#         covered/total bins:                                 8          8          -                      
#         missing/total bins:                                 0          8          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint kind                                    80.00%        100          -    Uncovered            
#         covered/total bins:                                 8         10          -                      
#         missing/total bins:                                 2         10          -                      
#         % Hit:                                         80.00%        100          -                      
#     Cross #cross__0#                                   28.75%        100          -    Uncovered            
#         covered/total bins:                                23         80          -                      
#         missing/total bins:                                57         80          -                      
#         % Hit:                                         28.75%        100          -                      
#  Covergroup instance \/top/t1/ck                       45.83%        100          -    Uncovered            
#     covered/total bins:                                    39         98          -                      
#     missing/total bins:                                    59         98          -                      
#     % Hit:                                             39.79%        100          -                      
#     Coverpoint port [1]                               100.00%        100          -    Covered              
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
#     Cross #cross__0#                                   28.75%        100          -    Uncovered            
#         covered/total bins:                                23         80          -                      
#         missing/total bins:                                57         80          -                      
#         % Hit:                                         28.75%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin <hi[15],port[7]>                            1          1          -    Covered              
#             bin <hi[11],port[7]>                            1          1          -    Covered              
#             bin <hi[10],port[7]>                            1          1          -    Covered              
#             bin <hi[15],port[6]>                            1          1          -    Covered              
#             bin <hi[11],port[6]>                            1          1          -    Covered              
#             bin <hi[14],port[4]>                            1          1          -    Covered              
#             bin <hi[11],port[4]>                            1          1          -    Covered              
#             bin <hi[8],port[4]>                             1          1          -    Covered              
#             bin <hi[15],port[3]>                            1          1          -    Covered              
#             bin <hi[14],port[3]>                            2          1          -    Covered              
#             bin <hi[12],port[3]>                            1          1          -    Covered              
#             bin <hi[11],port[3]>                            1          1          -    Covered              
#             bin <hi[8],port[3]>                             2          1          -    Covered              
#             bin <hi[9],port[2]>                             1          1          -    Covered              
#             bin <hi[12],port[1]>                            1          1          -    Covered              
#             bin <hi[10],port[1]>                            1          1          -    Covered              
#             bin <hi[12],port[0]>                            2          1          -    Covered              
#             bin <lo,port[6]>                                2          1          -    Covered              
#             bin <lo,port[5]>                                2          1          -    Covered              
#             bin <lo,port[4]>                                1          1          -    Covered              
#             bin <lo,port[3]>                                1          1          -    Covered              
#             bin <lo,port[2]>                                1          1          -    Covered              
#             bin <lo,port[0]>                                1          1          -    Covered              
#             bin <hi[13],*>                                  0          1          8    ZERO                 
#             bin <zero,*>                                    0          1          8    ZERO                 
#             bin <hi[14],port[7]>                            0          1          1    ZERO                 
#             bin <hi[12],port[7]>                            0          1          1    ZERO                 
#             bin <hi[9],port[7]>                             0          1          1    ZERO                 
#             bin <hi[8],port[7]>                             0          1          1    ZERO                 
#             bin <lo,port[7]>                                0          1          1    ZERO                 
#             bin <hi[14],port[6]>                            0          1          1    ZERO                 
#             bin <hi[12],port[6]>                            0          1          1    ZERO                 
#             bin <hi[10],port[6]>                            0          1          1    ZERO                 
#             bin <hi[9],port[6]>                             0          1          1    ZERO                 
#             bin <hi[8],port[6]>                             0          1          1    ZERO                 
#             bin <hi[15],port[5]>                            0          1          1    ZERO                 
#             bin <hi[14],port[5]>                            0          1          1    ZERO                 
#             bin <hi[12],port[5]>                            0          1          1    ZERO                 
#             bin <hi[11],port[5]>                            0          1          1    ZERO                 
#             bin <hi[10],port[5]>                            0          1          1    ZERO                 
#             bin <hi[9],port[5]>                             0          1          1    ZERO                 
#             bin <hi[8],port[5]>                             0          1          1    ZERO                 
#             bin <hi[15],port[4]>                            0          1          1    ZERO                 
#             bin <hi[12],port[4]>                            0          1          1    ZERO                 
#             bin <hi[10],port[4]>                            0          1          1    ZERO                 
#             bin <hi[9],port[4]>                             0          1          1    ZERO                 
#             bin <hi[10],port[3]>                            0          1          1    ZERO                 
#             bin <hi[9],port[3]>                             0          1          1    ZERO                 
#             bin <hi[15],port[2]>                            0          1          1    ZERO                 
#             bin <hi[14],port[2]>                            0          1          1    ZERO                 
#             bin <hi[12],port[2]>                            0          1          1    ZERO                 
#             bin <hi[11],port[2]>                            0          1          1    ZERO                 
#             bin <hi[10],port[2]>                            0          1          1    ZERO                 
#             bin <hi[8],port[2]>                             0          1          1    ZERO                 
#             bin <hi[15],port[1]>                            0          1          1    ZERO                 
#             bin <hi[14],port[1]>                            0          1          1    ZERO                 
#             bin <hi[11],port[1]>                            0          1          1    ZERO                 
#             bin <hi[9],port[1]>                             0          1          1    ZERO                 
#             bin <hi[8],port[1]>                             0          1          1    ZERO                 
#             bin <lo,port[1]>                                0          1          1    ZERO                 
#             bin <hi[15],port[0]>                            0          1          1    ZERO                 
#             bin <hi[14],port[0]>                            0          1          1    ZERO                 
#             bin <hi[11],port[0]>                            0          1          1    ZERO                 
#             bin <hi[10],port[0]>                            0          1          1    ZERO                 
#             bin <hi[9],port[0]>                             0          1          1    ZERO                 
#             bin <hi[8],port[0]>                             0          1          1    ZERO                 
# 
#  [1] - Does not contribute coverage as weight is 0
# 
# TOTAL COVERGROUP COVERAGE: 45.83%  COVERGROUP TYPES: 1
# 
# ASSERTION RESULTS:
# --------------------------------------------------------------------
# Name                 File(Line)                   Failure      Pass 
#                                                   Count        Count
# --------------------------------------------------------------------
# /top/t1/#ublk#502948#49/immed__50
#                      design.sv(50)                      0          1
# 
# Total Coverage By Instance (filtered view): 72.91%
# 
# 
# End time: 10:07:24 on Nov 04,2023, Elapsed time: 0:00:02
# Errors: 0, Warnings: 0
Done