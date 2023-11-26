[2023-11-05 08:18:20 UTC] vlib work && vlog -writetoplevels questa.tops '-timescale' '1ns/1ns' design.sv testbench.sv  && vsim -f questa.tops -batch -do run.do -voptargs=+acc=npr 
QuestaSim-64 vlog 2021.3 Compiler 2021.07 Jul 13 2021
Start time: 03:18:20 on Nov 05,2023
vlog -writetoplevels questa.tops -timescale 1ns/1ns design.sv testbench.sv 
-- Compiling interface busifc
-- Compiling program test
-- Compiling module top

Top level modules:
	top
End time: 03:18:20 on Nov 05,2023, Elapsed time: 0:00:00
Errors: 0, Warnings: 0
# vsim top -batch -do "run.do" -voptargs="+acc=npr" 
# Start time: 03:18:20 on Nov 05,2023
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
# [@5] port=3
# [@15] port=3
# [@25] port=6
# [@35] port=0
# [@45] port=1
# [@55] port=1
# [@65] port=4
# [@75] port=6
# [@85] port=3
# [@95] port=6
# [@105] port=4
# [@115] port=1
# [@125] port=5
# [@135] port=6
# [@145] port=2
# ** Note: $stop    : design.sv(53)
#    Time: 145 ns  Iteration: 1  Instance: /top/t1
# Break in Module test at design.sv line 53
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
# /top/t1/#ublk#502948#44/immed__45
#                      design.sv(45)                      0          1
# 
# Covergroup Coverage:
#     Covergroups                      2        na        na    62.50%
#         Coverpoints/Crosses          2        na        na        na
#             Covergroup Bins         16        10         6    62.50%
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/CoverPort                                62.50%        100          -    Uncovered            
#     covered/total bins:                                     5          8          -                      
#     missing/total bins:                                     3          8          -                      
#     % Hit:                                             62.50%        100          -                      
#     Coverpoint #coverpoint__0#                         62.50%        100          -    Uncovered            
#         covered/total bins:                                 5          8          -                      
#         missing/total bins:                                 3          8          -                      
#         % Hit:                                         62.50%        100          -                      
#  Covergroup instance \/top/t1/cp                       62.50%        100          -    Uncovered            
#     covered/total bins:                                     5          8          -                      
#     missing/total bins:                                     3          8          -                      
#     % Hit:                                             62.50%        100          -                      
#     Coverpoint #coverpoint__0#                         62.50%        100          -    Uncovered            
#         covered/total bins:                                 5          8          -                      
#         missing/total bins:                                 3          8          -                      
#         % Hit:                                         62.50%        100          -                      
#         bin auto[0]                                         0          1          -    ZERO                 
#         bin auto[1]                                         1          1          -    Covered              
#         bin auto[2]                                         1          1          -    Covered              
#         bin auto[3]                                         0          1          -    ZERO                 
#         bin auto[4]                                         1          1          -    Covered              
#         bin auto[5]                                         1          1          -    Covered              
#         bin auto[6]                                         1          1          -    Covered              
#         bin auto[7]                                         0          1          -    ZERO                 
#  TYPE /top/t1/CovPort                                  62.50%        100          -    Uncovered            
#     covered/total bins:                                     5          8          -                      
#     missing/total bins:                                     3          8          -                      
#     % Hit:                                             62.50%        100          -                      
#     Coverpoint #coverpoint__0#                         62.50%        100          -    Uncovered            
#         covered/total bins:                                 5          8          -                      
#         missing/total bins:                                 3          8          -                      
#         % Hit:                                         62.50%        100          -                      
#  Covergroup instance \/top/t1/ck                       62.50%        100          -    Uncovered            
#     covered/total bins:                                     5          8          -                      
#     missing/total bins:                                     3          8          -                      
#     % Hit:                                             62.50%        100          -                      
#     Coverpoint #coverpoint__0#                         62.50%        100          -    Uncovered            
#         covered/total bins:                                 5          8          -                      
#         missing/total bins:                                 3          8          -                      
#         % Hit:                                         62.50%        100          -                      
#         bin auto[0]                                         0          1          -    ZERO                 
#         bin auto[1]                                         1          1          -    Covered              
#         bin auto[2]                                         1          1          -    Covered              
#         bin auto[3]                                         0          1          -    ZERO                 
#         bin auto[4]                                         1          1          -    Covered              
#         bin auto[5]                                         1          1          -    Covered              
#         bin auto[6]                                         1          1          -    Covered              
#         bin auto[7]                                         0          1          -    ZERO                 
# 
# COVERGROUP COVERAGE:
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/CoverPort                                62.50%        100          -    Uncovered            
#     covered/total bins:                                     5          8          -                      
#     missing/total bins:                                     3          8          -                      
#     % Hit:                                             62.50%        100          -                      
#     Coverpoint #coverpoint__0#                         62.50%        100          -    Uncovered            
#         covered/total bins:                                 5          8          -                      
#         missing/total bins:                                 3          8          -                      
#         % Hit:                                         62.50%        100          -                      
#  Covergroup instance \/top/t1/cp                       62.50%        100          -    Uncovered            
#     covered/total bins:                                     5          8          -                      
#     missing/total bins:                                     3          8          -                      
#     % Hit:                                             62.50%        100          -                      
#     Coverpoint #coverpoint__0#                         62.50%        100          -    Uncovered            
#         covered/total bins:                                 5          8          -                      
#         missing/total bins:                                 3          8          -                      
#         % Hit:                                         62.50%        100          -                      
#         bin auto[0]                                         0          1          -    ZERO                 
#         bin auto[1]                                         1          1          -    Covered              
#         bin auto[2]                                         1          1          -    Covered              
#         bin auto[3]                                         0          1          -    ZERO                 
#         bin auto[4]                                         1          1          -    Covered              
#         bin auto[5]                                         1          1          -    Covered              
#         bin auto[6]                                         1          1          -    Covered              
#         bin auto[7]                                         0          1          -    ZERO                 
#  TYPE /top/t1/CovPort                                  62.50%        100          -    Uncovered            
#     covered/total bins:                                     5          8          -                      
#     missing/total bins:                                     3          8          -                      
#     % Hit:                                             62.50%        100          -                      
#     Coverpoint #coverpoint__0#                         62.50%        100          -    Uncovered            
#         covered/total bins:                                 5          8          -                      
#         missing/total bins:                                 3          8          -                      
#         % Hit:                                         62.50%        100          -                      
#  Covergroup instance \/top/t1/ck                       62.50%        100          -    Uncovered            
#     covered/total bins:                                     5          8          -                      
#     missing/total bins:                                     3          8          -                      
#     % Hit:                                             62.50%        100          -                      
#     Coverpoint #coverpoint__0#                         62.50%        100          -    Uncovered            
#         covered/total bins:                                 5          8          -                      
#         missing/total bins:                                 3          8          -                      
#         % Hit:                                         62.50%        100          -                      
#         bin auto[0]                                         0          1          -    ZERO                 
#         bin auto[1]                                         1          1          -    Covered              
#         bin auto[2]                                         1          1          -    Covered              
#         bin auto[3]                                         0          1          -    ZERO                 
#         bin auto[4]                                         1          1          -    Covered              
#         bin auto[5]                                         1          1          -    Covered              
#         bin auto[6]                                         1          1          -    Covered              
#         bin auto[7]                                         0          1          -    ZERO                 
# 
# TOTAL COVERGROUP COVERAGE: 62.50%  COVERGROUP TYPES: 2
# 
# ASSERTION RESULTS:
# --------------------------------------------------------------------
# Name                 File(Line)                   Failure      Pass 
#                                                   Count        Count
# --------------------------------------------------------------------
# /top/t1/#ublk#502948#44/immed__45
#                      design.sv(45)                      0          1
# 
# Total Coverage By Instance (filtered view): 81.25%
# 
# 
# End time: 03:18:21 on Nov 05,2023, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
Done