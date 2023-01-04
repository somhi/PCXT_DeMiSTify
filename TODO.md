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
* UART 16750 not updated because of serdrive not loading HDD images
* Simulated composite video output
* OSD save configuration
  *  the BBC core can load and save configs.  (The config file has to be pre-existing on the SD Card, though - the filesystem code can't create files.)  You can save whatever you want in the config file, there are configtocore() and coretoconfig() functions in overrides.c.  The loading / saving is done from an extra menu page, accessed with the right cursor key while the menu is shown.
*  IDE module from AO486_Mister project.
* /SW/ROMs  the three new rom files are prepared for IDE module and therfore not valid for serdrive
* Pause & Credits screen (Win + F12)

### Other differences in Demistify ports

* KFPS2KB.sv includes kitune-san changes to avoid problems with direct keyboard connection conflicting with DeMiSTify controller (error flag)
