//@set_slicing_config(../../slicing/default.ini)
use<../tfslot_888_1001.scad>

translate([10, 0, 0])
rotate([0, 90, 0]) tfslot_888_1001(one_part=true, plastfast_screw = 20, cap_hole = 1);

rotate([0, 90, 0]) tfslot_888_1002();
//rotate([0, 90, 0]) tfslot_888_1002_support();
