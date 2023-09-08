# DeMiSTify constrainsts

create_clock -name {clk_50} -period 20.000 -waveform {0.000 10.000} { CLK_50 }
create_generated_clock -name spiclk -source [get_ports {CLK_50}] -divide_by 16 [get_nets {controller/spi/sck_reg_0}]

set hostclk { clk_50 }
set supportclk { clk_50 }

#derive_pll_clocks -create_base_clocks
#derive_clock_uncertainty

#create_clock -name i2sclk -period 640.000 {audio_top:audio_i2s/tcount[4]}

# Set pin definitions for downstream constraints
set RAM_CLK DRAM_CLK
set RAM_OUT {DRAM_DQ* DRAM_ADDR* DRAM_BA* DRAM_RAS_N DRAM_CAS_N DRAM_WE_N DRAM_*DQM DRAM_CS_N DRAM_CKE}
set RAM_IN {DRAM_D*}

set VGA_OUT {VGA_R[*] VGA_G[*] VGA_B[*] VGA_HS VGA_VS}

# non timing-critical pins would be in the "FALSE_IN/OUT" collection (IN inputs, OUT outputs)
set FALSE_OUT {LED* PWM_AUDIO_* PS2_* joy_sel joy_load_n joy_clk I2S_* UART_TXD SD_CS_N_O SD_MOSI_O SD_SCLK_O}
set FALSE_IN  {SW* PS2_* joy_data UART_RXD SD_MISO_I}

# Clock groups
set_clock_groups -asynchronous -group [get_clocks spiclk] -group [get_clocks ${CLOCK_CHIP}]
set_clock_groups -asynchronous -group [get_clocks ${hostclk}] -group [get_clocks ${CLOCK_CHIP}]
set_clock_groups -asynchronous -group [get_clocks ${supportclk}] -group [get_clocks ${CLOCK_CHIP}]

#[Vivado 12-5201] set_clock_groups: cannot set the clock group when only one non-empty group remains. [PCXT.sdc:31, 32, 33 ]
#set_clock_groups -asynchronous -group [get_clocks spiclk] -group [get_clocks sdramclk]
#set_clock_groups -asynchronous -group [get_clocks ${hostclk}] -group [get_clocks sdramclk]
#set_clock_groups -asynchronous -group [get_clocks ${supportclk}] -group [get_clocks sdramclk]

set_clock_groups -asynchronous -group [get_clocks spiclk] -group [get_clocks {"clk_out1_clk_wiz_1" "clk_out2_clk_wiz_1"}]
set_clock_groups -asynchronous -group [get_clocks { "clk_out1_pll" "clk_out2_pll" "clk_out4_pll"}] -group [get_clocks {"clk_out1_clk_wiz_1" "clk_out2_clk_wiz_1"}]]

# False paths
set_false_path -to ${FALSE_OUT}
set_false_path -from ${FALSE_IN}

################################


#  CORE SPECIFIC CONSTRAINTS

# Clocks
set CLOCK_14_318 "guest/clk_14_318"
set CLOCK_4_77   "guest/clk_normal/clk_4_77"
set PCLK         "guest/peripheral_clock"

set CLOCK_CORE    "clk_out1_pll"
set CLOCK_CHIP    "clk_out2_pll"
set CLOCK_UART    "clk_out4_pll"
set CLOCK_VGA_CGA "clk_out1_clk_wiz_1"
set CLOCK_VGA_MDA "clk_out2_clk_wiz_1"

create_generated_clock -name sdramclk -source "guest/pll/clk_out3_pll" [get_ports ${RAM_CLK}]

# Uncommenting following line gives more timing setup delays
#create_generated_clock -name clk_14_318 -source ${CLOCK_VGA_CGA} -divide_by 2 [get_nets ${CLOCK_14_318}]
create_generated_clock -name clk_4_77 -source [get_clocks ${CLOCK_14_318}] -divide_by 3 -duty_cycle 33 [get_nets ${CLOCK_4_77}]
create_generated_clock -name peripheral_clock -source [get_clocks ${CLOCK_4_77}] -divide_by 2 [get_nets ${PCLK}]

