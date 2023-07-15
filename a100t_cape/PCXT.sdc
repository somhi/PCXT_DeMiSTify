# DeMiSTify constrainsts

create_clock -name {clk_50} -period 20.000 -waveform {0.000 10.000} { CLK_50 }
create_generated_clock -name spiclk -source [get_ports {CLK_50}] -divide_by 16 [get_registers {substitute_mcu:controller|spi_controller:spi|sck}]

set hostclk { clk_50 }
set supportclk { clk_50 }

derive_pll_clocks -create_base_clocks
derive_clock_uncertainty

# Create a clock for i2s, audio-spi, i2c-hdmi
#create_clock -name i2sclk -period 640.000 {audio_top:audio_i2s|tcount[4]}
create_clock -name audio-spi-clk-1m -period 2480.000  {AUDIO_SPI_CTL_RD:AUDIO_SPI_CTL_RD_inst|CLK_1M}
create_clock -name audio-spi-rom-ck -period 2480.000  {AUDIO_SPI_CTL_RD:AUDIO_SPI_CTL_RD_inst|ROM_CK}
#create_clock -name i2c-ctrl-clk -period 100000.000  {I2C_HDMI_Config:I2C_HDMI_Config_inst|mI2C_CTRL_CLK}


# Set pin definitions for downstream constraints
set RAM_CLK DRAM_CLK
set RAM_OUT {DRAM_DQ* DRAM_ADDR* DRAM_BA* DRAM_RAS_N DRAM_CAS_N DRAM_WE_N DRAM_*DQM DRAM_CS_N DRAM_CKE}
set RAM_IN {DRAM_D*}

set VGA_OUT {VGA_R[*] VGA_G[*] VGA_B[*] VGA_HS VGA_VS}

# non timing-critical pins would be in the "FALSE_IN/OUT" collection (IN inputs, OUT outputs)
set FALSE_OUT {LED[*] SIGMA_* PS2_* JOYX_SEL_O AUDIO* I2S_* HDMI_I2C* HDMI_LRCLK HDMI_MCLK HDMI_SCLK HDMI_I2S[*] UART_TXD SD_CS_N_O SD_MOSI_O SD_SCLK_O HDMI_TX*}
set FALSE_IN  {KEY[*] SW[*] PS2_* JOY1* AUDIO* HDMI_I2C* HDMI_LRCLK HDMI_MCLK HDMI_SCLK HDMI_I2S[*] EAR UART_RXD SD_MISO_I HDMI_TX_INT}
#the HDMI signals are probably fast enough to worth constraining properly at some point

# JTAG constraints for debug interface (if enabled)
#create_clock -name {altera_reserved_tck} -period 40 {altera_reserved_tck}
set_input_delay -clock altera_reserved_tck -clock_fall 3 altera_reserved_tdi
set_input_delay -clock altera_reserved_tck -clock_fall 3 altera_reserved_tms
set_output_delay -clock altera_reserved_tck 3 altera_reserved_tdo

# Clock groups
set_clock_groups -asynchronous -group [get_clocks spiclk] -group [get_clocks $CLOCK_CHIP]
set_clock_groups -asynchronous -group [get_clocks $hostclk] -group [get_clocks $CLOCK_CHIP]
set_clock_groups -asynchronous -group [get_clocks $supportclk] -group [get_clocks $CLOCK_CHIP]

set_clock_groups -asynchronous -group [get_clocks spiclk] -group [get_clocks sdramclk]
set_clock_groups -asynchronous -group [get_clocks $hostclk] -group [get_clocks sdramclk]
set_clock_groups -asynchronous -group [get_clocks $supportclk] -group [get_clocks sdramclk]

set_clock_groups -asynchronous -group [get_clocks spiclk] -group [get_clocks guest|pllvideo|*]
set_clock_groups -asynchronous -group [get_clocks guest|pll|*] -group [get_clocks guest|pllvideo|*]

# False paths
set_false_path -to ${FALSE_OUT}
set_false_path -from ${FALSE_IN}



################################



#  CORE SPECIFIC CONSTRAINTS

# Clocks
set CLOCK_14_318 guest|clk_14_318|q
set CLOCK_4_77   guest|clk_normal|clk_out|q
set PCLK         guest|peripheral_clock|q

set CLOCK_CORE    guest|pll|altpll_component|auto_generated|pll1|clk[0]
set CLOCK_CHIP    guest|pll|altpll_component|auto_generated|pll1|clk[1]
set CLOCK_UART    guest|pll|altpll_component|auto_generated|pll1|clk[3]
set CLOCK_OPL     guest|pll|altpll_component|auto_generated|pll1|clk[4]
set CLOCK_VGA_CGA guest|pllvideo|altpll_component|auto_generated|pll1|clk[0]
set CLOCK_VGA_MDA guest|pllvideo|altpll_component|auto_generated|pll1|clk[1]    
create_generated_clock -name sdramclk -source guest|pll|altpll_component|auto_generated|pll1|clk[2] [get_ports $RAM_CLK]

