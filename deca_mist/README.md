# [IBM PC/XT](https://en.wikipedia.org/wiki/IBM_Personal_Computer_XT)  [DeMiSTified](https://github.com/robinsonb5/DeMiSTify) - Deca MiST port

02/02/23 Deca MiST port DeMiSTified by @somhi from original MiSTer PCXT core  https://github.com/spark2k06/PCXT_MiSTer

Read the main [Readme](https://github.com/somhi/PCXT_DeMiSTify) also.

### STATUS

* CGA VRAM with 128 kB for all Tandy games now available.

* **UART port needs to be used to load the OS through the serdrive app.** Load OS using Serial Rx/Tx cable.

Compatible with [Deca Retro Cape 2](https://github.com/somhi/DECA_retro_cape_2). 

## **Features:**

* VGA 444 video output is available through GPIO. 
* Audio I2S Line out (3.5 jack green connector) 

**Additional hardware required**:

- MiST addon with AT91SAM7S256, USB Host Shield, SD card modules
- SDRAM module
  - Tested with 32 MB SDRAM board for MiSTer (extra slim) XS_2.2
  - Tested with a dual memory module v1.3 with 3 pins

### Compile the project in Quartus:

Project already has the DeMiSTify firmware already generated so if you have cloned recursively then you can open the project with Quartus:

```sh
git clone  --recursive https://github.com/somhi/PCXT_DeMiSTify

#check comments on top of /deca_mist/deca_mist_top.vhd in case additional actions are needed

#Load project in Quartus from /deca_mist/PCXT_deca_mist.qpf
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
#Go back to root folder and do a make with board target (deca, deca_mist, neptuno, uareloaded, atlas_cyc). If not specified it will compile for all targets.
cd ..
make BOARD=deca_mist
#when asked just accept default settings with Enter key
```

After that you can:

* Flash bitstream directly from [command line](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus)
* Load project in Quartus from /deca_mist/PCXT_deca_mist.qpf

### Pinout connections:

![pinout_deca](../DeMiSTify/Board/deca_mist/pinout_deca.png)

MIDI is not used in this core

UART port is required to be used to load the OS through the serdrive app.

For 444 video DAC use all VGA pins. For 333 video DAC connect MSB from addon to MSB of location assignment (e.g. connect pin VGAR2 from Waveshare addon to VGA_R[3] Deca pin).

