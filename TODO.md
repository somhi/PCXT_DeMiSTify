### BUGs and TODO list

* Keyboard error controller message with Turbo mode. Please start BIOS with 4.77 MHz to avoid this error.

* When pressing F12 for opening the OSD it sends a keystroke to the DOS program so it can interfere it

* Video

  * No video in some parts of Area5150 demo at max. speed. Run it at 4.77 or 7.16 MHz.

  * video in pause & credits screen could be improved. Screen is shifted to the right because the first 18 left characters appear repeated
  
  * RGB 15 kHz video output . CGA video deformed at top part of screen in some resolutions (don't happen so often in TGA). The same happens in the original MiSTer core.
  
  * YPbPr video output did not work on my setup.
  
  * Real composite video output
    * Center image from core through hblank delays
    * Hot-key to enable composite mode without OSD 
    * OSD background solid color to improve visualization (display green workaround)
    
      

### Parts from MiSTer core not implemented in DeMiSTify ports

* FDD based on ao486 core that has dependencies with the MiSTer firmware (main)
  
* IDE based on ao486 core that has dependencies with the MiSTer firmware (main)

* RTC has dependencies with the MiSTer firmware (main)

* UART 16750 not updated because of serdrive not loading HDD images

* Video
  
  * Overscan delay control with scandoubler done in PCXT.sv
    
    No overscan with Graphic Gremlins scandoubler (//.video(video))
    
    [signals: color used in demisitfy, tandy_16_gfx & tandy_color_16 used in mister]
    
  * Border on/off option from OSD
  * Simulated composite video output
  
* OSD save configuration

  Notes: the BBC core can load and save configs.  (The config file has to be pre-existing on the SD Card, though - the filesystem code can't create files.)  You can save whatever you want in the config file, there are configtocore() and coretoconfig() functions in overrides.c.  The loading / saving is done from an extra menu page, accessed with the right cursor key while the menu is shown.

  


### Differences in Demistify ports

* SW/ROMS/*.rom  roms are adapted for serdrive (XT-IDE BIOS) usage
* SW/   splash.txt, make_splash_ascii-hex.py, serdrive*   DeMiSTify splash screen and serdrive binaries
* rtl/8088/eu_rom.v includes macro EMBED_8088_ROM to use fabric LEs instead of BRAM
* rtl/KFPC-XT/HDL/KFPS2KB/KFPS2KB.sv includes many changes by kitune-san to avoid problems with direct keyboard connection conflicting with DeMiSTify controller (error flag)
* PCXT.sv
  * All Mister framework modules changed by MiST modules
  * BIOS loader has some differences
* Using UART port 1 for serdrive, and UART port 2 por serial mouse
* Video is quite different  (rtl/video and PCXT.sv)







