# derive_pll_clocks
# derive_clock_uncertainty

# # core specific constraints
# create_generated_clock -name SDRAM_CLK -source { FPGA_CLK2_50 }  [get_ports { SDRAM_CLK }]
# set_input_delay -clock { SDRAM_CLK } -max 6 [get_ports { SDRAM_DQ[*] }]
# set_input_delay -clock { SDRAM_CLK } -min 3 [get_ports { SDRAM_DQ[*] }]
# set_output_delay -clock { SDRAM_CLK } -max 2 [get_ports { SDRAM_DQ[*] SDRAM_DQM* SDRAM_A[*] SDRAM_n*  SDRAM_BA SDRAM_CKE }]
# set_output_delay -clock { SDRAM_CLK } -min 1.5 [get_ports { SDRAM_DQ[*] SDRAM_DQM* SDRAM_A[*] SDRAM_n*  SDRAM_BA SDRAM_CKE }]

###################

#set sysclk ${topmodule}CLOCKS|altpll_component|auto_generated|pll1|clk[0]

create_generated_clock -name sdramclk -source ${topmodule}pll|altpll_component|auto_generated|pll1|clk[1] [get_ports $RAM_CLK]
#create_generated_clock -name sdramclk -source [get_ports {FPGA_CLK1_50}]

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
