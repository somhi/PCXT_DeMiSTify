#set sysclk ${topmodule}CLOCKS|altpll_component|auto_generated|pll1|clk[0]

if {[info exists cyclonev] && ($cyclonev==1)} {
    create_generated_clock -name sdramclk -source ${topmodule}pll|altpll_component|auto_generated|generic_pll2~PLL_OUTPUT_COUNTER|divclk [get_ports $RAM_CLK]
} else {
    create_generated_clock -name sdramclk -source ${topmodule}pll|altpll_component|auto_generated|pll1|clk[1] [get_ports $RAM_CLK]
}

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

# SDRAM delays
set_input_delay -clock [get_clocks sdramclk] -max 6.4 [get_ports $RAM_IN]
set_input_delay -clock [get_clocks sdramclk] -min 3.2 [get_ports $RAM_IN]

set_output_delay -clock [get_clocks sdramclk] -max 1.5 [get_ports $RAM_OUT]
set_output_delay -clock [get_clocks sdramclk] -min -0.8 [get_ports $RAM_OUT]

#set_multicycle_path -from sdramclk -to [get_clocks $sysclk] -setup 2

set_false_path -to ${FALSE_OUT}
set_false_path -from ${FALSE_IN}
