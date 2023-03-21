# [IBM PC/XT](https://en.wikipedia.org/wiki/IBM_Personal_Computer_XT)  - Deca MiST port

02/02/23 Deca MiST port by @somhi from original MiSTer PCXT core  https://github.com/spark2k06/PCXT_MiSTer

Read the main [Readme](https://github.com/somhi/PCXT_DeMiSTify) also.

### MiST firmware

Compile the latest firmware from [mist-devel](https://github.com/mist-devel/mist-firmware) if the available binary has been built before 09/03/23.

Note: in case the  SPI bus is noisy it may help adding -DSD_NO_DIRECT_MODE to the Makefile to disable the SS4/SPI_DO method of SD Card transfer. 

### STATUS

* **IDE HD image can now be used in MiST ports**. Just add an image file named **PCXT.HD0** at the root of the SD card. Not all geometries are accepted. It should work with PCem standard geometries.
* UART port needs to be used to load floppy images through the serdrive app using a USB Serial cable. Press ALT key during XT-IDE boot process to anable the IDE COM detection.
* CGA VRAM with 128 kB for all Tandy games now available.

* Compatible with [Deca Retro Cape 2](https://github.com/somhi/DECA_retro_cape_2). 

## **Features:**

* VGA 444 video output is available through GPIO. 
* Audio I2S Line out (3.5 jack green connector) 

**Additional hardware required**:

- [MiST addon](https://github.com/somhi/MiSTdon) with AT91SAM7S256, USB Host Shield, SD card modules
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



### Pinout connections:

![pinout_deca](../DeMiSTify/Board/deca_mist/pinout_deca.png)

MIDI is not used in this core

UART port is required to be used to load the OS through the serdrive app.

For 444 video DAC use all VGA pins. For 333 video DAC connect MSB from addon to MSB of location assignment (e.g. connect pin VGAR2 from Waveshare addon to VGA_R[3] Deca pin).

