# Notes regarding DeMiSTified version

* Neptuno Port uses 640 MB SDRAM and 64 kB BIOS in SRAM
* Deca Port,  need to comment out CGA RAM in rtl/KFPC-XT/HDL/Peripherals.sv to fit in memory



* rtl/KFPC-XT/HDL/Peripherals.sv
  * BIOS loaded in BRAM with RAM 1 port Altera IP  --> **do not working well so it hungs in splash screen**
  * ~~RAM is only defined at 32 kB to fit in NeptUNO/Deca BRAM  --> **Another reason because it  hungs in splash screen**~~

* PCXT.sv    
  * All status[4] in PCXT.sv have been inverted to start in MDA mode instead of CGA
  * keyboard output ports have been commented

