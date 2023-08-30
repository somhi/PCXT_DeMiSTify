# PINOUT

#Clock
set_property PACKAGE_PIN U22 [get_ports CLK_50]
set_property IOSTANDARD LVCMOS33 [get_ports CLK_50]

#Leds QMTECH
set_property PACKAGE_PIN T23 [get_ports LED5]
set_property IOSTANDARD LVCMOS33 [get_ports LED5]
set_property PACKAGE_PIN R23 [get_ports LED6]
set_property IOSTANDARD LVCMOS33 [get_ports LED6]

#Buttons QMTECH
set_property PACKAGE_PIN P4 [get_ports SW2]
set_property IOSTANDARD LVCMOS33 [get_ports SW2]

#####################################################
# Correspondence J9 (DECA CAPE) to  U4 (QMTECH A100T)
# even (parell) = -3   e.g.  J9:12 = U4:9
# odd  (senar)  = -1   e.g.  J9:11 = U4:10
#####################################################

#Keyboard and mouse  (P11=10, P12=9, P10=7, P9=8)
set_property PACKAGE_PIN A4 [get_ports PS2_KEYBOARD_CLK]
set_property IOSTANDARD LVCMOS33 [get_ports PS2_KEYBOARD_CLK]
set_property PULLUP true [get_ports PS2_KEYBOARD_CLK]
set_property PACKAGE_PIN B4 [get_ports PS2_KEYBOARD_DAT]
set_property IOSTANDARD LVCMOS33 [get_ports PS2_KEYBOARD_DAT]
set_property PULLUP true [get_ports PS2_KEYBOARD_DAT]
set_property PACKAGE_PIN B5 [get_ports PS2_MOUSE_CLK]
set_property IOSTANDARD LVCMOS33 [get_ports PS2_MOUSE_CLK]
set_property PULLUP true [get_ports PS2_MOUSE_CLK]
set_property PACKAGE_PIN A5 [get_ports PS2_MOUSE_DAT]
set_property IOSTANDARD LVCMOS33 [get_ports PS2_MOUSE_DAT]
set_property PULLUP true [get_ports PS2_MOUSE_DAT]


# Video output
# 14=11, 13=12
set_property PACKAGE_PIN A3 [get_ports VGA_HS]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_HS]
set_property PACKAGE_PIN A2 [get_ports VGA_VS]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_VS]

