# [IBM PC/XT](https://en.wikipedia.org/wiki/IBM_Personal_Computer_XT)  [DeMiSTified](https://github.com/robinsonb5/DeMiSTify) - Deca port

07/07/22 Deca port DeMiSTified by @somhi from original MiSTer PCXT core  https://github.com/MiSTer-devel/PCXT_MiSTer by @spark2k06

[Read this guide if you want to know how I DeMiSTified this core](https://github.com/DECAfpga/DECA_board/tree/main/Tutorials/DeMiSTify).

Read the main [Readme](https://github.com/somhi/PCXT_DeMiSTify) also.

### STATUS

* CGA VRAM with 128 kB for all Tandy games.
* Check file defs.v to verify and check disabled options. 
* Credits screen not implemented due to lack of BRAM. F11 pauses the core (if you press it, remember to press it again to continue the core execution)

## **Features:**

* VGA 444 video output is available through GPIO. 
* Audio I2S Line out (3.5 jack green connector) 
* Joystick support (through DB9 or USB3 connector in DECA Retro Cape 2)

**Additional hardware required**:

- [Deca Retro Cape 2](https://github.com/somhi/DECA_retro_cape_2) addon. Otherwise, see pinout below to connect everything through GPIOs.
- SDRAM module
  - Tested with 32 MB SDRAM board for MiSTer (extra slim) XS_2.2
  - Tested with a dual memory module v1.3 with 3 pins
- PS/2 Keyboard connected to GPIO

### Compile the project in Quartus:

If the project has the DeMiSTify firmware already generated you only need to clone recursively the repository and then open the project with Quartus from the specific board folder:

```sh
git clone  --recursive https://github.com/somhi/PCXT_DeMiSTify
#check comments on top of /deca/deca_top.vhd in case additional actions are needed
#Load project in Quartus from /deca/PCXT_deca.qpf
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
make BOARD=deca
#when asked just accept default settings with Enter key
```

After that you can:

* Flash bitstream directly from [command line](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus)
* Load project in Quartus from /deca/PCXT_deca.qpf

### Pinout connections:

![pinout_deca](pinout_deca.png)

MIDI is not used in this core

UART port is required to be used to load the OS through the serdrive app.

For 444 video DAC use all VGA pins. For 333 video DAC connect MSB from addon to MSB of location assignment (e.g. connect pin VGAR2 from Waveshare addon to VGA_R[3] Deca pin).

### Buttons

* The user button KEY0 resets the controller (so re-initialises the SD card if it's been changed, reloads any autoboot ROM.) The OSD Reset menu item resets the core itself.

* The user button KEY1 opens the OSD

### OSD Controls

* F12 show/hide OSD 

* Long F12 toggles VGA/RGB mode

  
