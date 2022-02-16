include <../parameters.scad>

global_clearance = 0.1;

use <lib/stdlib/curvedPipe/curvedPipe.scad>
use <lib/stdlib/naca4.scad>
use <lib/stdlib/bolts.scad>

$fn = 200;

type = "naca"; // "naca" or "cylinder"
//type = "cylinder";
width = 35;

pipe_d = 2;

// for NACA type
naca = 0035;
distance = 19;
length = 40;
profile_thickness = surface_distance(x = 0.25, naca = naca)*length;

sensor_rantl = 3;
sensor_pos = [9.5, distance/2 + sensor_rantl, width/2];
sensor_nose_distance = 4.3;
sensor_nose_hole_depth = 2.5;
sensor_nose_hole_diameter = 3.5;
sensor_sealing_nose_diameter = 1.5;
sensor_sealing_nose_length = 2;



// Krabicka na PCB

pcb_width = 15.2;
pcb_offset = 0;
pcb_length = 36;
pcb_sensor_from_top = 5;
pcb_thickness = 3.5;
pcb_thickness_sensor = 3.4;
pcb_thickness_conn = 6;

pipe1_pos = [type=="naca"? 3: stage1_len/2, 0, width/2];
pipe2_pos = [type=="naca"?length*0.3 : stage2_pos+stage2_len/2, 0, width/2];

// PCB cap
cap_head_overlay = 3;
rail_x = 4.5;
rail_h = rail_x/2-0.1;
bolt_size = 3;
bolt_len = 10;
bolt_z = 15 - head_height(bolt_size); // top of cap - head_height

module pipes()
{
    // Cabling
    //mid_body_horizontal = (R03_wide_D/2 + R03_narrow_D/2) / 2;
    //mid_body_vertical = wide_body_length + exhaust_length + R03_narrow_D/2;
    //PCB_y = -R03_wide_D/2 - R03_wall_thickness - R03_PCB_elevation;
    //PCB_z = R03_venturi_tube_height - R03_PCB_height*1.1 - 5;
    //pipe_elevation = PCB_z - slip_ring_z;
    //d = (R03_wide_D + 2*R03_wall_thickness)/2 - R03_narrow_D/2 - R03_wall_thickness;
    //cbl_x = 0;

width = 30;
distance = 50;

h = width/2;
d = 3;

echo("NACA");
 th = surface_distance(x = 0.25, naca = naca)*60;
 echo(th);
 cube(50/2-th);

curvedPipe([[10, distance/2, h],
            [100,0, h],
            [100,100, h],
            [100, 100, h],
            [100, 00, h]
		   ],
            4,
			[10, 10, 20, 20],
		    d, 0);

}
//pipes();


//  Hlavni cast TFSLOTU
//
//  width_param = sirka sterbiny TFSLOTU
//  one_part = ... tohle je nejaky historicky pozustatek? Ale aktualne to zapina drazku na vicko
// plastfast_screw = Vicko pripevnit samoreznym sroubem; hodnota je vzdalenost od sebe
// cap_hole = tohle je zarez na vicko, zkoseni hran. Odebrani nabezne hrany

