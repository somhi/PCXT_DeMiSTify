# [IBM PC/XT](https://en.wikipedia.org/wiki/IBM_Personal_Computer_XT)  [DeMiSTified](https://github.com/robinsonb5/DeMiSTify) - SoCkit port

SoCkit port DeMiSTified by @somhi from original MiSTer PCXT core   https://github.com/MiSTer-devel/PCXT_MiSTer by @spark2k06

[Read this guide if you want to know how I DeMiSTified this core](https://github.com/DECAfpga/DECA_board/tree/main/Tutorials/DeMiSTify).

Read the main [Readme](https://github.com/somhi/PCXT_DeMiSTify) also.

### STATUS

* Check file defs.v to verify and check disabled options.

* CGA VRAM with 128 kB for Tandy games.

* Composite real not implemented. Need to fix the serializer module error in cyclone v family.


## **Features:**

* VGA video output (using only 666 but capable of 888)
* Audio I2S Line out (3.5 jack green connector) 


**Additional hardware required**

* Terasic HSMC to GPIO [Daughter Board](https://www.digikey.es/es/products/detail/P0033/P0033-ND/2003485) for:

  *  SDRAM Mister module 
    * Tested with 32 MB SDRAM board for MiSTer (extra slim) XS_2.2
    * Tested with a dual memory module v1.3 with 3 pins

  * PS/2 Keyboard

  * DB9 Joystick 


### Compile the project in Quartus:

If the project has the DeMiSTify firmware already generated you only need to clone recursively the repository and then open the project with Quartus from the specific board folder:

```sh
git clone  --recursive https://github.com/somhi/PCXT_DeMiSTify
#check comments on top of /sockit/sockit_top.vhd in case additional actions are needed
#Load project in Quartus from /sockit/PCXT_sockit.qpf
```

### Instructions to compile the project for a specific board:

```sh
git clone https://github.com/somhi/PCXT_DeMiSTify
cd PCXT_DeMiSTify
#Do a first make (will finish in error) but it will download missing submodules 
make
cd DeMiSTify
#Create file site.mk in DeMiSTify folder 
cp site.template site.mk
#Edit site.mk and add your own PATHs to Quartus (Q18)
gedit site.mk
#Go back to root folder and do a make with board target (deca, neptuno, uareloaded, atlas_cyc). If not specified it will compile for all targets.
cd ..
make BOARD=sockit
#when asked just accept default settings with Enter key
```

After that you can:

* Flash bitstream directly from [command line](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus)
* Load project in Quartus from /sockit/PCXT_sockit.qpf

### Pinout connections:

Check the qsf  project file at the sockit folder.

I'm currently using the Terasic HSMC to GPIO [Daughter Board](https://www.digikey.es/es/products/detail/P0033/P0033-ND/2003485) connected to the [Deca Retro cape](https://github.com/somhi/DECA_retro_cape_2) to SoCkit gateway.   

* J3 2x40 pin is connected to Deca Retro cape to use its connector peripherals: ps2 keyboard, db9 joystick, pmod3 for a Pmod microSD

* J2 2x40 pin is for connecting [SDRAM Mister modules](http://modernhackers.com/128mb-sdram-board-on-de10-standard-de1-soc-and-arrow-sockit-fpga-sdram-riser/) 

An specific addon for SoCkit might be developed in the future.

### Buttons

* The reset button KEY4 resets the controller (so re-initialises the SD card if it's been changed, reloads any autoboot ROM.) The OSD Reset menu item resets the core itself.
* The user button KEY0 opens the OSD

### OSD Controls

* F12 show/hide OSD 
* Long F12 toggles VGA/RGB mode

