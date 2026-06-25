*Custom Compiler Version V-2023.12
*Wed Mar  4 10:11:52 2026

.global gnd! vdd!
********************************************************************************
* Library          : harshit
* Cell             : schmitt_trigger
* View             : schematic
* View Search List : hspice hspiceD cmos.sch cmos_sch schematic veriloga
* View Stop List   : hspice hspiceD veriloga
********************************************************************************
.subckt schmitt_trigger vdd vin vout vss gnd! vdd!
xm9 net57 vout vss gnd! n105 w=0.1u l=0.03u nf=1 m=1
xm10 vout vin net57 gnd! n105 w=0.1u l=0.03u nf=1 m=1
xm11 net57 vin vss gnd! n105 w=0.1u l=0.03u nf=1 m=1
xm6 net65 vin vdd vdd! p105 w=0.1u l=0.03u nf=1 m=1
xm7 net65 vout vdd vdd! p105 w=0.1u l=0.03u nf=1 m=1
xm8 vout vin net65 vdd! p105 w=0.1u l=0.03u nf=1 m=1
.ends schmitt_trigger


