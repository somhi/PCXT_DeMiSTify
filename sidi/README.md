# [IBM PC/XT](https://en.wikipedia.org/wiki/IBM_Personal_Computer_XT) - SiDi port

07/07/22 SiDi port by @somhi from original MiSTer PCXT core   https://github.com/MiSTer-devel/PCXT_MiSTer by @spark2k06

Read the main [Readme](https://github.com/somhi/PCXT_DeMiSTify) also.

### MiST firmware

Compile the latest firmware from [mist-devel](https://github.com/mist-devel/mist-firmware) if the available binary has been built before 24/03/23.

### STATUS

* Check file defs.v to verify and check disabled options. 

* Credits screen not implemented due to lack of BRAM. F11 pauses the core (if you press it, remember to press it again to continue the core execution)
* CGA 32 kB implemented. Some Tandy games are playable like Prince of Persia, Cool Crocks and Sierra's Manhunter.


### Compile the project in Quartus:

Clone the repository recursively and open the project with Quartus:

```sh
git clone  --recursive https://github.com/somhi/PCXT_DeMiSTify

#Load project in Quartus from /sidi/PCXT_sidi.qpf
```



