# [IBM PC/XT](https://en.wikipedia.org/wiki/IBM_Personal_Computer_XT)  [DeMiSTified](https://github.com/robinsonb5/DeMiSTify) -  NeptUNO+ GX150 DeMiSTify port

port by @somhi from original MiSTer PCXT core  https://github.com/MiSTer-devel/PCXT_MiSTer by @spark2k06

Check out this [unofficial wiki](https://github.com/somhi/DeMiSTify/wiki) to learn more about DeMiSTify.

Read the main [Readme](https://github.com/somhi/PCXT_DeMiSTify) also.

### STATUS

* Check file defs.v to verify and check disabled options.

  

### Compile the project in Quartus:

If the project has the DeMiSTify firmware already generated you only need to clone recursively the repository and then open the project with Quartus from the specific board folder:

```sh
git clone  --recursive https://github.com/somhi/PCXT_DeMiSTify

#Load PCXT_*.qpf project file in Quartus 
```



### Buttons

* The user button KEY0 resets the controller (so re-initialises the SD card if it's been changed, reloads any autoboot ROM.) The OSD Reset menu item resets the core itself.

* The user button KEY1 opens the OSD

### OSD Controls

* F12 show/hide OSD 
* Long F12 toggles VGA/RGB mode

