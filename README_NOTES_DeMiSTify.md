# Notes regarding DeMiSTified version

* rtl/KFPC-XT/HDL/Peripherals.sv

  * BIOS loaded in BRAM with RAM 1 port Altera IP  --> **I think this is not working well so it hungs in splash screen**

  * ~~RAM is only defined at 32 kB to fit in NeptUNO/Deca BRAM  --> **Another reason because it  hungs in splash screen**~~

  * CGA RAM can be commented to compile it in Deca port

* PCXT.sv    
  * All status[4] in PCXT.sv have been inverted to start in MDA mode instead of CGA
  * keyboard output ports have been commented
  * reset signal has been modified temporally