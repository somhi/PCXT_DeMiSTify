# [IBM PC/XT](https://en.wikipedia.org/wiki/IBM_Personal_Computer_XT) - MIST port

24/09/22 MiST port by @somhi from original MiSTer PCXT core  https://github.com/spark2k06/PCXT_MiSTer

Read the main [Readme](https://github.com/somhi/PCXT_DeMiSTify) also.



### MiST firmware

Compile the latest firmware from [mist-devel](https://github.com/mist-devel/mist-firmware) if the available binary has been built before 09/03/23.

### STATUS

* **IDE HD image can now be used in MiST ports**. Just add an image file named **PCXT.HD0** at the root of the SD card. Not all geometries are accepted. It should work with PCem standard geometries.
* UART port needs to be used to load floppy images through the serdrive app using a USB Serial cable. Press ALT key during XT-IDE boot process to anable the IDE COM detection.
* Credits screen not implemented due to lack of BRAM in this board. F11 pauses the core. If you press it, remember to press it again to continue the core execution.
* CGA 32 kB implemented. Some Tandy games are now playable like Prince of Persia, Cool Crocks and Sierra's Manhunter.

### Compile the project in Quartus:

Project already has the Demistify firmware already generated so if you have cloned recursively then you can open the project with Quartus:

```sh
git clone  --recursive https://github.com/somhi/PCXT_DeMiSTify

#Load project in Quartus from /mist/PCXT_mist.qpf
```

