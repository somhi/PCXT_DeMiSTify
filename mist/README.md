# [IBM PC/XT](https://en.wikipedia.org/wiki/IBM_Personal_Computer_XT) - MIST port

24/09/22 MIST port by Somhic from original MiSTer PCXT core  https://github.com/spark2k06/PCXT_MiSTer

### STATUS

* UART port is required to be used to load the OS through the serdrive app. **Unfortunately MiST board does not has external UART pins so at the moment loading operating system is not supported.**
* CGA not implemented due to lack of BRAM in this board.
* Open OSD with F12 key. Go to Video and change CGA to MDA output. The Splash screen should appear. Then Load XT BIOS ROM (and XTIDE 16 kB if not included in the main BIOS) and Reset from OSD.

* Notes about ROMs:
  - Not all ROMs work with MDA video: (YUKO ST and PCXT31 works), (TANDY, micro8088, IBM5160, full XTIDE BIOS do not work).
  - If you load a BIOS that does not work with MDA you need to power cycle the board.
  - Sometimes a double Reset is needed (that might be outdated with the latest BIOS Loader by kitune-san)

**Bugs**:

* With original IBM ROM  keyboard might not work very well.

* ~~Serdrive works at 460.8 K or 230.4K but not 115.2K~~

  

### Compile the project in Quartus:

Project already has the Demistify firmware already generated so if you have cloned recursively then you can open the project with Quartus:

```sh
git clone  --recursive https://github.com/somhi/PCXT_DeMiSTify

#Load project in Quartus from /mist/PCXT_mist.qpf
```



