# [IBM PC/XT](https://en.wikipedia.org/wiki/IBM_Personal_Computer_XT)  [DeMiSTified](https://github.com/robinsonb5/DeMiSTify)

Port DeMiSTified by Somhic from original MiSTer port currently in development  https://github.com/MiSTer-devel/PCXT_MiSTer

Keyboard controller does not pass diagnostic tests

**Check specific BOARD limitations on each board folder's readme.**

Currently floppy and hdd images can only be loaded trough serial UART Rx/Tx with the XT IDE BIOS. Serdrive program should be used in the host computer serving the images.

```sh
#Windows example
serdrive.exe -g 733:7:17 -v [-c <port>] -d 460.8Kb <image>
#Linux example
serdrive_x64 -g 733:7:17 -v -c /dev/ttyUSB0 -b 921.6K PCXT_CGA_Tandy.img 
```

Some notes about serdrive:

* 921.6 Kb only works at 14.3 MHz
* Core has enabled RTS/CTS signals which gives better stability and speed to the HDD
* Windows does not care about RTS/CTS signals
* In Linux those RTS/CTS lines need to be connected for XTIDE to detect the image. Take care that CTS goes to RTS and RTS to CTS.

Follow core discussion at https://misterfpga.org/viewtopic.php?t=4680

Follows original readme (with some crossed out where does not apply).



# [IBM PC/XT](https://en.wikipedia.org/wiki/IBM_Personal_Computer_XT) for [MiSTer FPGA](https://mister-devel.github.io/MkDocs_MiSTer/)

PCXT port for MiSTer by [@spark2k06](https://github.com/spark2k06/).

Discussion and evolution of the core in the following misterfpga forum thread:

https://misterfpga.org/viewtopic.php?t=4680&start=1020

## Description

The purpose of this core is to implement a PCXT as reliable as possible. For this purpose, the [MCL86 core](https://github.com/MicroCoreLabs/Projects/tree/master/MCL86) from [@MicroCoreLabs](https://github.com/MicroCoreLabs/) and [KFPC-XT](https://github.com/kitune-san/KFPC-XT) from [@kitune-san](https://github.com/kitune-san) are used.

The [Graphics Gremlin project](https://github.com/schlae/graphics-gremlin) from TubeTimeUS ([@schlae](https://github.com/schlae)) has also been integrated in this first stage.

[JTOPL](https://github.com/jotego/jtopl) by Jose Tejada (@topapate) was integrated for AdLib sound.

An SN76489AN Compatible Implementation (Tandy Sound) written in VHDL was also integrated - Copyright (c) 2005, 2006, [Arnim Laeuger](https://github.com/devsaurus) (arnim.laeuger@gmx.net)

## ROM Instructions

ROMs should be provided initially from the BIOS section of the OSD menu, ~~then it is only necessary to indicate the computer model and reset, on subsequent boot of the core, it is no longer necessary to provide them, unless we want to use others.~~ Original and copyrighted ROMs can be generated on the fly using the python scripts available in the SW folder of this repository:

* `make_rom_with_ibm5160.py`: A valid ROM is created for the PCXT model (pcxt.rom) based on the original IBM 5160 ROM, requires the XTIDE BIOS at address EC00h to work with HD images.
* `make_rom_with_jukost.py`: A valid ROM is created for the PCXT model (pcxt.rom) based on the original Juko ST ROM, and with the XTIDE BIOS embedded at address F000h.
* `make_rom_with_tandy.py`: A valid ROM is created for the Tandy model (tandy.rom) based on the original Tandy 1000 ROM, requires the XTIDE BIOS at address EC00h to work with HD images.

From the same BIOS section of the OSD it is possible to specify an XTIDE ROM of up to 16Kb to work at address EC00h. It is also provided in this repository.

Other Open Source ROMs are available in the same folder:

* `pcxt_pcxt31.rom`: This ROM already has the XTIDE BIOS embedded at address F000h. ([Source Code](https://github.com/virtualxt/pcxtbios))
* `pcxt_micro8088.rom`: This ROM already has the XTIDE BIOS embedded at address F000h. ([Source Code](https://github.com/skiselev/8088_bios))
* `ide_xtl.rom`: This ROM corresponds to the XTIDE BIOS, it must be maintained for some scripts to work, it can also be upgraded to a newer version. ([Source Code](https://www.xtideuniversalbios.org/))

## Mounting the disk image

Initially, and until an 8-bit IDE module compatible with XTIDE is available, floppy and hdd mounting will be done through the serial port ~~available in the core via the OSD menu~~. The available transfer speeds are as follows:

* 115200 Kbps
* 230400 Kbps
* 460800 Kbps
* 921600 Kbps

By default it is set to 115200, but this speed does not work, as XTIDE does not identify it... The most suitable speed is 460800, although 921600 is possible to use only with the CPU speed at 14.318MHz.

The FDD image is recognised by XTIDE as B:, so to boot from floppy disk when booting, the 'B' key must be pressed when the XTIDE boot screen appears.

## To-do list and challenges

* Refactor Graphics Gremlin module, the new KFPC-XT system will make this refactor possible.
* 8-bit IDE module implementation
* Floppy implementation
* Addition of other modules

## Developers

Any contribution and pull request, please carry it out on the prerelease branch. Periodically they will be reviewed, moved and merged into the main branch, together with the corresponding release.

Thank you!
