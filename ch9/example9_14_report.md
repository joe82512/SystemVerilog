[2023-11-04 11:00:54 UTC] vlib work && vlog -writetoplevels questa.tops '-timescale' '1ns/1ns' design.sv testbench.sv  && vsim -f questa.tops -batch -do run.do -voptargs=+acc=npr 
QuestaSim-64 vlog 2021.3 Compiler 2021.07 Jul 13 2021
Start time: 07:00:54 on Nov 04,2023
vlog -writetoplevels questa.tops -timescale 1ns/1ns design.sv testbench.sv 
-- Compiling interface busifc
-- Compiling program test
-- Compiling module top

Top level modules:
	top
End time: 07:00:54 on Nov 04,2023, Elapsed time: 0:00:00
Errors: 0, Warnings: 0
# vsim top -batch -do "run.do" -voptargs="+acc=npr" 
# Start time: 07:00:54 on Nov 04,2023
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
# Coverage = 70.17%
# ** Note: $stop    : design.sv(62)
#    Time: 315 ns  Iteration: 1  Instance: /top/t1
# Break in Module test at design.sv line 62
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
# /top/t1/#ublk#502948#54/immed__55
#                      design.sv(55)                      0          1
# 
# Covergroup Coverage:
#     Covergroups                      1        na        na    70.16%
#         Coverpoints/Crosses          5        na        na        na
#             Covergroup Bins         85        56        29    65.88%
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/CovAll                                   70.16%        100          -    Uncovered            
#     covered/total bins:                                    56         85          -                      
#     missing/total bins:                                    29         85          -                      
#     % Hit:                                             65.88%        100          -                      
#     Coverpoint len16                                   87.50%        100          -    Uncovered            
#         covered/total bins:                                14         16          -                      
#         missing/total bins:                                 2         16          -                      
#         % Hit:                                         87.50%        100          -                      
#     Coverpoint len32                                   50.00%        100          -    Uncovered            
#         covered/total bins:                                16         32          -                      
#         missing/total bins:                                16         32          -                      
#         % Hit:                                         50.00%        100          -                      
#     Coverpoint len                                     66.66%        100          -    Uncovered            
#         covered/total bins:                                16         24          -                      
#         missing/total bins:                                 8         24          -                      
#         % Hit:                                         66.66%        100          -                      
#     Coverpoint kind                                    80.00%        100          -    Uncovered            
#         covered/total bins:                                 8         10          -                      
#         missing/total bins:                                 2         10          -                      
#         % Hit:                                         80.00%        100          -                      
#     Coverpoint int_signed                              66.66%        100          -    Uncovered            
#         covered/total bins:                                 2          3          -                      
#         missing/total bins:                                 1          3          -                      
#         % Hit:                                         66.66%        100          -                      
#  Covergroup instance \/top/t1/ck                       70.16%        100          -    Uncovered            
#     covered/total bins:                                    56         85          -                      
#     missing/total bins:                                    29         85          -                      
#     % Hit:                                             65.88%        100          -                      
#     Coverpoint len16                                   87.50%        100          -    Uncovered            
#         covered/total bins:                                14         16          -                      
#         missing/total bins:                                 2         16          -                      
#         % Hit:                                         87.50%        100          -                      
#         bin auto[0]                                         1          1          -    Covered              
#         bin auto[1]                                         3          1          -    Covered              
#         bin auto[2]                                         3          1          -    Covered              
#         bin auto[3]                                         2          1          -    Covered              
#         bin auto[4]                                         2          1          -    Covered              
#         bin auto[5]                                         0          1          -    ZERO                 
#         bin auto[6]                                         2          1          -    Covered              
#         bin auto[7]                                         1          1          -    Covered              
#         bin auto[8]                                         0          1          -    ZERO                 
#         bin auto[9]                                         3          1          -    Covered              
#         bin auto[10]                                        3          1          -    Covered              
#         bin auto[11]                                        4          1          -    Covered              
#         bin auto[12]                                        1          1          -    Covered              
#         bin auto[13]                                        2          1          -    Covered              
#         bin auto[14]                                        1          1          -    Covered              
#         bin auto[15]                                        4          1          -    Covered              
#     Coverpoint len32                                   50.00%        100          -    Uncovered            
#         covered/total bins:                                16         32          -                      
#         missing/total bins:                                16         32          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin auto[0]                                         0          1          -    ZERO                 
#         bin auto[1]                                         0          1          -    ZERO                 
#         bin auto[2]                                         2          1          -    Covered              
#         bin auto[3]                                         1          1          -    Covered              
#         bin auto[4]                                         2          1          -    Covered              
#         bin auto[5]                                         0          1          -    ZERO                 
#         bin auto[6]                                         2          1          -    Covered              
#         bin auto[7]                                         1          1          -    Covered              
#         bin auto[8]                                         0          1          -    ZERO                 
#         bin auto[9]                                         3          1          -    Covered              
#         bin auto[10]                                        3          1          -    Covered              
#         bin auto[11]                                        4          1          -    Covered              
#         bin auto[12]                                        1          1          -    Covered              
#         bin auto[13]                                        2          1          -    Covered              
#         bin auto[14]                                        1          1          -    Covered              
#         bin auto[15]                                        4          1          -    Covered              
#         bin auto[16]                                        1          1          -    Covered              
#         bin auto[17]                                        3          1          -    Covered              
#         bin auto[18]                                        1          1          -    Covered              
#         bin auto[19]                                        1          1          -    Covered              
#         bin auto[20]                                        0          1          -    ZERO                 
#         bin auto[21]                                        0          1          -    ZERO                 
#         bin auto[22]                                        0          1          -    ZERO                 
#         bin auto[23]                                        0          1          -    ZERO                 
#         bin auto[24]                                        0          1          -    ZERO                 
#         bin auto[25]                                        0          1          -    ZERO                 
#         bin auto[26]                                        0          1          -    ZERO                 
#         bin auto[27]                                        0          1          -    ZERO                 
#         bin auto[28]                                        0          1          -    ZERO                 
#         bin auto[29]                                        0          1          -    ZERO                 
#         bin auto[30]                                        0          1          -    ZERO                 
#         bin auto[31]                                        0          1          -    ZERO                 
#     Coverpoint len                                     66.66%        100          -    Uncovered            
#         covered/total bins:                                16         24          -                      
#         missing/total bins:                                 8         24          -                      
#         % Hit:                                         66.66%        100          -                      
#         bin len[0]                                          0          1          -    ZERO                 
#         bin len[1]                                          0          1          -    ZERO                 
#         bin len[2]                                          2          1          -    Covered              
#         bin len[3]                                          1          1          -    Covered              
#         bin len[4]                                          2          1          -    Covered              
#         bin len[5]                                          0          1          -    ZERO                 
#         bin len[6]                                          2          1          -    Covered              
#         bin len[7]                                          1          1          -    Covered              
#         bin len[8]                                          0          1          -    ZERO                 
#         bin len[9]                                          3          1          -    Covered              
#         bin len[10]                                         3          1          -    Covered              
#         bin len[11]                                         4          1          -    Covered              
#         bin len[12]                                         1          1          -    Covered              
#         bin len[13]                                         2          1          -    Covered              
#         bin len[14]                                         1          1          -    Covered              
#         bin len[15]                                         4          1          -    Covered              
#         bin len[16]                                         1          1          -    Covered              
#         bin len[17]                                         3          1          -    Covered              
#         bin len[18]                                         1          1          -    Covered              
#         bin len[19]                                         1          1          -    Covered              
#         bin len[20]                                         0          1          -    ZERO                 
#         bin len[21]                                         0          1          -    ZERO                 
#         bin len[22]                                         0          1          -    ZERO                 
#         bin len[23]                                         0          1          -    ZERO                 
#     Coverpoint kind                                    80.00%        100          -    Uncovered            
#         covered/total bins:                                 8         10          -                      
#         missing/total bins:                                 2         10          -                      
#         % Hit:                                         80.00%        100          -                      
#         bin zero                                            0          1          -    ZERO                 
#         bin lo                                             11          1          -    Covered              
#         bin hi[8]                                           3          1          -    Covered              
#         bin hi[9]                                           1          1          -    Covered              
#         bin hi[10]                                          2          1          -    Covered              
#         bin hi[11]                                          4          1          -    Covered              
#         bin hi[12]                                          4          1          -    Covered              
#         bin hi[13]                                          0          1          -    ZERO                 
#         bin hi[14]                                          3          1          -    Covered              
#         bin hi[15]                                          3          1          -    Covered              
#         default bin misc                                    1                     -    Occurred             
#     Coverpoint int_signed                              66.66%        100          -    Uncovered            
#         covered/total bins:                                 2          3          -                      
#         missing/total bins:                                 1          3          -                      
#         % Hit:                                         66.66%        100          -                      
#         bin neg                                            20          1          -    Covered              
#         bin zero                                            0          1          -    ZERO                 
#         bin pos                                            12          1          -    Covered              
# 
# COVERGROUP COVERAGE:
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/CovAll                                   70.16%        100          -    Uncovered            
#     covered/total bins:                                    56         85          -                      
#     missing/total bins:                                    29         85          -                      
#     % Hit:                                             65.88%        100          -                      
#     Coverpoint len16                                   87.50%        100          -    Uncovered            
#         covered/total bins:                                14         16          -                      
#         missing/total bins:                                 2         16          -                      
#         % Hit:                                         87.50%        100          -                      
#     Coverpoint len32                                   50.00%        100          -    Uncovered            
#         covered/total bins:                                16         32          -                      
#         missing/total bins:                                16         32          -                      
#         % Hit:                                         50.00%        100          -                      
#     Coverpoint len                                     66.66%        100          -    Uncovered            
#         covered/total bins:                                16         24          -                      
#         missing/total bins:                                 8         24          -                      
#         % Hit:                                         66.66%        100          -                      
#     Coverpoint kind                                    80.00%        100          -    Uncovered            
#         covered/total bins:                                 8         10          -                      
#         missing/total bins:                                 2         10          -                      
#         % Hit:                                         80.00%        100          -                      
#     Coverpoint int_signed                              66.66%        100          -    Uncovered            
#         covered/total bins:                                 2          3          -                      
#         missing/total bins:                                 1          3          -                      
#         % Hit:                                         66.66%        100          -                      
#  Covergroup instance \/top/t1/ck                       70.16%        100          -    Uncovered            
#     covered/total bins:                                    56         85          -                      
#     missing/total bins:                                    29         85          -                      
#     % Hit:                                             65.88%        100          -                      
#     Coverpoint len16                                   87.50%        100          -    Uncovered            
#         covered/total bins:                                14         16          -                      
#         missing/total bins:                                 2         16          -                      
#         % Hit:                                         87.50%        100          -                      
#         bin auto[0]                                         1          1          -    Covered              
#         bin auto[1]                                         3          1          -    Covered              
#         bin auto[2]                                         3          1          -    Covered              
#         bin auto[3]                                         2          1          -    Covered              
#         bin auto[4]                                         2          1          -    Covered              
#         bin auto[5]                                         0          1          -    ZERO                 
#         bin auto[6]                                         2          1          -    Covered              
#         bin auto[7]                                         1          1          -    Covered              
#         bin auto[8]                                         0          1          -    ZERO                 
#         bin auto[9]                                         3          1          -    Covered              
#         bin auto[10]                                        3          1          -    Covered              
#         bin auto[11]                                        4          1          -    Covered              
#         bin auto[12]                                        1          1          -    Covered              
#         bin auto[13]                                        2          1          -    Covered              
#         bin auto[14]                                        1          1          -    Covered              
#         bin auto[15]                                        4          1          -    Covered              
#     Coverpoint len32                                   50.00%        100          -    Uncovered            
#         covered/total bins:                                16         32          -                      
#         missing/total bins:                                16         32          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin auto[0]                                         0          1          -    ZERO                 
#         bin auto[1]                                         0          1          -    ZERO                 
#         bin auto[2]                                         2          1          -    Covered              
#         bin auto[3]                                         1          1          -    Covered              
#         bin auto[4]                                         2          1          -    Covered              
#         bin auto[5]                                         0          1          -    ZERO                 
#         bin auto[6]                                         2          1          -    Covered              
#         bin auto[7]                                         1          1          -    Covered              
#         bin auto[8]                                         0          1          -    ZERO                 
#         bin auto[9]                                         3          1          -    Covered              
#         bin auto[10]                                        3          1          -    Covered              
#         bin auto[11]                                        4          1          -    Covered              
#         bin auto[12]                                        1          1          -    Covered              
#         bin auto[13]                                        2          1          -    Covered              
#         bin auto[14]                                        1          1          -    Covered              
#         bin auto[15]                                        4          1          -    Covered              
#         bin auto[16]                                        1          1          -    Covered              
#         bin auto[17]                                        3          1          -    Covered              
#         bin auto[18]                                        1          1          -    Covered              
#         bin auto[19]                                        1          1          -    Covered              
#         bin auto[20]                                        0          1          -    ZERO                 
#         bin auto[21]                                        0          1          -    ZERO                 
#         bin auto[22]                                        0          1          -    ZERO                 
#         bin auto[23]                                        0          1          -    ZERO                 
#         bin auto[24]                                        0          1          -    ZERO                 
#         bin auto[25]                                        0          1          -    ZERO                 
#         bin auto[26]                                        0          1          -    ZERO                 
#         bin auto[27]                                        0          1          -    ZERO                 
#         bin auto[28]                                        0          1          -    ZERO                 
#         bin auto[29]                                        0          1          -    ZERO                 
#         bin auto[30]                                        0          1          -    ZERO                 
#         bin auto[31]                                        0          1          -    ZERO                 
#     Coverpoint len                                     66.66%        100          -    Uncovered            
#         covered/total bins:                                16         24          -                      
#         missing/total bins:                                 8         24          -                      
#         % Hit:                                         66.66%        100          -                      
#         bin len[0]                                          0          1          -    ZERO                 
#         bin len[1]                                          0          1          -    ZERO                 
#         bin len[2]                                          2          1          -    Covered              
#         bin len[3]                                          1          1          -    Covered              
#         bin len[4]                                          2          1          -    Covered              
#         bin len[5]                                          0          1          -    ZERO                 
#         bin len[6]                                          2          1          -    Covered              
#         bin len[7]                                          1          1          -    Covered              
#         bin len[8]                                          0          1          -    ZERO                 
#         bin len[9]                                          3          1          -    Covered              
#         bin len[10]                                         3          1          -    Covered              
#         bin len[11]                                         4          1          -    Covered              
#         bin len[12]                                         1          1          -    Covered              
#         bin len[13]                                         2          1          -    Covered              
#         bin len[14]                                         1          1          -    Covered              
#         bin len[15]                                         4          1          -    Covered              
#         bin len[16]                                         1          1          -    Covered              
#         bin len[17]                                         3          1          -    Covered              
#         bin len[18]                                         1          1          -    Covered              
#         bin len[19]                                         1          1          -    Covered              
#         bin len[20]                                         0          1          -    ZERO                 
#         bin len[21]                                         0          1          -    ZERO                 
#         bin len[22]                                         0          1          -    ZERO                 
#         bin len[23]                                         0          1          -    ZERO                 
#     Coverpoint kind                                    80.00%        100          -    Uncovered            
#         covered/total bins:                                 8         10          -                      
#         missing/total bins:                                 2         10          -                      
#         % Hit:                                         80.00%        100          -                      
#         bin zero                                            0          1          -    ZERO                 
#         bin lo                                             11          1          -    Covered              
#         bin hi[8]                                           3          1          -    Covered              
#         bin hi[9]                                           1          1          -    Covered              
#         bin hi[10]                                          2          1          -    Covered              
#         bin hi[11]                                          4          1          -    Covered              
#         bin hi[12]                                          4          1          -    Covered              
#         bin hi[13]                                          0          1          -    ZERO                 
#         bin hi[14]                                          3          1          -    Covered              
#         bin hi[15]                                          3          1          -    Covered              
#         default bin misc                                    1                     -    Occurred             
#     Coverpoint int_signed                              66.66%        100          -    Uncovered            
#         covered/total bins:                                 2          3          -                      
#         missing/total bins:                                 1          3          -                      
#         % Hit:                                         66.66%        100          -                      
#         bin neg                                            20          1          -    Covered              
#         bin zero                                            0          1          -    ZERO                 
#         bin pos                                            12          1          -    Covered              
# 
# TOTAL COVERGROUP COVERAGE: 70.16%  COVERGROUP TYPES: 1
# 
# ASSERTION RESULTS:
# --------------------------------------------------------------------
# Name                 File(Line)                   Failure      Pass 
#                                                   Count        Count
# --------------------------------------------------------------------
# /top/t1/#ublk#502948#54/immed__55
#                      design.sv(55)                      0          1
# 
# Total Coverage By Instance (filtered view): 85.08%
# 
# 
# End time: 07:00:55 on Nov 04,2023, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
Done