module tfslot_888_1001(width_param = width, one_part=false, plastfast_screw = 0, cap_hole = 0){

width = width_param;

translate([0, -width/2, 0]) rotate([-90, 0, 0]) difference(){


// Horni profil
    union(){
        
        translate([length-2, -distance/2, 0]) cube([2, 0.1, width]);
        translate([length-2, distance/2, 0]) cube([2, 0.1, width]);
        
        translate([0, -distance/2, 0])
            airfoil(naca = naca, L = length, N = 100, h= width, open = false);
        
        intersection(){
            translate([0, -distance/2, 0])
                airfoil(naca = 0015, L = length, N = 100, h= width, open = false);
            translate([0,-distance/2, 0])
                cube([length, distance, width]);
        }
        
// Bocni steny
        translate([0, -distance/2, 0])
            cube([length, distance, 2]);
        translate([0, -distance/2, width-2])
            cube([length, distance, 2]);

    // Spodni profil (profil se senzorem)
    difference(){
        union(){
            intersection(){
                hull(){
                    translate([0, distance/2, 0])
                        airfoil(naca = naca, L = length, N = 100, h= width, open = false);
                    translate([0, distance/2+3, 0])
                        airfoil(naca = naca, L = length, N = 100, h= width, open = false);
                }
                union(){
                    translate([0, -distance/2, 0])
                        cube([length, distance, width]);
                    translate()
                        cube([3, distance-3, width]);
                }
            }

            // schod pro PCB
            hull(){
                translate([-15/2 + sensor_pos[0], distance/2, 0])
                    cube([15, sensor_rantl, width]);
                translate([-15/2 + sensor_pos[0], distance/2-0.1, 0])
                    cube([25, 0.1, width]);
            }

            // Krabicka na PCB
            union(){
                translate([sensor_pos[0] - pcb_sensor_from_top - 0.5, distance/2, 0])
                    cube([pcb_length, sensor_rantl + pcb_thickness,
                          width/2 - pcb_width/2 - pcb_offset]);
                translate([sensor_pos[0] - pcb_sensor_from_top - 0.5, distance/2,
                           width/2 + pcb_width/2 - pcb_offset])
                    cube([pcb_length, sensor_rantl + pcb_thickness,
                              width/2 - pcb_width/2 + pcb_offset]);
                translate([sensor_pos[0] - pcb_sensor_from_top - 2.5, distance/2, 0])
                    cube([2, sensor_rantl + pcb_thickness, width]);
            }
        }

        h = width/2;

        // trubicky pro tlak
        union(){
            if(!$preview)
            curvedPipe([
                    sensor_pos + [sensor_nose_distance/2,
                                  -sensor_nose_hole_depth-sensor_sealing_nose_length+0.1, 0],
                    sensor_pos + [sensor_nose_distance/2, -5, 0],
        			pipe2_pos  + [0, distance/2-6, 0],
        			pipe2_pos + [0, 0, 0]
                ],
                3,
    			[4, 4, 2, 2],
    		    pipe_d, 0
            );

            if(!$preview)
            curvedPipe([
                    sensor_pos + [-sensor_nose_distance/2,
                                  -sensor_nose_hole_depth-sensor_sealing_nose_length+0.1, 0],
                    sensor_pos + [-sensor_nose_distance/2, -7, 0],
        			pipe1_pos + [0, distance/2-4, 0],
        			pipe1_pos + [0, 0, 0],

                ],
                3,
    			[3, 2, 1, 2],
    		    pipe_d, 0
            );
            
            // Vyusteni trubicky do PCB
            for(x = [0.5, -0.5])
            translate(sensor_pos + [sensor_nose_distance*x, 0, 0])
                rotate([90, 0, 0]){
                    cylinder(d = sensor_nose_hole_diameter, h= sensor_nose_hole_depth,
                             center=true, $fn = 15);
                    translate([0, 0, sensor_nose_hole_depth/2-.01])
                        cylinder(d2 = sensor_sealing_nose_diameter, d1 = sensor_nose_hole_diameter,
                                 h= sensor_nose_hole_depth/2, $fn = 15);
                    translate([0, 0, sensor_nose_hole_depth])
                        cylinder(d2 = pipe_d, d1 = sensor_sealing_nose_diameter,
                                 h= sensor_sealing_nose_length, $fn = 15);
                }

            }
        }
    }
    
    
    if(plastfast_screw){
        translate([length/4, distance/2-5, width/2-plastfast_screw/2])
            rotate([-90, 0, 0])
                cylinder(d=PLASTFAST_diameter, h=30, $fn=14);
        translate([length/4, distance/2-5, width/2+plastfast_screw/2])
            rotate([-90, 0, 0])
                cylinder(d=PLASTFAST_diameter, h=30, $fn=14);
    }

    if(cap_hole) {
        union(){
            // Rails
            for(y = [rail_h, width - rail_h])
                translate([length/2 + 0.01, distance/2 + sensor_rantl + pcb_thickness , y])
                    cube([length, rail_x, rail_x], center=true);
            
            for(y = [rail_h, width - rail_h])
                translate([3, distance/2 , y - rail_x/2])
                    rotate([0, 0, 45]) cube([10, rail_x, rail_x]);
            
            translate([0, distance/2 + sensor_rantl + 2, width/2])
                rotate([0, 0, 45]) cube([10, rail_x, width], center=true);
                    
            // Lid front cut-out
            translate([0, distance/2 + sensor_rantl - 3, -0.01])
                cube([cap_head_overlay + 0.01, sensor_rantl + pcb_thickness + 0.01, width + 0.02]);
        }
    }
    }
}

