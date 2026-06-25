*Custom Compiler Version V-2023.12
*Wed Mar  4 10:18:21 2026

.global gnd! vdd!
********************************************************************************
* Library          : harshit
* Cell             : schmitt_trigger
* View             : schematic
* View Search List : hspice hspiceD cmos.sch cmos_sch schematic veriloga
* View Stop List   : hspice hspiceD veriloga
********************************************************************************
.subckt schmitt_trigger vdd vin vout vss vt_bulk_n_gnd! vt_bulk_p_vdd!
xm9 net57 vout vss vt_bulk_n_gnd! n105 w=0.1u l=0.03u nf=1 m=1
xm10 vout vin net57 vt_bulk_n_gnd! n105 w=0.1u l=0.03u nf=1 m=1
xm11 net57 vin vss vt_bulk_n_gnd! n105 w=0.1u l=0.03u nf=1 m=1
xm6 net65 vin vdd vt_bulk_p_vdd! p105 w=0.1u l=0.03u nf=1 m=1
xm7 net65 vout vdd vt_bulk_p_vdd! p105 w=0.1u l=0.03u nf=1 m=1
xm8 vout vin net65 vt_bulk_p_vdd! p105 w=0.1u l=0.03u nf=1 m=1
.ends schmitt_trigger

********************************************************************************
* Library          : harshit
* Cell             : schmitt_trigger_testbench
* View             : schematic
* View Search List : hspice hspiceD cmos.sch cmos_sch schematic veriloga
* View Stop List   : hspice hspiceD veriloga
********************************************************************************
.subckt schmitt_trigger_testbench vout gnd! vdd!
xi0 net14 net7 vout gnd! gnd! vdd! schmitt_trigger
v1 net14 gnd! dc=1
v2 net7 gnd! dc=0 pulse ( 0 1.0 0 '10'n' 1n 50n 100n )
.ends schmitt_trigger_testbench