# set_property PACKAGE_PIN  [get_ports {VGA_R[5]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {VGA_R[5]}]
# set_property PACKAGE_PIN  [get_ports {VGA_R[4]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {VGA_R[4]}]
# 22=19, 24=21, 26=23, 16=13
set_property PACKAGE_PIN C1 [get_ports {VGA_R[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_R[3]}]
set_property PACKAGE_PIN E1 [get_ports {VGA_R[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_R[2]}]
set_property PACKAGE_PIN F2 [get_ports {VGA_R[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_R[1]}]
set_property PACKAGE_PIN D4 [get_ports {VGA_R[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_R[0]}]

# set_property PACKAGE_PIN  [get_ports {VGA_G[5]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[5]}]
# set_property PACKAGE_PIN  [get_ports {VGA_G[4]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[4]}]
# 18=15, 19=18, 20=17, 17=16
set_property PACKAGE_PIN C2 [get_ports {VGA_G[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[3]}]
set_property PACKAGE_PIN D5 [get_ports {VGA_G[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[2]}]
set_property PACKAGE_PIN E5 [get_ports {VGA_G[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[1]}]
set_property PACKAGE_PIN B2 [get_ports {VGA_G[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[0]}]

# set_property PACKAGE_PIN  [get_ports {VGA_B[5]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[5]}]
# set_property PACKAGE_PIN  [get_ports {VGA_B[4]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[4]}]
# 21=20, 23=22, 25=24, 15=14
set_property PACKAGE_PIN B1 [get_ports {VGA_B[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[3]}]
set_property PACKAGE_PIN D1 [get_ports {VGA_B[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[2]}]
set_property PACKAGE_PIN E2 [get_ports {VGA_B[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[1]}]
set_property PACKAGE_PIN C4 [get_ports {VGA_B[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[0]}]

#Audio
# 27=26, 28=25
set_property PACKAGE_PIN F4 [get_ports PWM_AUDIO_L]
set_property IOSTANDARD LVCMOS33 [get_ports PWM_AUDIO_L]
set_property PACKAGE_PIN G4 [get_ports PWM_AUDIO_R]
set_property IOSTANDARD LVCMOS33 [get_ports PWM_AUDIO_R]

#Joystick
# 35=34, 36=33, 37=36, 38=35, 40=37, 39=38, 33=32
set_property PACKAGE_PIN G9 [get_ports JOY1_B2_P9]
set_property IOSTANDARD LVCMOS33 [get_ports JOY1_B2_P9]
set_property PULLUP true [get_ports JOY1_B2_P9]
set_property PACKAGE_PIN H9 [get_ports JOY1_B1_P6]
set_property IOSTANDARD LVCMOS33 [get_ports JOY1_B1_P6]
set_property PULLUP true [get_ports JOY1_B1_P6]
set_property PACKAGE_PIN L2 [get_ports JOY1_UP]
set_property IOSTANDARD LVCMOS33 [get_ports JOY1_UP]
set_property PULLUP true [get_ports JOY1_UP]
set_property PACKAGE_PIN M2 [get_ports JOY1_DOWN]
set_property IOSTANDARD LVCMOS33 [get_ports JOY1_DOWN]
set_property PULLUP true [get_ports JOY1_DOWN]
set_property PACKAGE_PIN L5 [get_ports JOY1_LEFT]
set_property IOSTANDARD LVCMOS33 [get_ports JOY1_LEFT]
set_property PULLUP true [get_ports JOY1_LEFT]
set_property PACKAGE_PIN K5 [get_ports JOY1_RIGHT]
set_property IOSTANDARD LVCMOS33 [get_ports JOY1_RIGHT]
set_property PULLUP true [get_ports JOY1_RIGHT]
set_property PACKAGE_PIN H1 [get_ports JOYX_SEL_O]
set_property IOSTANDARD LVCMOS33 [get_ports JOYX_SEL_O]


#####################################################
# Correspondence J8 (DECA CAPE) to  U2 (QMTECH A100T)
# even (parell) = +3   e.g.  J8:8 = U2:11
# odd  (senar)  = +5   e.g.  J8:7 = U2:12 
#####################################################


#SD
set_property PACKAGE_PIN W25 [get_ports SD_SCLK_O]
set_property IOSTANDARD LVCMOS33 [get_ports SD_SCLK_O]
set_property PACKAGE_PIN Y25 [get_ports SD_CS_N_O]
set_property IOSTANDARD LVCMOS33 [get_ports SD_CS_N_O]
set_property PACKAGE_PIN W21 [get_ports SD_MISO_I]
set_property IOSTANDARD LVCMOS33 [get_ports SD_MISO_I]
set_property PULLUP true [get_ports SD_MISO_I]
set_property PACKAGE_PIN AB24 [get_ports SD_MOSI_O]
set_property IOSTANDARD LVCMOS33 [get_ports SD_MOSI_O]


###### PMOD 3

#SPI
# 31=30, J8:5=U2:10, 29=28, 30=27, J8:6=U2:9, 42=39
set_property PACKAGE_PIN H4 [get_ports SPI_SCLK]
set_property IOSTANDARD LVCMOS33 [get_ports SPI_SCLK]
set_property PACKAGE_PIN E25 [get_ports SPI_CS0]
set_property IOSTANDARD LVCMOS33 [get_ports SPI_CS0]
set_property PACKAGE_PIN G1 [get_ports SPI_MISO]
set_property IOSTANDARD LVCMOS33 [get_ports SPI_MISO]
#set_property PULLUP true [get_ports SPI_MISO]
set_property PACKAGE_PIN G2 [get_ports SPI_MOSI]
set_property IOSTANDARD LVCMOS33 [get_ports SPI_MOSI]
set_property PACKAGE_PIN D25 [get_ports SPI_CS1]
set_property IOSTANDARD LVCMOS33 [get_ports SPI_CS1]
set_property PACKAGE_PIN M4 [get_ports SPI_CS2]
set_property IOSTANDARD LVCMOS33 [get_ports SPI_CS2]

#UART
# J8:3=U2:8, J8:4=U2:7
set_property PACKAGE_PIN E26 [get_ports UART_TXD]
set_property IOSTANDARD LVCMOS33 [get_ports UART_TXD]
set_property PACKAGE_PIN D26 [get_ports UART_RXD]
set_property IOSTANDARD LVCMOS33 [get_ports UART_RXD]

# END PMOD 3

#
# SDRAM signals
#
set_property PACKAGE_PIN M26 [get_ports DRAM_CLK]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_CLK]
set_property PACKAGE_PIN AA25  [get_ports DRAM_CKE]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_CKE]
set_property PACKAGE_PIN AC24 [get_ports DRAM_UDQM]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_UDQM]
set_property PACKAGE_PIN Y21 [get_ports DRAM_LDQM]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_LDQM]
set_property PACKAGE_PIN R25 [get_ports DRAM_CAS_N]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_CAS_N]
set_property PACKAGE_PIN P25 [get_ports DRAM_RAS_N]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_RAS_N]
set_property PACKAGE_PIN N21 [get_ports DRAM_WE_N]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_WE_N]
set_property PACKAGE_PIN T24 [get_ports DRAM_CS_N]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_CS_N]
set_property PACKAGE_PIN U21 [get_ports DRAM_BA[1]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_BA[1]]
set_property PACKAGE_PIN T25 [get_ports DRAM_BA[0]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_BA[0]]
set_property PACKAGE_PIN N26 [get_ports DRAM_ADDR[12]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_ADDR[12]]
set_property PACKAGE_PIN L23 [get_ports DRAM_ADDR[11]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_ADDR[11]]
set_property PACKAGE_PIN V21 [get_ports DRAM_ADDR[10]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_ADDR[10]]
set_property PACKAGE_PIN L22 [get_ports DRAM_ADDR[9]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_ADDR[9]]
set_property PACKAGE_PIN P26 [get_ports DRAM_ADDR[8]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_ADDR[8]]
set_property PACKAGE_PIN R26 [get_ports DRAM_ADDR[7]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_ADDR[7]]
set_property PACKAGE_PIN M25 [get_ports DRAM_ADDR[6]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_ADDR[6]]
set_property PACKAGE_PIN M24 [get_ports DRAM_ADDR[5]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_ADDR[5]]
set_property PACKAGE_PIN N22 [get_ports DRAM_ADDR[4]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_ADDR[4]]
set_property PACKAGE_PIN Y23 [get_ports DRAM_ADDR[3]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_ADDR[3]]
set_property PACKAGE_PIN Y22 [get_ports DRAM_ADDR[2]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_ADDR[2]]
set_property PACKAGE_PIN W23 [get_ports DRAM_ADDR[1]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_ADDR[1]]
set_property PACKAGE_PIN V23 [get_ports DRAM_ADDR[0]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_ADDR[0]]
set_property PACKAGE_PIN H26 [get_ports DRAM_DQ[0]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_DQ[0]]
set_property PACKAGE_PIN G26 [get_ports DRAM_DQ[1]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_DQ[1]]
set_property PACKAGE_PIN F23 [get_ports DRAM_DQ[2]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_DQ[2]]
set_property PACKAGE_PIN E23 [get_ports DRAM_DQ[3]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_DQ[3]]
set_property PACKAGE_PIN G22 [get_ports DRAM_DQ[4]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_DQ[4]]
set_property PACKAGE_PIN F22 [get_ports DRAM_DQ[5]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_DQ[5]]
set_property PACKAGE_PIN J25 [get_ports DRAM_DQ[6]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_DQ[6]]
set_property PACKAGE_PIN J26 [get_ports DRAM_DQ[7]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_DQ[7]]
set_property PACKAGE_PIN K23 [get_ports DRAM_DQ[8]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_DQ[8]]
set_property PACKAGE_PIN K22 [get_ports DRAM_DQ[9]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_DQ[9]]
set_property PACKAGE_PIN K26 [get_ports DRAM_DQ[10]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_DQ[10]]
set_property PACKAGE_PIN K25 [get_ports DRAM_DQ[11]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_DQ[11]]
set_property PACKAGE_PIN J21 [get_ports DRAM_DQ[12]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_DQ[12]]
set_property PACKAGE_PIN K21 [get_ports DRAM_DQ[13]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_DQ[13]]
set_property PACKAGE_PIN G20 [get_ports DRAM_DQ[14]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_DQ[14]]
set_property PACKAGE_PIN G21 [get_ports DRAM_DQ[15]]
set_property IOSTANDARD LVCMOS33 [get_ports DRAM_DQ[15]]


#SRAM
# set_property PACKAGE_PIN U18 [get_ports {SRAM_ADDR[0]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[0]}]
# set_property PACKAGE_PIN AB18 [get_ports {SRAM_ADDR[1]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[1]}]
# set_property PACKAGE_PIN P15 [get_ports {SRAM_ADDR[2]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[2]}]
# set_property PACKAGE_PIN T18 [get_ports {SRAM_ADDR[3]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[3]}]
# set_property PACKAGE_PIN R17 [get_ports {SRAM_ADDR[4]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[4]}]
# set_property PACKAGE_PIN P14 [get_ports {SRAM_ADDR[5]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[5]}]
# set_property PACKAGE_PIN AB3 [get_ports {SRAM_ADDR[6]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[6]}]
# set_property PACKAGE_PIN Y3 [get_ports {SRAM_ADDR[7]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[7]}]
# set_property PACKAGE_PIN R14 [get_ports {SRAM_ADDR[8]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[8]}]
# set_property PACKAGE_PIN T3 [get_ports {SRAM_ADDR[9]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[9]}]
# set_property PACKAGE_PIN P16 [get_ports {SRAM_ADDR[10]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[10]}]
# set_property PACKAGE_PIN AA3 [get_ports {SRAM_ADDR[11]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[11]}]
# set_property PACKAGE_PIN P17 [get_ports {SRAM_ADDR[12]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[12]}]
# set_property PACKAGE_PIN AB2 [get_ports {SRAM_ADDR[13]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[13]}]
# set_property PACKAGE_PIN AA18 [get_ports {SRAM_ADDR[14]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[14]}]
# set_property PACKAGE_PIN Y2 [get_ports {SRAM_ADDR[15]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[15]}]
# set_property PACKAGE_PIN Y1 [get_ports {SRAM_ADDR[16]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[16]}]
# set_property PACKAGE_PIN W1 [get_ports {SRAM_ADDR[17]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[17]}]
# set_property PACKAGE_PIN V3 [get_ports {SRAM_ADDR[18]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_ADDR[18]}]

# set_property PACKAGE_PIN N17 [get_ports {SRAM_DQ[0]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_DQ[0]}]
# set_property PACKAGE_PIN AA5 [get_ports {SRAM_DQ[1]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_DQ[1]}]
# set_property PACKAGE_PIN N14 [get_ports {SRAM_DQ[2]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_DQ[2]}]
# set_property PACKAGE_PIN N13 [get_ports {SRAM_DQ[3]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_DQ[3]}]
# set_property PACKAGE_PIN R16 [get_ports {SRAM_DQ[4]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_DQ[4]}]
# set_property PACKAGE_PIN AA1 [get_ports {SRAM_DQ[5]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_DQ[5]}]
# set_property PACKAGE_PIN AB1 [get_ports {SRAM_DQ[6]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_DQ[6]}]
# set_property PACKAGE_PIN U3 [get_ports {SRAM_DQ[7]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {SRAM_DQ[7]}]

# set_property PACKAGE_PIN N15 [get_ports SRAM_WE_N]
# set_property IOSTANDARD LVCMOS33 [get_ports SRAM_WE_N]


# #Flash SPI
# set_property PACKAGE_PIN T4 [get_ports flash_clk]
# set_property IOSTANDARD LVCMOS33 [get_ports flash_clk]
# set_property PACKAGE_PIN T19 [get_ports flash_cs_n]
# set_property IOSTANDARD LVCMOS33 [get_ports flash_cs_n]
# set_property PACKAGE_PIN R22 [get_ports flash_miso]
# # DQ1
# set_property IOSTANDARD LVCMOS33 [get_ports flash_miso]  
# set_property PULLUP true [get_ports flash_miso]
# # DQ0
# set_property PACKAGE_PIN P22 [get_ports flash_mosi]
# set_property IOSTANDARD LVCMOS33 [get_ports flash_mosi]  
# #set_property PACKAGE_PIN P21 [get_ports flash_dq2]
# #set_property IOSTANDARD LVCMOS33 [get_ports flash_sclk]
# #set_property PACKAGE_PIN R21 [get_ports flash_dq3]
# #set_property IOSTANDARD LVCMOS33 [get_ports flash_sclk]
