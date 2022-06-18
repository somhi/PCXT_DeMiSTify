Notes regarding demistifies version:

* PCXT.sv    
  * All status[4] in PCXT.sv have been inverted to start in MDA mode instead of CGA
  * keyboard output ports have been commented
  * reset signal has been modified temporally

* Peripherals.sv

  * BIOS loaded in BRAM with RAM 1 port Altera IP

  * CGA RAM can be commented to compile it in Deca port

  