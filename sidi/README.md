# [IBM PC/XT](https://en.wikipedia.org/wiki/IBM_Personal_Computer_XT)  [DeMiSTified](https://github.com/robinsonb5/DeMiSTify)  - SiDi port

07/07/22 SiDi port by @somhi from original MiSTer PCXT core  https://github.com/spark2k06/PCXT_MiSTer

[Read this guide if you want to know how I DeMiSTified this core](https://github.com/DECAfpga/DECA_board/tree/main/Tutorials/DeMiSTify).

Read the main [Readme](https://github.com/somhi/PCXT_DeMiSTify) also.

### STATUS

* **UART port needs to be used to load the OS through the serdrive app.** Load OS using Serial Rx/Tx cable.
* MDA not implemented due to lack of BRAM in this board.
* CGA 32 kB implemented. Some Tandy games are now playable like Prince of Persia, Cool Crocks and Sierra's Manhunter.
* ~~CGA not implemented due to lack of BRAM in this board.~~
* ~~Open OSD with F12 key. Go to Video and change CGA to MDA output. The Splash screen should appear. Then Load XT BIOS ROM (and EC00 XT-IDE 16 kB if not included in the main BIOS) and Reset from OSD.~~

Notes about ROMs:

- ROMs working with MDA video: (IBM5160, Yuko ST and pcxt31 work), (Tandy, micro8088, full XTIDE BIOS do not work).
- If you load a BIOS that does not work with MDA you may need to power cycle the board.



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

