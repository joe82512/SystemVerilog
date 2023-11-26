[2023-11-05 02:57:43 UTC] vlib work && vlog -writetoplevels questa.tops '-timescale' '1ns/1ns' design.sv testbench.sv  && vsim -f questa.tops -batch -do run.do -voptargs=+acc=npr 
QuestaSim-64 vlog 2021.3 Compiler 2021.07 Jul 13 2021
Start time: 22:57:43 on Nov 04,2023
vlog -writetoplevels questa.tops -timescale 1ns/1ns design.sv testbench.sv 
-- Compiling interface busifc
-- Compiling program test
-- Compiling module top

Top level modules:
	top
End time: 22:57:43 on Nov 04,2023, Elapsed time: 0:00:00
Errors: 0, Warnings: 0
# vsim top -batch -do "run.do" -voptargs="+acc=npr" 
# Start time: 22:57:43 on Nov 04,2023
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
# ** Note: $stop    : design.sv(47)
#    Time: 99995 ns  Iteration: 1  Instance: /top/t1
# Break in Module test at design.sv line 47
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
# /top/t1/#ublk#502948#41/immed__42
#                      design.sv(42)                      0          1
# 
# Covergroup Coverage:
#     Covergroups                      1        na        na   100.00%
#         Coverpoints/Crosses          1        na        na        na
#             Covergroup Bins         23        23         0   100.00%
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/CovLen                                  100.00%        100          -    Covered              
#     covered/total bins:                                    23         23          -                      
#     missing/total bins:                                     0         23          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint #coverpoint__0#                        100.00%        100          -    Covered              
#         covered/total bins:                                23         23          -                      
#         missing/total bins:                                 0         23          -                      
#         % Hit:                                        100.00%        100          -                      
#  Covergroup instance \/top/t1/ck                      100.00%        100          -    Covered              
#     covered/total bins:                                    23         23          -                      
#     missing/total bins:                                     0         23          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint #coverpoint__0#                        100.00%        100          -    Covered              
#         covered/total bins:                                23         23          -                      
#         missing/total bins:                                 0         23          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin len[0]                                        448          1          -    Covered              
#         bin len[1]                                        448          1          -    Covered              
#         bin len[2]                                        441          1          -    Covered              
#         bin len[3]                                        416          1          -    Covered              
#         bin len[4]                                        477          1          -    Covered              
#         bin len[5]                                        394          1          -    Covered              
#         bin len[6]                                        437          1          -    Covered              
#         bin len[7]                                        455          1          -    Covered              
#         bin len[8]                                        430          1          -    Covered              
#         bin len[9]                                        454          1          -    Covered              
#         bin len[10]                                       437          1          -    Covered              
#         bin len[11]                                       411          1          -    Covered              
#         bin len[12]                                       415          1          -    Covered              
#         bin len[13]                                       438          1          -    Covered              
#         bin len[14]                                       410          1          -    Covered              
#         bin len[15]                                       438          1          -    Covered              
#         bin len[16]                                       429          1          -    Covered              
#         bin len[17]                                       419          1          -    Covered              
#         bin len[18]                                       438          1          -    Covered              
#         bin len[19]                                       417          1          -    Covered              
#         bin len[20]                                       423          1          -    Covered              
#         bin len[21]                                       442          1          -    Covered              
#         bin len[22]                                       483          1          -    Covered              
# 
# COVERGROUP COVERAGE:
# ----------------------------------------------------------------------------------------------------------
# Covergroup                                             Metric       Goal       Bins    Status               
#                                                                                                          
# ----------------------------------------------------------------------------------------------------------
#  TYPE /top/t1/CovLen                                  100.00%        100          -    Covered              
#     covered/total bins:                                    23         23          -                      
#     missing/total bins:                                     0         23          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint #coverpoint__0#                        100.00%        100          -    Covered              
#         covered/total bins:                                23         23          -                      
#         missing/total bins:                                 0         23          -                      
#         % Hit:                                        100.00%        100          -                      
#  Covergroup instance \/top/t1/ck                      100.00%        100          -    Covered              
#     covered/total bins:                                    23         23          -                      
#     missing/total bins:                                     0         23          -                      
#     % Hit:                                            100.00%        100          -                      
#     Coverpoint #coverpoint__0#                        100.00%        100          -    Covered              
#         covered/total bins:                                23         23          -                      
#         missing/total bins:                                 0         23          -                      
#         % Hit:                                        100.00%        100          -                      
#         bin len[0]                                        448          1          -    Covered              
#         bin len[1]                                        448          1          -    Covered              
#         bin len[2]                                        441          1          -    Covered              
#         bin len[3]                                        416          1          -    Covered              
#         bin len[4]                                        477          1          -    Covered              
#         bin len[5]                                        394          1          -    Covered              
#         bin len[6]                                        437          1          -    Covered              
#         bin len[7]                                        455          1          -    Covered              
#         bin len[8]                                        430          1          -    Covered              
#         bin len[9]                                        454          1          -    Covered              
#         bin len[10]                                       437          1          -    Covered              
#         bin len[11]                                       411          1          -    Covered              
#         bin len[12]                                       415          1          -    Covered              
#         bin len[13]                                       438          1          -    Covered              
#         bin len[14]                                       410          1          -    Covered              
#         bin len[15]                                       438          1          -    Covered              
#         bin len[16]                                       429          1          -    Covered              
#         bin len[17]                                       419          1          -    Covered              
#         bin len[18]                                       438          1          -    Covered              
#         bin len[19]                                       417          1          -    Covered              
#         bin len[20]                                       423          1          -    Covered              
#         bin len[21]                                       442          1          -    Covered              
#         bin len[22]                                       483          1          -    Covered              
# 
# TOTAL COVERGROUP COVERAGE: 100.00%  COVERGROUP TYPES: 1
# 
# ASSERTION RESULTS:
# --------------------------------------------------------------------
# Name                 File(Line)                   Failure      Pass 
#                                                   Count        Count
# --------------------------------------------------------------------
# /top/t1/#ublk#502948#41/immed__42
#                      design.sv(42)                      0          1
# 
# Total Coverage By Instance (filtered view): 100.00%
# 
# 
# End time: 22:57:44 on Nov 04,2023, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
Done