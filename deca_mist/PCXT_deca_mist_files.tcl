set_global_assignment -name QIP_FILE ../files.qip
set_global_assignment -name QIP_FILE ../mist-modules/mist.qip
set_global_assignment -name QIP_FILE ../DeMiSTify/controller/controller.qip
set_global_assignment -name VHDL_FILE ../demistify_config_pkg.vhd
set_global_assignment -name VHDL_FILE ../firmware/controller_rom1_byte.vhd
set_global_assignment -name VHDL_FILE ../firmware/controller_rom2_byte.vhd
set_global_assignment -name PRE_FLOW_SCRIPT_FILE quartus_sh:../build_id.tcl
