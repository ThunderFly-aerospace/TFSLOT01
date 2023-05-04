//@set_slicing_config(../../slicing/default.ini)
use<../tfslot_888_1001.scad>

$fn=50;
for (x=[0:5], y=[0:3])
    translate([x*25, y*40, 0]) rotate([0, -90, 0]) tfslot_888_1003();
