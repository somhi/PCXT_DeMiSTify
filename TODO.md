### BUGs and TODO list

* Keyboard error controller message with Turbo mode (start BIOS with 4.77 MHz for not getting this error).

* Video

  * No overscan with Graphic Gremlins scandoubler (//.video(video))

  * RGB 15 kHz video output 
    * CGA video deformed at top part of screen in some resolutions (don't happen so often in TGA).
    
  * YPbPr video output did not work on my setup.

  * Real composite video output
    * Center image from core through hblank delays
    * Hot-key to enable composite mode without OSD 
    * OSD background solid color to improve visualization (display green workaround)
    
      

### Parts from MiSTer core not implemented in DeMiSTify ports

* Overscan control with scandoubler done in PCXT.sv. Border on/off from OSD option.
  * signals: color, tandy_16_gfx
* FDD based on ao486 core that has dependencies with the MiSTer firmware (main)
* IDE based on ao486 core that has dependencies with the MiSTer firmware (main)
* UART 16750 not updated because of serdrive not loading HDD images
* Simulated composite video output
* OSD save configuration
  *  the BBC core can load and save configs.  (The config file has to be pre-existing on the SD Card, though - the filesystem code can't create files.)  You can save whatever you want in the config file, there are configtocore() and coretoconfig() functions in overrides.c.  The loading / saving is done from an extra menu page, accessed with the right cursor key while the menu is shown.
* SW/ROMs/*.rom files are prepared for IDE module and therefore not valid for serdrive
* Pause & Credits screen (Win + F12)
* RTC has dependencies with the MiSTer firmware (main)

### HDL differences in Demistify ports

* SW/ROMS/*.rom  roms adapted for serdrive
* SW/   splash.txt, make_splash_ascii-hex.py, serdrive*   demistify splash and serdrive binaries
* rtl/8088/eu_rom.v includes macro EMBED_8088_ROM to use LE instead of BRAM
* rtl/KFPC-XT/HDL/KFPS2KB/KFPS2KB.sv includes many changes by kitune-san to avoid problems with direct keyboard connection conflicting with DeMiSTify controller (error flag)
* using uart port 1 for serdrive, and uart port 2 por serial mouse
* PCXT.sv
  * All Mister framework modules changed by MiST modules
  * BIOS loader has some differences



### Pending to update

* PCXT.sv

* rtl/KFPC-XT/HDL/chipset.sv

* rtl/KFPC-XT/HDL/peripherals.sv

* rtl/video

* PCXT.sdc

* README.md

  



