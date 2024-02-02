# [IBM PC/XT](https://en.wikipedia.org/wiki/IBM_Personal_Computer_XT)  [DeMiSTified](https://github.com/robinsonb5/DeMiSTify)  - UnAMIGA Reloaded port

07/07/22 UAReloaded port DeMiSTified by @somhi from original MiSTer PCXT core  https://github.com/MiSTer-devel/PCXT_MiSTer by @spark2k06

[Read this guide if you want to know how I DeMiSTified this core](https://github.com/DECAfpga/DECA_board/tree/main/Tutorials/DeMiSTify).

Read the main [Readme](https://github.com/somhi/PCXT_DeMiSTify) also.

### STATUS

* CGA VRAM with 128 kB for all Tandy games now available.
* Check file defs.v to verify and check disabled options. 


### Compile the project in Quartus:

If the project has the DeMiSTify firmware already generated you only need to clone recursively the repository and then open the project with Quartus from the specific board folder:

```sh
git clone  --recursive https://github.com/somhi/PCXT_DeMiSTify
#check comments on top of /uareloaded/uareloaded_top.vhd in case additional actions are needed
#Load project in Quartus from /uareloaded/PCXT_uareloaded.qpf
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
make BOARD=uareloaded
#when asked just accept default settings with Enter key
```

After that you can:

* Load project in Quartus from /uareloaded/PCXT_uareloaded.qpf

### OSD Controls

* F12 show/hide OSD 
* Long F12 toggles VGA/RGB mode

