# Notes regarding DeMiSTified version

* Neptuno Port uses 640 MB SDRAM and 64 kB BIOS in SRAM

* Deca Port,  CGA VRAM defined as 16 kB instead of 32 kB

  

* changes from RAM.sv from Beta 1.0 not implemented yet
* rtl/KFPC-XT/HDL/Peripherals.sv
  * ​    // jtopl2 jtopl2_inst         // sn76489_top sn76489   modules instantation disabled
* PCXT.sv    
  * All status[4] in PCXT.sv have been inverted to start in MDA mode instead of CGA
  * keyboard output ports have been commented