difference(){

tfslot_888_1001(one_part=true, plastfast_screw = 20, cap_hole = 1);

translate([0, 110, 0])
    cube(200, center=true);
}


module tfslot_888_1002(bolts=true, plastfast_screw = 20)
translate([0, -width/2, 0]) rotate([-90, 0, 0]) {
    difference(){
        translate([0, distance/2 , 0])
            union(){
                difference(){
                    hull(){
                        //airfoil(naca = naca, L = length, N = 100, h= width, open = false);
                        airfoil(naca = 0047, L = length, N = 100, h= width, open = false);
                        translate([length-5, 0, 0]) cube([5, 7, width]);
                        
                        //#translate([3+2, 2, 0]) cylinder(d=6, h= width);
                    }
                    // Bottom cut-out
                    difference(){
                        translate([cap_head_overlay - 0.4, -length + 6.6, rail_h*2])
                            cube([length, length, width-rail_h*4]);
                        translate([cap_head_overlay, 7.3, width/2])
                           rotate([0, 0, 45]) cube([10, 3, width-rail_h*4], center=true);
                    }
                    difference(){
                        translate([cap_head_overlay - 0.4, -length + 4.4, -0.5])
                            cube([length, length, width+1]);
                        translate([2, 6.5, width/2])
                           rotate([0, 0, 45]) cube([10, 10, width], center=true);
                    }
                    // spodni orez predniho rantlu
                    translate([0, -10+0.1, -0.5])
                        cube([length, 10, width+1]);
                    
                    
                    
    if(plastfast_screw){
        translate([length/4, distance/2-5, width/2-plastfast_screw/2])
            rotate([-90, 0, 0])
                cylinder(d=PLASTFAST_diameter, h=30, $fn=14);
        translate([length/4, distance/2-5, width/2+plastfast_screw/2])
            rotate([-90, 0, 0])
                cylinder(d=PLASTFAST_diameter, h=30, $fn=14);
        
        translate([length/4, distance/2-2, width/2-plastfast_screw/2])
            rotate([-90, 0, 0])
                cylinder(d1=PLASTFAST_head_diameter, d2=PLASTFAST_head_diameter, h=5, $fn=28);
        translate([length/4, distance/2-2, width/2+plastfast_screw/2])
            rotate([-90, 0, 0])
                cylinder(d1=PLASTFAST_head_diameter, d2=PLASTFAST_head_diameter, h=5, $fn=28);
    }

            }
    }
}
}

module tfslot_888_1002_support(){
    step = 3;
    
    translate([40, -width/2, -distance/2-5]) rotate([0, -90, 0]) cylinder(d=8, h=0.2);
    translate([40, width/2, -distance/2-5]) rotate([0, -90, 0]) cylinder(d=8, h=0.2); 
    //translate([step, -width/2, -12]) cube([length-step, width, 3]);
}


difference(){
translate([0, 0, 0]) 
    tfslot_888_1002();
translate([0, 110, 0])
    cube(200, center=true);
}

tfslot_888_1002_support();



// calibration tool
module tfslot_888_1003(){

difference(){
    
    translate([-1, 0, 0]) cube([2, width, distance+2], center=true);
    translate([0, 0, -6]) rotate([0, 90, 0]) cylinder(d=1, h=10, center=true);
    translate([0, 0, 6]) rotate([0, 90, 0]) cylinder(d=1, h=10, center=true);
    }
    //translate([1, 0, 0]) cube([6, width, 8], center=true);
    
    hull(){
        translate([4, 0, 2.4]) rotate([90, 0, 0]) cylinder(d=3, h=width-5, center=true);
        translate([-1, 0, 5]) rotate([90, 0, 0]) cylinder(d=1, h=width-5, center=true);
        translate([-1, 0, -5]) rotate([90, 0, 0]) cylinder(d=1, h=width-5, center=true);
        translate([4, 0, -2.4]) rotate([90, 0, 0]) cylinder(d=3, h=width-5, center=true);
        
    }

}
color("green") tfslot_888_1003();