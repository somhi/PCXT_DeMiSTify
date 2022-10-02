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
* UART 16750 not updated
