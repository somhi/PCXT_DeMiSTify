**TODO list:**

* Keyboard controller does not pass diagnostic tests
  * JUKO ST BIOS: keyboard error

* IBM BIOS: keyboard not working right
* No overscan with scandoubler enabled
  
* MDA output most right column is cutted
  * `mda_mode ? HBlank_del[color ? 12 : 13] `

* Overscan problem with the OSD (left column)

* RGB 15 kHz video output does not display OSD correctly

* RGB 15 kHz video outputs CGA video (not TGA) deformed at top part of screen in some resolutions

* YPbPr video output did not work on my setup.



### Parts from MiSTer original core not ported to Demistify ports

* Overscan control with scandoubler in PCXT.sv
  * signals: color, tandy_16_gfx
* audio config settings from ao486
* uart 16750 not updated
