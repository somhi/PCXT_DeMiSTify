# [IBM PC/XT](https://en.wikipedia.org/wiki/IBM_Personal_Computer_XT)  [DeMiSTified](https://github.com/robinsonb5/DeMiSTify) - SoCkit port

Port DeMiSTified by Somhic from original MiSTer port currently in development  https://github.com/MiSTer-devel/PCXT_MiSTer

**Bugs**:

* With original IBM ROM does not work keyboard (beeps at every keystroke)
* Serdrive works at 460.8 K or 230.4K but not 115.2K
* Audio: a continous beeper tone can be heard e.g. in area5150 demo

**UART port is required to be used to load the OS through the serdrive app.**



**Features for Sockit board:**

* VGA video output (using only 666 but capable of 888)
* Audio I2S Line out (3.5 jack green connector) 

**External addon required for:**

* PS/2 Keyboard
* DB9 Joystick 
* MIDI output and MIDI I2S mixing available though an external mt32-pi synthesizer ([MIDI2SBC](https://github.com/somhi/MIDI_I2S_SBC_Pmod_Edge_Interface))
* SDRAM Mister module 
  - Tested with 32 MB SDRAM board for MiSTer (extra slim) XS_2.2 ([see connections](https://github.com/SoCFPGA-learning/DECA/tree/main/Projects/sdram_mister_deca))
  - Tested with a dual memory module v1.3 with 3 pins ([see connections](https://github.com/SoCFPGA-learning/DECA/tree/main/Projects/sdram_mister_deca) + [3pins](https://github.com/DECAfpga/DECA_board/blob/main/Sdram_mister_deca/README_3pins.md))



### Compile the project in Quartus:

Project already has the Demistify firmware already generated so if you have cloned recursively then you can open the project with Quartus:

```sh
git clone  --recursive https://github.com/somhi/PCXT_DeMiSTify
#Load project in Quartus from /sockit/PCXT_DeMiSTify_sockit.qpf
```

### Instructions to compile the project for a specific board:

```sh
git clone https://github.com/DECAfpga/PCXT_DeMiSTify
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
* Load project in Quartus from /sockit/PCXT_DeMiSTify_sockit.qpf

### Pinout connections:

Check the qsf  project file at the sockit folder.

I'm currently using the Terasic HSMC to GPIO [Daughter Board](https://www.digikey.es/es/products/detail/P0033/P0033-ND/2003485) connected to the [Deca Retro cape](https://github.com/somhi/DECA_retro_cape_2) to SoCkit gateway.   

* J3 2x40 pin is connected to Deca Retro cape to use its connector peripherals: ps2 keyboard, db9 joystick, pmod3 for a Pmod microSD

* J2 2x40 pin is for connecting [SDRAM Mister modules](http://modernhackers.com/128mb-sdram-board-on-de10-standard-de1-soc-and-arrow-sockit-fpga-sdram-riser/) 

An specific addon for SoCkit might be developed in the future.

**Others:**

* Button KEY4 is a reset button

### OSD Controls

* F12 show/hide OSD 
* Long F12 toggles VGA/RGB mode
* The reset button KEY4 resets the controller (so re-initialises the SD card if it's been changed, reloads any autoboot ROM.) The OSD Reset menu item resets the core itself.

