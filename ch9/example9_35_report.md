[2023-11-04 14:36:10 UTC] vlib work && vlog -writetoplevels questa.tops '-timescale' '1ns/1ns' design.sv testbench.sv  && vsim -f questa.tops -batch -do run.do -voptargs=+acc=npr 
QuestaSim-64 vlog 2021.3 Compiler 2021.07 Jul 13 2021
Start time: 10:36:10 on Nov 04,2023
vlog -writetoplevels questa.tops -timescale 1ns/1ns design.sv testbench.sv 
-- Compiling interface busifc
-- Compiling program test
-- Compiling module top

Top level modules:
	top
End time: 10:36:10 on Nov 04,2023, Elapsed time: 0:00:00
Errors: 0, Warnings: 0
# vsim top -batch -do "run.do" -voptargs="+acc=npr" 
# Start time: 10:36:10 on Nov 04,2023
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
# (a,b)=(1,0)
# (a,b)=(1,0)
# (a,b)=(0,0)
# (a,b)=(0,0)
# ** Note: $stop    : design.sv(84)
#    Time: 35 ns  Iteration: 1  Instance: /top/t1
# Break in Module test at design.sv line 84
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
# /top/t1/#ublk#502948#76/immed__77
#                      design.sv(77)                      0          1
# 
# Covergroup Coverage:
#     Covergroups                      3        na        na    66.66%
#         Coverpoints/Crosses          7        na        na        na
#             Covergroup Bins         17        12         5    70.58%
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/CrossBinNames                            66.66%        100          -    Uncovered            
#     covered/total bins:                                     5          7          -                      
#     missing/total bins:                                     2          7          -                      
#     % Hit:                                             71.42%        100          -                      
#     Coverpoint a                                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint b                                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#     Cross ab                                           66.66%        100          -    Uncovered            
#         covered/total bins:                                 2          3          -                      
#         missing/total bins:                                 1          3          -                      
#         % Hit:                                         66.66%        100          -                      
#  Covergroup instance \/top/t1/ck_name                  66.66%        100          -    Uncovered            
#     covered/total bins:                                     5          7          -                      
#     missing/total bins:                                     2          7          -                      
#     % Hit:                                             71.42%        100          -                      
#     Coverpoint a [1]                                  100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin a0                                              2          1          -    Covered              
#         bin a1                                              2          1          -    Covered              
#     Coverpoint b [1]                                   50.00%        100          -    Uncovered            
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin b0                                              4          1          -    Covered              
#         bin b1                                              0          1          -    ZERO                 
#     Cross ab                                           66.66%        100          -    Uncovered            
#         covered/total bins:                                 2          3          -                      
#         missing/total bins:                                 1          3          -                      
#         % Hit:                                         66.66%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin a0b0                                        2          1          -    Covered              
#             bin a1b0                                        2          1          -    Covered              
#             bin b1                                          0          1          -    ZERO                 
#  TYPE /top/t1/CrossBinsofIntersect                     66.66%        100          -    Uncovered            
#     covered/total bins:                                     5          7          -                      
#     missing/total bins:                                     2          7          -                      
#     % Hit:                                             71.42%        100          -                      
#     Coverpoint a                                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint b                                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#     Cross ab                                           66.66%        100          -    Uncovered            
#         covered/total bins:                                 2          3          -                      
#         missing/total bins:                                 1          3          -                      
#         % Hit:                                         66.66%        100          -                      
#  Covergroup instance \/top/t1/ck_intersect             66.66%        100          -    Uncovered            
#     covered/total bins:                                     5          7          -                      
#     missing/total bins:                                     2          7          -                      
#     % Hit:                                             71.42%        100          -                      
#     Coverpoint a [1]                                  100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0]                                         2          1          -    Covered              
#         bin auto[1]                                         2          1          -    Covered              
#     Coverpoint b [1]                                   50.00%        100          -    Uncovered            
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin auto[0]                                         4          1          -    Covered              
#         bin auto[1]                                         0          1          -    ZERO                 
#     Cross ab                                           66.66%        100          -    Uncovered            
#         covered/total bins:                                 2          3          -                      
#         missing/total bins:                                 1          3          -                      
#         % Hit:                                         66.66%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin a0b0                                        2          1          -    Covered              
#             bin a1b0                                        2          1          -    Covered              
#             bin b1                                          0          1          -    ZERO                 
#  TYPE /top/t1/CrossManual                              66.66%        100          -    Uncovered            
#     covered/total bins:                                     2          3          -                      
#     missing/total bins:                                     1          3          -                      
#     % Hit:                                             66.66%        100          -                      
#     Coverpoint ab                                      66.66%        100          -    Uncovered            
#         covered/total bins:                                 2          3          -                      
#         missing/total bins:                                 1          3          -                      
#         % Hit:                                         66.66%        100          -                      
#  Covergroup instance \/top/t1/ck_manual                66.66%        100          -    Uncovered            
#     covered/total bins:                                     2          3          -                      
#     missing/total bins:                                     1          3          -                      
#     % Hit:                                             66.66%        100          -                      
#     Coverpoint ab                                      66.66%        100          -    Uncovered            
#         covered/total bins:                                 2          3          -                      
#         missing/total bins:                                 1          3          -                      
#         % Hit:                                         66.66%        100          -                      
#         bin a0b0                                            2          1          -    Covered              
#         bin a1b0                                            2          1          -    Covered              
#         bin b1                                              0          1          -    ZERO                 
# 
# COVERGROUP COVERAGE:
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/CrossBinNames                            66.66%        100          -    Uncovered            
#     covered/total bins:                                     5          7          -                      
#     missing/total bins:                                     2          7          -                      
#     % Hit:                                             71.42%        100          -                      
#     Coverpoint a                                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint b                                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#     Cross ab                                           66.66%        100          -    Uncovered            
#         covered/total bins:                                 2          3          -                      
#         missing/total bins:                                 1          3          -                      
#         % Hit:                                         66.66%        100          -                      
#  Covergroup instance \/top/t1/ck_name                  66.66%        100          -    Uncovered            
#     covered/total bins:                                     5          7          -                      
#     missing/total bins:                                     2          7          -                      
#     % Hit:                                             71.42%        100          -                      
#     Coverpoint a [1]                                  100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin a0                                              2          1          -    Covered              
#         bin a1                                              2          1          -    Covered              
#     Coverpoint b [1]                                   50.00%        100          -    Uncovered            
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin b0                                              4          1          -    Covered              
#         bin b1                                              0          1          -    ZERO                 
#     Cross ab                                           66.66%        100          -    Uncovered            
#         covered/total bins:                                 2          3          -                      
#         missing/total bins:                                 1          3          -                      
#         % Hit:                                         66.66%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin a0b0                                        2          1          -    Covered              
#             bin a1b0                                        2          1          -    Covered              
#             bin b1                                          0          1          -    ZERO                 
#  TYPE /top/t1/CrossBinsofIntersect                     66.66%        100          -    Uncovered            
#     covered/total bins:                                     5          7          -                      
#     missing/total bins:                                     2          7          -                      
#     % Hit:                                             71.42%        100          -                      
#     Coverpoint a                                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#     Coverpoint b                                        0.00%        100          -    ZERO                 
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#     Cross ab                                           66.66%        100          -    Uncovered            
#         covered/total bins:                                 2          3          -                      
#         missing/total bins:                                 1          3          -                      
#         % Hit:                                         66.66%        100          -                      
#  Covergroup instance \/top/t1/ck_intersect             66.66%        100          -    Uncovered            
#     covered/total bins:                                     5          7          -                      
#     missing/total bins:                                     2          7          -                      
#     % Hit:                                             71.42%        100          -                      
#     Coverpoint a [1]                                  100.00%        100          -    Covered              
#         covered/total bins:                                 2          2          -                      
#         missing/total bins:                                 0          2          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin auto[0]                                         2          1          -    Covered              
#         bin auto[1]                                         2          1          -    Covered              
#     Coverpoint b [1]                                   50.00%        100          -    Uncovered            
#         covered/total bins:                                 1          2          -                      
#         missing/total bins:                                 1          2          -                      
#         % Hit:                                         50.00%        100          -                      
#         bin auto[0]                                         4          1          -    Covered              
#         bin auto[1]                                         0          1          -    ZERO                 
#     Cross ab                                           66.66%        100          -    Uncovered            
#         covered/total bins:                                 2          3          -                      
#         missing/total bins:                                 1          3          -                      
#         % Hit:                                         66.66%        100          -                      
#         Auto, Default and User Defined Bins:
#             bin a0b0                                        2          1          -    Covered              
#             bin a1b0                                        2          1          -    Covered              
#             bin b1                                          0          1          -    ZERO                 
#  TYPE /top/t1/CrossManual                              66.66%        100          -    Uncovered            
#     covered/total bins:                                     2          3          -                      
#     missing/total bins:                                     1          3          -                      
#     % Hit:                                             66.66%        100          -                      
#     Coverpoint ab                                      66.66%        100          -    Uncovered            
#         covered/total bins:                                 2          3          -                      
#         missing/total bins:                                 1          3          -                      
#         % Hit:                                         66.66%        100          -                      
#  Covergroup instance \/top/t1/ck_manual                66.66%        100          -    Uncovered            
#     covered/total bins:                                     2          3          -                      
#     missing/total bins:                                     1          3          -                      
#     % Hit:                                             66.66%        100          -                      
#     Coverpoint ab                                      66.66%        100          -    Uncovered            
#         covered/total bins:                                 2          3          -                      
#         missing/total bins:                                 1          3          -                      
#         % Hit:                                         66.66%        100          -                      
#         bin a0b0                                            2          1          -    Covered              
#         bin a1b0                                            2          1          -    Covered              
#         bin b1                                              0          1          -    ZERO                 
# 
#  [1] - Does not contribute coverage as weight is 0
# 
# TOTAL COVERGROUP COVERAGE: 66.66%  COVERGROUP TYPES: 3
# 
# ASSERTION RESULTS:
# --------------------------------------------------------------------
# Name                 File(Line)                   Failure      Pass 
#                                                   Count        Count
# --------------------------------------------------------------------
# /top/t1/#ublk#502948#76/immed__77
#                      design.sv(77)                      0          1
# 
# Total Coverage By Instance (filtered view): 83.33%
# 
# 
# End time: 10:36:12 on Nov 04,2023, Elapsed time: 0:00:02
# Errors: 0, Warnings: 0
Done