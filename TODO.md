**Bugs and TODO list:**

* Save OSD configuration in a config file in SD card

* Video

  * No overscan with Graphic Gremlins scandoubler (//.video(video))

  * RGB 15 kHz video output 
    * CGA video (not TGA) deformed at top part of screen in some resolutions
    
  * YPbPr video output did not work on my setup.

  * Composite video output
    * Hot-key to enable composite mode without OSD
    
      



### Parts from MiSTer original core not ported to DeMiSTify ports

* Overscan control with scandoubler done in PCXT.sv. Border on/off from OSD option.
  * signals: color, tandy_16_gfx
* FDD based on ao486 core that has dependencies with the MiSTer firmware (main)
* UART 16750 not updated because of serdrive cannot load HDD images
* Simulated composite video output
* OSD save configuration
  *  the BBC core can load and save configs.  (The config file has to be pre-existing on the SD Card, though - the filesystem code can't create files.)  You can save whatever you want in the config file, there are configtocore() and coretoconfig() functions in overrides.c.  The loading / saving is done from an extra menu page, accessed with the right cursor key while the menu is shown.