# if {[info exists mist] && ($mist==1)} { } else { }

# Uncommenting following line gives more timing setup delays
#create_generated_clock -name clk_14_318 -source $CLOCK_VGA_CGA -divide_by 2 [get_pins $CLOCK_14_318]
create_generated_clock -name clk_4_77 -source [get_pins $CLOCK_14_318] -divide_by 3 -duty_cycle 33 [get_pins $CLOCK_4_77]
create_generated_clock -name peripheral_clock -source [get_pins $CLOCK_4_77] -divide_by 2 [get_pins $PCLK]

# SPLASH
set_false_path -to [get_registers {PCXT:guest|splash_off}]

# i2sclk moved from constrainst.sdc
create_generated_clock -name i2sclk -source $CLOCK_CHIP -divide_by 32 [get_registers {audio_top:audio_i2s|tcount[4]}]

# UART
set_false_path -from [get_clocks $CLOCK_CHIP] -to [get_clocks $CLOCK_UART]
set_false_path -from [get_clocks $CLOCK_UART] -to [get_clocks $CLOCK_CHIP]

# VIDEO
# NOTE: If the system clock and video clock are synchronous, the following description is not necessary.
set VIDEO_TO_SYSYEM_DELAY 10

set_false_path -to [get_registers  [list guest|mda_mode_video_ff \
                                         guest|screen_mode_video_ff[*]]]

set_max_delay -from [get_registers guest|u_CHIPSET|u_PERIPHERALS|video_io_address[*]] \
              -to   [get_registers [list guest|u_CHIPSET|u_PERIPHERALS|mda_io_address_1[*]   \
                                    guest|u_CHIPSET|u_PERIPHERALS|cga_io_address_1[*]]] $VIDEO_TO_SYSYEM_DELAY

set_max_delay -from [get_registers guest|u_CHIPSET|u_PERIPHERALS|video_io_data[*]] \
              -to   [get_registers [list guest|u_CHIPSET|u_PERIPHERALS|mda_io_data_1[*]   \
                                    guest|u_CHIPSET|u_PERIPHERALS|cga_io_data_1[*]]] $VIDEO_TO_SYSYEM_DELAY

set_max_delay -from [get_registers guest|u_CHIPSET|u_PERIPHERALS|video_io_write_n] \
              -to   [get_registers [list guest|u_CHIPSET|u_PERIPHERALS|mda_io_write_n_1   \
                                    guest|u_CHIPSET|u_PERIPHERALS|cga_io_write_n_1]] $VIDEO_TO_SYSYEM_DELAY

set_max_delay -from [get_registers guest|u_CHIPSET|u_PERIPHERALS|video_io_read_n] \
              -to   [get_registers [list guest|u_CHIPSET|u_PERIPHERALS|mda_io_read_n_1   \
                                    guest|u_CHIPSET|u_PERIPHERALS|cga_io_read_n_1]] $VIDEO_TO_SYSYEM_DELAY

set_max_delay -from [get_registers guest|u_CHIPSET|u_PERIPHERALS|video_address_enable_n] \
              -to   [get_registers [list guest|u_CHIPSET|u_PERIPHERALS|mda_address_enable_n_1   \
                                    guest|u_CHIPSET|u_PERIPHERALS|cga_address_enable_n_1]] $VIDEO_TO_SYSYEM_DELAY

set_max_delay -to   [get_registers [list guest|u_CHIPSET|u_PERIPHERALS|MDA_CRTC_DOUT_1[*] \
                                    guest|u_CHIPSET|u_PERIPHERALS|MDA_CRTC_OE_1      \
                                    guest|u_CHIPSET|u_PERIPHERALS|CGA_CRTC_DOUT_1[*] \
                                    guest|u_CHIPSET|u_PERIPHERALS|CGA_CRTC_OE_1]] $VIDEO_TO_SYSYEM_DELAY

# SDRAM
set_input_delay -clock  { sdramclk } -max 6 [get_ports $RAM_IN]
set_input_delay -clock  { sdramclk } -min 3 [get_ports $RAM_IN]
set_output_delay -clock { sdramclk } -max 2   [get_ports $RAM_OUT]
set_output_delay -clock { sdramclk } -min 1.5 [get_ports $RAM_OUT]

# sdramclk -> clk_chipset
set_multicycle_path -from { sdramclk } -to [get_clocks guest|pll|altpll_component|auto_generated|pll1|clk[1]] -setup -end 2

