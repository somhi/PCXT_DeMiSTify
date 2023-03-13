# [IBM PC/XT](https://en.wikipedia.org/wiki/IBM_Personal_Computer_XT)  [DeMiSTified](https://github.com/robinsonb5/DeMiSTify)  - SiDi port

07/07/22 SiDi port by @somhi from original MiSTer PCXT core  https://github.com/spark2k06/PCXT_MiSTer

[Read this guide if you want to know how I DeMiSTified this core](https://github.com/DECAfpga/DECA_board/tree/main/Tutorials/DeMiSTify).

Read the main [Readme](https://github.com/somhi/PCXT_DeMiSTify) also.

### MiST firmware

Compile the latest firmware from [mist-devel](https://github.com/mist-devel/mist-firmware) if the available binary has been built before 09/03/23.

### STATUS

* **IDE HD image can now be used in MiST ports**. Just add an image file named **PCXT.HD0** at the root of the SD card. Not all geometries are accepted. It should work with PCem standard geometries.

* UART port needs to be used to load floppy images through the serdrive app using a USB Serial cable. Press ALT key during XT-IDE boot process to anable the IDE COM detection.

* ADLIB sound not implemented due to lack of BRAM in this board.

* C/MS Game Blaster sound not implemented (with it enabled there was hungs during BIOS load)

* Credits screen not implemented due to lack of BRAM in this board. F11 pauses the core. If you press it, remember to press it again to continue the core execution.

* CGA 32 kB implemented. Some Tandy games are now playable like Prince of Persia, Cool Crocks and Sierra's Manhunter.

  

### Compile the project in Quartus:

Project already has the Demistify firmware already generated so if you have cloned recursively then you can open the project with Quartus:

```sh
git clone  --recursive https://github.com/somhi/PCXT_DeMiSTify

#Load project in Quartus from /sidi/PCXT_sidi.qpf
```



### Instructions to Full compile the project for a specific board:

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
make BOARD=sidi
#when asked just accept default settings with Enter key
```

After that you can:

* Load project in Quartus from /sidi/PCXT_sidi.qpf

