**Bugs and TODO list:**

* Keyboard
  * Keyboard controller does not pass diagnostic tests. Juko ST BIOS gives keyboard error

  * IBM5160 BIOS: keyboard not working right (kind of working at 14.3 Mhz CPU speed)
  
* Video
  * No overscan with Graphic Gremlins scandoubler (//.video(video))
  * RGB 15 kHz video output 
    * Not displaying OSD correctly
    * CGA video (not TGA) deformed at top part of screen in some resolutions

  * YPbPr video output did not work on my setup.




### Parts from MiSTer original core not ported to DeMiSTify ports

* Overscan control with scandoubler done in PCXT.sv. Border on/off from OSD option.
  * signals: color, tandy_16_gfx
* Audio configuration settings from ao486
* UART 16750 not updated because of serdrive cannot load HDD image
* Simulated composite video output
* OSD save configuration
  *  the BBC core can load and save configs.  (The config file has to be pre-existing on the SD Card, though - the filesystem code can't create files.)  You can save whatever you want in the config file, there are configtocore() and coretoconfig() functions in overrides.c.  The loading / saving is done from an extra menu page, accessed with the right cursor key while the menu is shown.
