[2023-11-01 14:26:07 UTC] vlib work && vlog -writetoplevels questa.tops '-timescale' '1ns/1ns' design.sv testbench.sv  && vsim -f questa.tops -batch -do run.do -voptargs=+acc=npr 
QuestaSim-64 vlog 2021.3 Compiler 2021.07 Jul 13 2021
Start time: 10:26:08 on Nov 01,2023
vlog -writetoplevels questa.tops -timescale 1ns/1ns design.sv testbench.sv 
-- Compiling interface busifc
-- Compiling program test
-- Compiling module top

Top level modules:
	top
End time: 10:26:08 on Nov 01,2023, Elapsed time: 0:00:00
Errors: 0, Warnings: 0
# vsim top -batch -do "run.do" -voptargs="+acc=npr" 
# Start time: 10:26:08 on Nov 01,2023
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
# Coverage = 100.00%
# ** Note: $stop    : design.sv(42)
#    Time: 315 ns  Iteration: 1  Instance: /top/t1
# Break in Module test at design.sv line 42
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
# /top/t1/#ublk#502948#34/immed__35
#                      design.sv(35)                      0          1
# 
# Covergroup Coverage:
#     Covergroups                      1        na        na   100.00%
#         Coverpoints/Crosses          1        na        na        na
#             Covergroup Bins          8         8         0   100.00%
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/CovPort                                 100.00%        100          -    Covered              
#     covered/total bins:                                     8          8          -                      
#     missing/total bins:                                     0          8          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint #coverpoint__0#                        100.00%        100          -    Covered              
#         covered/total bins:                                 8          8          -                      
#         missing/total bins:                                 0          8          -                      
#         % Hit:                                        100.00%        100          -                      
#  Covergroup instance \/top/t1/ck                      100.00%        100          -    Covered              
#     covered/total bins:                                     8          8          -                      
#     missing/total bins:                                     0          8          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint #coverpoint__0#                        100.00%        100          -    Covered              
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
# 
# COVERGROUP COVERAGE:
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/CovPort                                 100.00%        100          -    Covered              
#     covered/total bins:                                     8          8          -                      
#     missing/total bins:                                     0          8          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint #coverpoint__0#                        100.00%        100          -    Covered              
#         covered/total bins:                                 8          8          -                      
#         missing/total bins:                                 0          8          -                      
#         % Hit:                                        100.00%        100          -                      
#  Covergroup instance \/top/t1/ck                      100.00%        100          -    Covered              
#     covered/total bins:                                     8          8          -                      
#     missing/total bins:                                     0          8          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint #coverpoint__0#                        100.00%        100          -    Covered              
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
# 
# TOTAL COVERGROUP COVERAGE: 100.00%  COVERGROUP TYPES: 1
# 
# ASSERTION RESULTS:
# --------------------------------------------------------------------
# Name                 File(Line)                   Failure      Pass 
#                                                   Count        Count
# --------------------------------------------------------------------
# /top/t1/#ublk#502948#34/immed__35
#                      design.sv(35)                      0          1
# 
# Total Coverage By Instance (filtered view): 100.00%
# 
# 
# End time: 10:26:09 on Nov 01,2023, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
Done