// Breaker Bot 2024 toandrey(at)yahoo(dot)com
include <BOSL2/std.scad> // tube()
include <bb24const.scad>
use <misc.scad>
use <bb24brake2.scad>


// bearing block for 2 bearings and a shaft through it
module bearing_block(second_hole = true){ // private
    shaft_height = second_hole ? 36 : 10;
    full_arch = false;
    height = full_arch ? 24 : 16;

    difference() {
        intersection() {
            cylinder(34, d=(bearing_od+2*pipe_wall_thick)); // outer cylinder
            translate([-8,-15,-1]) cube([height, 30, 36], false); // cutoff part of cylinder
        }
        translate([0,0,2]) cylinder(30, d=bearing_od+2*radius_tolerance);
        translate([0,0,-1]) cylinder(shaft_height, d=9); // shaft hole
    }
}


// Make a hole and then add a bearing_block()
module bearing_block_install(x, y, az, second_hole=true){ // private
    union(){
        difference(){
            children();
            translate([x,y,8]) rotate([0,-90,az]) cylinder(34, d=23);
        }
        translate([x,y,8]) rotate([0,-90,az]) bearing_block(second_hole);
    }
}


// C shaped frame
module cframe(){ // private
    width = 74;
    length = 56;
    difference(){
        cube([width, length, 16]);
        translate([8,-1,-1]) cube([width-16, length-7, 18]);
    }
}


// angle for stiffness
module angle(){ // private
    alen=90;
    difference(){
        cube([alen,alen,16]);
        translate([-4,4,-1]) cube([alen,alen,18]);
    }
}


module frame() { // private
    bearing_block_install(8,0,0,false)
    bearing_block_install(46,0,180)
    bearing_block_install(fw/2,57,90) // shared
    bearing_block_install(fw/2,115,-90,false)
    bearing_block_install(49,86,180,false)
    union(){
        translate([fw/2,  0, 0]) sq_tube(fw,fl,16,8);
        translate([fw/2,123,0]) rotate([0,0,-90]) cframe();
        translate([fw/2,61,8]) rotate([0,90,-90]) tube(h=8, od=12, id=shaft_round+1);
        translate([fw/2,111,8]) rotate([0,90,-90]) tube(h=8, od=12, id=shaft_round+1);
        translate([53,22,0]) rotate([0,0,53]) angle();
    }
}

module frame_wbrake(){ // public
    union(){ // install brake_block into frame
        difference(){
            frame(); // main frame of the robot
            t(27,-55,8) b(24,20,18); // hole for a brake_block()
        }
        t(27,-56,4.8) r(0,90,-90) brake_block();
    }
}


frame_wbrake();