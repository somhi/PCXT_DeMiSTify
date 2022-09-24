# [IBM PC/XT](https://en.wikipedia.org/wiki/IBM_Personal_Computer_XT) - MIST port

24/09/22 MIST port by Somhic from original MiSTer PCXT core  https://github.com/spark2k06/PCXT_MiSTer

### STATUS

* Open OSD with F12 key. Go to Video and change to MDA ouput . Then Load ROMs and Reset.
* CGA not implemented due to lack of BRAM in this board.
* **UART port is required to be used to load the OS through the serdrive app.**


**Bugs**:

* With original IBM ROM  keyboard might not work very well.

* Serdrive works at 460.8 K or 230.4K but not 115.2K

  

### Compile the project in Quartus:

Project already has the Demistify firmware already generated so if you have cloned recursively then you can open the project with Quartus:

```sh
git clone  --recursive https://github.com/somhi/PCXT_DeMiSTify

#Load project in Quartus from /mist/PCXT_mist.qpf
```



