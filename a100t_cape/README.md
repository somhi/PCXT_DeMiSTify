# Xilinx Artix A100T notes



**Constraints have not been ported yet from Altera to Xilinx, so that could affect how core works.**

Some bugs observed:

* Keyboard typing is a bit buggy
* When enabling Credits screen with F11 sometimes it gets stuck there



### Changed files for xilinx port

Those files are included in a100t_cape folder.

* PCXT.sv
* demistify_config_pkg.vhd
* rtl/common/data_io.v
* rtl/KFPC-XT/HDL/peripherals.sv 
* uart/gh_fifo_async_sr.vhd



### PORTING NOTES

* Most errors can be avoided if defining Verilog files as System Verilog type          

  <FileInfo SFType="SVerilog">  

* Define general macros file  (defs.v)   as Verilog header (defs.vh) and set global include property             <Attr Name="IsGlobalInclude" Val="1"/>



