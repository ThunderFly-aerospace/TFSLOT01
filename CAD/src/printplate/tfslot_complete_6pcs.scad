//@set_slicing_config(../../slicing/default.ini)
use<../tfslot_888_1001.scad>

for(x = [0:1], y=[0:2]) translate([x*47, y*45, 0])
{
translate([0, 0, 40]) rotate([0, 90, 0]) tfslot_888_1001(one_part=true, plastfast_screw = 20, cap_hole = 1);


translate([-8, 0, 40]) rotate([0, 90, 0]) tfslot_888_1002();
translate([-8, 0, 40]) rotate([0, 90, 0]) tfslot_888_1002_support();
}