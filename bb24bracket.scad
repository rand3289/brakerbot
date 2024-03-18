include <BOSL2/std.scad> // tube()
include <bb24const.scad>

beam_id = bearing_od + 2*round_wall_thick + 2*hole_tolerance;
beam_od = beam_id+2*round_wall_thick;

module beam(){
    color("purple") union(){
        translate([-16,0,8]) rotate([0,90,0])
            tube(h=16,od=beam_od,id=beam_id,center=false);
        translate([-16,-(bl+bl+13+16),4]) cube([16,bl+16+bl,8]);
        translate([-16,-(bl+16+bl+26),8]) rotate([0,90,0])
            tube(h=16,od=beam_od,id=beam_id,center=false);
    }
}


// connector between the brackets
module bracket_connector(){
translate([-16,-83,4]) 
difference() {
    union(){
        translate([0,1,0])  cube([fw+1+2*16,14,8]);
        translate([16,0,0]) cube([fw+1,16,8]);
//        translate([30,12,0.5]) rotate([180,0,0]) color("red") text("part1");
    }
    translate([-1,8,4]) rotate([0,90,0]) cylinder(fw*2,2,2); // screw hole
}
} // bracket_connector()


// In theory brackets should be functions of fw (frame width) and fl (frame length)
module bracket(){
    difference(){
        union(){
            translate([0,-75,8]) rotate([0,-90,0]) scale([0.5,1.5]) cylinder(d=25,h=16);
            beam(); // lower bracket
        }
        translate([-17,-(bl+28.1),3.9]) cube([18,14.2,8.2]);
    }
} // bracket()