# SPLASH
set_false_path -to [get_nets {"guest/splash_off"}]

# i2sclk moved from constrainst.sdc
create_generated_clock -name i2sclk -source ${CLOCK_CHIP} -divide_by 32 [get_nets {"audio_i2s/I2S_BCLK_OBUF"}]

# UART
set_false_path -from [get_clocks ${CLOCK_CHIP}] -to [get_clocks ${CLOCK_UART}]
set_false_path -from [get_clocks ${CLOCK_UART}] -to [get_clocks ${CLOCK_CHIP}]

# VIDEO
# NOTE: If the system clock and video clock are synchronous, the following description is not necessary.
set VIDEO_TO_SYSYEM_DELAY 10

set_false_path -to [get_pins  [list guest/mda_mode_video_ff \
                                         guest/screen_mode_video_ff[*]]]

set_max_delay -from [get_pins guest/u_CHIPSET/u_PERIPHERALS/video_io_address[*]] \
              -to   [get_pins [list guest/u_CHIPSET/u_PERIPHERALS/mda_io_address_1[*]   \
                                    guest/u_CHIPSET/u_PERIPHERALS/cga_io_address_1[*]]] $VIDEO_TO_SYSYEM_DELAY

set_max_delay -from [get_pins guest/u_CHIPSET/u_PERIPHERALS/video_io_data[*]] \
              -to   [get_nets [list guest/u_CHIPSET/u_PERIPHERALS/mda_io_data_1[*]   \
                                    guest/u_CHIPSET/u_PERIPHERALS/cga_io_data_1[*]]] $VIDEO_TO_SYSYEM_DELAY

set_max_delay -from [get_nets guest/u_CHIPSET/u_PERIPHERALS/video_io_write_n] \
              -to   [get_nets [list guest/u_CHIPSET/u_PERIPHERALS/mda_io_write_n_1   \
                                    guest/u_CHIPSET/u_PERIPHERALS/cga_io_write_n_1]] $VIDEO_TO_SYSYEM_DELAY

set_max_delay -from [get_nets guest/u_CHIPSET/u_PERIPHERALS/video_io_read_n] \
              -to   [get_nets [list guest/u_CHIPSET/u_PERIPHERALS/mda_io_read_n_1   \
                                    guest/u_CHIPSET/u_PERIPHERALS/cga_io_read_n_1]] $VIDEO_TO_SYSYEM_DELAY

set_max_delay -from [get_pins guest/u_CHIPSET/u_PERIPHERALS/video_address_enable_n] \
              -to   [get_nets [list guest/u_CHIPSET/u_PERIPHERALS/mda_address_enable_n_1   \
                                    guest/u_CHIPSET/u_PERIPHERALS/cga_address_enable_n_1]] $VIDEO_TO_SYSYEM_DELAY

set_max_delay -to   [get_pins [list guest/u_CHIPSET/u_PERIPHERALS/MDA_CRTC_DOUT_1[*] \
                                    guest/u_CHIPSET/u_PERIPHERALS/MDA_CRTC_OE_1      \
                                    guest/u_CHIPSET/u_PERIPHERALS/CGA_CRTC_DOUT_1[*] \
                                    guest/u_CHIPSET/u_PERIPHERALS/CGA_CRTC_OE_1]] $VIDEO_TO_SYSYEM_DELAY

# SDRAM
set_input_delay -clock  { sdramclk } -max 6 [get_ports ${RAM_IN}]
set_input_delay -clock  { sdramclk } -min 3 [get_ports ${RAM_IN}]
set_output_delay -clock { sdramclk } -max 2   [get_ports ${RAM_OUT}]
set_output_delay -clock { sdramclk } -min 1.5 [get_ports ${RAM_OUT}]


# sdramclk -> clk_chipset
set_multicycle_path -from { sdramclk } -to [get_clocks ${CLOCK_CHIP}] -setup -end 2

