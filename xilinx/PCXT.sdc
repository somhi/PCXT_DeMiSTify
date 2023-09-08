# Core Clocks
set CLOCK_14_318 guest/clk_14_318
set CLOCK_4_77   guest/clk_normal/clk_4_77

set CLOCK_CORE    "*clk_out1_pll*"
set CLOCK_CHIP    "*clk_out2_pll*"
set sdramclk      "*clk_out3_pll*"
set CLOCK_UART    "*clk_out4_pll*"
set CLOCK_VGA_CGA guest/pllvideo/clk_out1_clk_wiz_1
set CLOCK_VGA_MDA guest/pllvideo/clk_out2_clk_wiz_1

#create_generated_clock -name sdramclk -source [get_clocks {"clk_out3_pll"}] [get_ports ${RAM_CLK}]

#create_generated_clock -name clk_4_77 -source [get_pins $CLOCK_14_318] -divide_by 3 -duty_cycle 33 [get_nets $CLOCK_4_77]
create_generated_clock -name clk_4_77 -source [get_pins $CLOCK_14_318] -divide_by 3 -duty_cycle 33 [get_pins -hierarchical *clk_4_77*]

create_generated_clock -name peripheral_clock -source [get_pins -hierarchical "*clk_4_77*"] -divide_by 2 [get_pins guest/peripheral_clock_reg/Q]

#create_generated_clock -name i2sclk -source [get_pins $CLOCK_CHIP] -divide_by 32 [get_pins audio_i2s/I2S_BCLK_OBUF]
create_generated_clock -name i2sclk -source [get_pins guest/pll/plle2_adv_inst/CLKOUT1] -divide_by 32 [get_pins audio_i2s/I2S_BCLK_OBUF]


####### DeMiSTify constrainsts

create_clock -name clk_50 -period 20.000 -waveform {0.000 10.000} { CLK_50 }
create_generated_clock -name spiclk -source [get_ports {CLK_50}] -divide_by 16 [get_pins controller/spi/sck_reg/Q]

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
set_clock_groups -asynchronous -group [get_clocks {spiclk}] -group [get_clocks $CLOCK_CHIP]
set_clock_groups -asynchronous -group [get_clocks ${hostclk}] -group [get_clocks $CLOCK_CHIP]
set_clock_groups -asynchronous -group [get_clocks ${supportclk}] -group [get_clocks $CLOCK_CHIP]

#[Vivado 12-5201] set_clock_groups: cannot set the clock group when only one non-empty group remains. [PCXT.sdc:31, 32, 33 ]
#set_clock_groups -asynchronous -group [get_clocks spiclk] -group [get_clocks sdramclk]
#set_clock_groups -asynchronous -group [get_clocks ${hostclk}] -group [get_clocks sdramclk]
#set_clock_groups -asynchronous -group [get_clocks ${supportclk}] -group [get_clocks sdramclk]

set_clock_groups -asynchronous -group [get_clocks spiclk] -group [get_clocks {"clk_out1_clk_wiz_1" "clk_out2_clk_wiz_1"}]
set_clock_groups -asynchronous -group [get_clocks {"clk_out1_pll" "clk_out2_pll" "clk_out4_pll"}] -group [get_clocks {"clk_out1_clk_wiz_1" "clk_out2_clk_wiz_1"}]

# False paths
set_false_path -to ${FALSE_OUT}
set_false_path -from ${FALSE_IN}

################################


#  CORE SPECIFIC CONSTRAINTS

# SPLASH
set_false_path -to [get_cells -hierarchical "*splash_off*" ]

# UART
set_false_path -from [get_clocks $CLOCK_CHIP] -to [get_clocks $CLOCK_UART]
set_false_path -from [get_clocks $CLOCK_UART] -to [get_clocks $CLOCK_CHIP]

# VIDEO
# NOTE: If the system clock and video clock are synchronous, the following description is not necessary.
set VIDEO_TO_SYSYEM_DELAY 10

set_false_path -to [get_cells  [list guest/mda_mode_video_ff_reg \
                                         guest/screen_mode_video_ff_reg[*]]]

set_max_delay -from [get_cells guest/u_CHIPSET/u_PERIPHERALS/video_io_address_reg[*]] \
              -to   [get_cells [list guest/u_CHIPSET/u_PERIPHERALS/mda_io_address_1_reg[*]   \
                                    guest/u_CHIPSET/u_PERIPHERALS/cga_io_address_1_reg[*]]] $VIDEO_TO_SYSYEM_DELAY

set_max_delay -from [get_cells guest/u_CHIPSET/u_PERIPHERALS/video_io_data_reg[*]] \
              -to   [get_cells [list guest/u_CHIPSET/u_PERIPHERALS/mda_io_data_1_reg[*]   \
                                    guest/u_CHIPSET/u_PERIPHERALS/cga_io_data_1_reg[*]]] $VIDEO_TO_SYSYEM_DELAY

# set_max_delay -from [get_cells guest/u_CHIPSET/u_PERIPHERALS/video_io_write_n] \
#               -to   [get_cells [list guest/u_CHIPSET/u_PERIPHERALS/mda_io_write_n_1   \
#                                     guest/u_CHIPSET/u_PERIPHERALS/cga_io_write_n_1]] $VIDEO_TO_SYSYEM_DELAY

# set_max_delay -from [get_cells guest/u_CHIPSET/u_PERIPHERALS/video_io_read_n] \
#               -to   [get_cells [list guest/u_CHIPSET/u_PERIPHERALS/mda_io_read_n_1   \
#                                     guest/u_CHIPSET/u_PERIPHERALS/cga_io_read_n_1]] $VIDEO_TO_SYSYEM_DELAY

set_max_delay -from [get_cells guest/u_CHIPSET/u_PERIPHERALS/video_address_enable_n_reg] \
              -to   [get_cells [list guest/u_CHIPSET/u_PERIPHERALS/mda_address_enable_n_1_reg   \
                                    guest/u_CHIPSET/u_PERIPHERALS/cga_address_enable_n_1_reg]] $VIDEO_TO_SYSYEM_DELAY

set_max_delay -to   [get_cells [list guest/u_CHIPSET/u_PERIPHERALS/MDA_CRTC_DOUT_1[*]* \
                                    guest/u_CHIPSET/u_PERIPHERALS/MDA_CRTC_OE_1*      \
                                    guest/u_CHIPSET/u_PERIPHERALS/CGA_CRTC_DOUT_1[*]* \
                                    guest/u_CHIPSET/u_PERIPHERALS/CGA_CRTC_OE_1*]] $VIDEO_TO_SYSYEM_DELAY

# SDRAM
set_input_delay -clock  $sdramclk -reference_pin [get_ports ${RAM_CLK}] -max 6 [get_ports ${RAM_IN}]
set_input_delay -clock  $sdramclk -reference_pin [get_ports ${RAM_CLK}] -min 3 [get_ports ${RAM_IN}]
set_output_delay -clock $sdramclk -reference_pin [get_ports ${RAM_CLK}] -max 2   [get_ports ${RAM_OUT}]
set_output_delay -clock $sdramclk -reference_pin [get_ports ${RAM_CLK}] -min 1.5 [get_ports ${RAM_OUT}]


# sdramclk -> clk_chipset
set_multicycle_path -from $sdramclk -to [get_clocks $CLOCK_CHIP] -setup -end 2

