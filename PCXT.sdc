# core specific constraints
# Clocks
set CLOCK_14_318 ${topmodule}clk_14_318|q
set CLOCK_4_77   ${topmodule}clk_normal|clk_out|q
set PCLK         ${topmodule}peripheral_clock|q

if {[info exists cyclonev] && ($cyclonev==1)} {
	set CLOCK_CORE    ${topmodule}pll|pll_inst|altera_pll_i|cyclonev_pll|counter[0].output_counter|divclk
    set CLOCK_VGA_MDA ${topmodule}pllvideo|pll_inst|altera_pll_i|cyclonev_pll|counter[1].output_counter|divclk
    set CLOCK_VGA_CGA ${topmodule}pllvideo|pll_inst|altera_pll_i|cyclonev_pll|counter[0].output_counter|divclk
    set CLOCK_UART    ${topmodule}pll|pll_inst|altera_pll_i|cyclonev_pll|counter[2].output_counter|divclk
    set CLOCK_OPL     ${topmodule}pllvideo|pll_inst|altera_pll_i|cyclonev_pll|counter[2].output_counter|divclk
    set CLOCK_CHIP    ${topmodule}pll|pll_inst|altera_pll_i|cyclonev_pll|counter[1].output_counter|divclk

    create_generated_clock -name sdramclk -source [get_pins $CLOCK_CHIP] [get_ports $RAM_CLK]

    # status signal
    set_false_path -from [get_registers {PCXT:guest|hps_io:hps_io|status[3] PCXT:guest|hps_io:hps_io|status[4] PCXT:guest|hps_io:hps_io|status[7]}]

} else {
	set CLOCK_CORE    ${topmodule}pll|altpll_component|auto_generated|pll1|clk[0]
	set CLOCK_CHIP    ${topmodule}pll|altpll_component|auto_generated|pll1|clk[1]
	set CLOCK_UART    ${topmodule}pll|altpll_component|auto_generated|pll1|clk[3]
    set CLOCK_OPL     ${topmodule}pll|altpll_component|auto_generated|pll1|clk[4]
    set CLOCK_VGA_CGA ${topmodule}pllvideo|altpll_component|auto_generated|pll1|clk[0]
    set CLOCK_VGA_MDA ${topmodule}pllvideo|altpll_component|auto_generated|pll1|clk[1]    

    create_generated_clock -name sdramclk -source ${topmodule}pll|altpll_component|auto_generated|pll1|clk[2] [get_ports $RAM_CLK]

    # status signal
    set_false_path -from [get_registers {PCXT:guest|user_io:user_io|status[3] PCXT:guest|user_io:user_io|status[4] PCXT:guest|user_io:user_io|status[7]}]
}

create_generated_clock -name clk_14_318 -source $CLOCK_VGA_CGA -divide_by 2 [get_pins $CLOCK_14_318]
create_generated_clock -name clk_4_77 -source [get_pins $CLOCK_14_318] -divide_by 3 -duty_cycle 33 [get_pins $CLOCK_4_77]
create_generated_clock -name peripheral_clock -source [get_pins $CLOCK_4_77] -divide_by 2 [get_pins $PCLK]

# SPLASH
set_false_path -to [get_registers {PCXT:guest|splash_off}]

# AUDIO
set_false_path -to [get_registers {PCXT:guest|clk_cpu_ff_1 PCXT:guest|pclk_ff_1 PCXT:guest|clk_opl2_ff_1}]

# UART
set_false_path -from [get_clocks $CLOCK_CHIP] -to [get_clocks $CLOCK_UART]
set_false_path -from [get_clocks $CLOCK_UART] -to [get_clocks $CLOCK_CHIP]

# VIDEO
# NOTE: If the system clock and video clock are synchronous, the following description is not necessary.
set VIDEO_TO_SYSYEM_DELAY 10

set_false_path -to [get_registers  {PCXT:guest|mda_mode_video_ff \
                                    PCXT:guest|screen_mode_video_ff[*]}]


set_max_delay -from [get_registers {PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|video_io_address[*]}] \
              -to   [get_registers {PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|mda_io_address_1[*]   \
                                    PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|cga_io_address_1[*]}] $VIDEO_TO_SYSYEM_DELAY

set_max_delay -from [get_registers {PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|video_io_data[*]}] \
              -to   [get_registers {PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|mda_io_data_1[*]   \
                                    PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|cga_io_data_1[*]}] $VIDEO_TO_SYSYEM_DELAY

set_max_delay -from [get_registers {PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|video_io_write_n}] \
              -to   [get_registers {PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|mda_io_write_n_1   \
                                    PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|cga_io_write_n_1}] $VIDEO_TO_SYSYEM_DELAY

set_max_delay -from [get_registers {PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|video_io_read_n}] \
              -to   [get_registers {PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|mda_io_read_n_1   \
                                    PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|cga_io_read_n_1}] $VIDEO_TO_SYSYEM_DELAY

set_max_delay -from [get_registers {PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|video_address_enable_n}] \
              -to   [get_registers {PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|mda_address_enable_n_1   \
                                    PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|cga_address_enable_n_1}] $VIDEO_TO_SYSYEM_DELAY

set_max_delay -to   [get_registers {PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|MDA_CRTC_DOUT_1[*] \
                                    PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|MDA_CRTC_OE_1      \
                                    PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|CGA_CRTC_DOUT_1[*] \
                                    PCXT:guest|CHIPSET:u_CHIPSET|PERIPHERALS:u_PERIPHERALS|CGA_CRTC_OE_1}] $VIDEO_TO_SYSYEM_DELAY


# SDRAM
set_input_delay -clock  { sdramclk } -max 6 [get_ports $RAM_IN]
set_input_delay -clock  { sdramclk } -min 3 [get_ports $RAM_IN]
set_output_delay -clock { sdramclk } -max 2   [get_ports $RAM_OUT]
set_output_delay -clock { sdramclk } -min 1.5 [get_ports $RAM_OUT]


################################


# Clock groups
set_clock_groups -asynchronous -group [get_clocks spiclk] -group [get_clocks $CLOCK_CHIP]
set_clock_groups -asynchronous -group [get_clocks $hostclk] -group [get_clocks $CLOCK_CHIP]
set_clock_groups -asynchronous -group [get_clocks $supportclk] -group [get_clocks $CLOCK_CHIP]

set_clock_groups -asynchronous -group [get_clocks spiclk] -group [get_clocks sdramclk]
set_clock_groups -asynchronous -group [get_clocks $hostclk] -group [get_clocks sdramclk]
set_clock_groups -asynchronous -group [get_clocks $supportclk] -group [get_clocks sdramclk]

set_false_path -to ${FALSE_OUT}
set_false_path -from ${FALSE_IN}

# Some relaxed constrain to the VGA pins. The signals should arrive together, the delay is not really important.
# set_output_delay -clock [get_clocks $CLOCK_CHIP] -max 0 [get_ports $VGA_OUT]
# set_output_delay -clock [get_clocks $CLOCK_CHIP] -min -5 [get_ports $VGA_OUT]
# set_multicycle_path -to $VGA_OUT -setup 2
# set_multicycle_path -to $VGA_OUT -hold 1

