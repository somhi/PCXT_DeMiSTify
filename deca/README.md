# PCXT DeMiSTified - Deca port

07/07/22 Neptuno port DeMiSTified by Somhic from original MiSTer PCXT core  https://github.com/spark2k06/PCXT_MiSTer

**Current version of PCXT requires around 235 kB of BRAM** .  Deca has only 210 kB (with 182 M9k blocks).

* CGA VRAM has been disabled in rtl/KFPC-XT/HDL/Peripherals.sv
  * On startup, open OSD with F12, go to Audio&Video menu and change video output to MDA
  * Load a BIOS like Juko + XTIDE
  * Reset core from OSD
* Serdrive works at 115.2 kB


**UART port is required to be used to load the OS through the serdrive app.**

**Now compatible with [Deca Retro Cape 2](https://github.com/somhi/DECA_retro_cape_2)** (new location for 3 pins of old SDRAM modules). Otherwise see pinout below to connect everything through GPIOs.

**Features for Deca board**

* VGA 444 video output is available through GPIO. 
* Audio I2S Line out (3.5 jack green connector) 

**Additional hardware required**

- SDRAM module
  - Tested with 32 MB SDRAM board for MiSTer (extra slim) XS_2.2 ([see connections](https://github.com/SoCFPGA-learning/DECA/tree/main/Projects/sdram_mister_deca))
- PS/2 Keyboard connected to GPIO



### Compile the project in Quartus:

Project already has the Demistify firmware already generated so if you have cloned recursively then you can open the project with Quartus:

```sh
git clone  --recursive https://github.com/somhi/PCXT_DeMiSTify
#Load project in Quartus from /deca/PCXT_DeMiSTify_deca.qpf
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
#Go back to root folder and do a make with board target (deca, neptuno, uareloaded, atlas_cyc). If not specified it will compile for all targets.
cd ..
make BOARD=deca
#when asked just accept default settings with Enter key
```

After that you can:

* Flash bitstream directly from [command line](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus)
* Load project in Quartus from /deca/[core_name]_deca.qpf

### Pinout connections:

![pinout_deca](pinout_deca.png)

Mouse, joystick, MIDI are not used in this core

UART port is required to be used to load the OS through the serdrive app.

For 444 video DAC use all VGA pins. For 333 video DAC connect MSB from addon to MSB of location assignment (e.g. connect pin VGAR2 from Waveshare addon to VGA_R[3] Deca pin).

**Others:**

* Button KEY0 is a reset button

### OSD Controls

* F12 show/hide OSD 
* Long F12 toggles VGA/RGB mode
* The reset button KEY0 resets the controller (so re-initialises the SD card if it's been changed, reloads any autoboot ROM.) The OSD Reset menu item resets the core itself.

