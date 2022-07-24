# PCXT DeMiSTified - Neptuno port

07/07/22 Neptuno port DeMiSTified by Somhic from original MiSTer PCXT core  https://github.com/spark2k06/PCXT_MiSTer

### STATUS

* Load OS using Serial Rx/Tx interface using the two ps2 mouse pins.  See pinout below.

* Project already has the Demistify firmware already generated so if you have cloned recursively then you can open the project with Quartus

  ```sh
  git clone  --recursive https://github.com/somhi/PCXT_DeMiSTify
  
  -- add/modify the following in Neptuno_pins.tcl in demistify/board/neptuno
  -- #UART
  -- #set_location_assignment PIN_C21 -to PS2_MOUSE_CLK
  -- set_location_assignment PIN_C21 -to UART_RXD
  -- #set_location_assignment PIN_B21 -to PS2_MOUSE_DAT
  -- set_location_assignment PIN_B21 -to UART_TXD
  
  #Load project in Quartus from /deca/[core_name]_deca.qpf
  ```

  



### Instructions to Full compile the project for a specific board:

```sh
git clone https://github.com/somhi/PCXT_DeMiSTify
cd PCXT_DeMiSTify
#Do a first make (will finish in error) but it will download missing submodules 
make
cd DeMiSTify
#Create file site.mk in DeMiSTify folder 
cp site.template site.mk
#Edit site.mk and add your own PATHs to Quartus (Q18)
gedit site.mk
#Go back to root folder and do a make with board target (deca, neptuno, uareloaded, atlas_cyc). If not specified it will compile for all targets.
cd ..
make BOARD=neptuno
#when asked just accept default settings with Enter key
```

After that you can:

* Load project in Quartus from /deca/[core_name]_deca.qpf



### OSD Controls

* F12 show/hide OSD 
* Long F12 toggles VGA/RGB mode
* The reset button KEY0 resets the controller (so re-initialises the SD card if it's been changed, reloads any autoboot ROM.) The OSD Reset menu item resets the core itself.

