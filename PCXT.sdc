# core specific constraints
# Clocks
set CLOCK_14_318 ${topmodule}clk_14_318|q
set CLOCK_4_77   ${topmodule}clk_normal|clk_out|q
set PCLK         ${topmodule}peripheral_clock|q



if {[info exists cyclonev] && ($cyclonev==1)} {
	set CLOCK_CORE   ${topmodule}pll|pll_inst|altera_pll_i|cyclonev_pll|counter[0].output_counter|divclk
    set clk_28_636   ${topmodule}pll|pll_inst|altera_pll_i|cyclonev_pll|counter[2].output_counter|divclk

    create_generated_clock -name sdramclk -source { FPGA_CLK1_50 }  [get_ports $RAM_CLK]
#   create_generated_clock -name sdramclk -source ${topmodule}pll|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk [get_ports $RAM_CLK]

} else {
	set CLOCK_CORE   ${topmodule}pll|altpll_component|auto_generated|pll1|clk[0]
    set clk_28_636   ${topmodule}pllvideo|altpll_component|auto_generated|pll1|clk[0]

    create_generated_clock -name sdramclk -source ${topmodule}pll|altpll_component|auto_generated|pll1|clk[1] [get_ports $RAM_CLK]
}


create_generated_clock -name clk_14_318 -source $clk_28_636 -divide_by 2 [get_pins $CLOCK_14_318]
create_generated_clock -name clk_4_77 -source [get_pins $CLOCK_14_318] -divide_by 3 -duty_cycle 33 [get_pins $CLOCK_4_77]
create_generated_clock -name peripheral_clock -source [get_pins $CLOCK_4_77] -divide_by 2 [get_pins $PCLK]
#{MAX10_CLK1_50}  not generic for all demistify boards;  does not work [get_clocks clk_50], clk_50, {clk_50}
#create_generated_clock -name sdramclk -source {MAX10_CLK1_50}  [get_ports $RAM_CLK]

# SDRAM
set_input_delay -clock  { sdramclk } -max 6 [get_ports $RAM_IN]
set_input_delay -clock  { sdramclk } -min 3 [get_ports $RAM_IN]
set_output_delay -clock { sdramclk } -max 2   [get_ports $RAM_OUT]
set_output_delay -clock { sdramclk } -min 1.5 [get_ports $RAM_OUT]




# Clock groups
set_clock_groups -asynchronous -group [get_clocks spiclk] -group [get_clocks clk_50]
#set_clock_groups -asynchronous -group [get_clocks $hostclk] -group [get_clocks clk_50]
#set_clock_groups -asynchronous -group [get_clocks $supportclk] -group [get_clocks clk_50]

set_clock_groups -asynchronous -group [get_clocks spiclk] -group [get_clocks sdramclk]
set_clock_groups -asynchronous -group [get_clocks $hostclk] -group [get_clocks sdramclk]
set_clock_groups -asynchronous -group [get_clocks $supportclk] -group [get_clocks sdramclk]


# Some relaxed constrain to the VGA pins. The signals should arrive together, the delay is not really important.
set_output_delay -clock [get_clocks clk_50] -max 0 [get_ports $VGA_OUT]
set_output_delay -clock [get_clocks clk_50] -min -5 [get_ports $VGA_OUT]
set_multicycle_path -to $VGA_OUT -setup 2
set_multicycle_path -to $VGA_OUT -hold 1

set_false_path -to ${FALSE_OUT}
set_false_path -from ${FALSE_IN}








# # SDRAM delays
# set_input_delay -clock [get_clocks sdramclk] -max 6.4 [get_ports $RAM_IN]
# set_input_delay -clock [get_clocks sdramclk] -min 3.2 [get_ports $RAM_IN]
# set_output_delay -clock [get_clocks sdramclk] -max 1.5 [get_ports $RAM_OUT]
# set_output_delay -clock [get_clocks sdramclk] -min -0.8 [get_ports $RAM_OUT]

# #set_multicycle_path -from sdramclk -to [get_clocks $sysclk] -setup 2


# #set sysclk ${topmodule}CLOCKS|altpll_component|auto_generated|pll1|clk[0]

# set clk_uart ${topmodule}pll|altpll_component|auto_generated|pll1|clk[2]
# set clk_113_750 ${topmodule}pllvideo|altpll_component|auto_generated|pll1|clk[2] 
# set clk_56_875 ${topmodule}pllvideo|altpll_component|auto_generated|pll1|clk[1] 
# set clk_28_636 ${topmodule}pllvideo|altpll_component|auto_generated|pll1|clk[0] 
# set clk_14_318 ${topmodule}pllvideo|altpll_component|auto_generated|pll1|clk[3] 

# #clk_4_77
# #peripheral_clock

# set_clock_groups -asynchronous \
# -group [get_clocks clk_50]\
# -group [get_clocks $clk_100]\
# -group [get_clocks sdramclk] \
# -group [get_clocks $clk_uart] \
# -group [get_clocks $clk_56_875]

# # -group [get_clocks $clk_113_750] \
# # -group [get_clocks $clk_56_875] \
# # -group [get_clocks $clk_28_636] \
# # -group [get_clocks $clk_14_318]

# #-group [get_clocks $hostclk] \
# #-group [get_clocks $supportclk] 
# #-group [get_clocks $sysclk] \
# #-group [get_clocks cen_opl2] \

