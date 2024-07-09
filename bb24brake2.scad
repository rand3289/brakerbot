// Breaker Bot 2024 toandrey(at)yahoo(dot)com
include <BOSL2/std.scad>
include <BOSL2/gears.scad>
use <misc.scad>

$fn=32;
rp_pitch = 4; // rack and pinion pitch
disk_spacing = 52;
thick = 5;


module brake_arm(len){ // private
    union(){
        difference(){
            b(len,thick, 10);
            t(0,0,2.1) b(21,thick+1,6);
        }
        t(0,0,3.5) rack(pitch=rp_pitch, teeth=6, thickness=thick);
        t(5-len/2, 0,10) b(10,thick,11);
        t(len/2-5, 0,10) b(10,thick,11);
    }
}


module brake_internals() { // public
    brake_arm(disk_spacing+26);
    t(0,0,20.8) r(180,0,0) brake_arm(disk_spacing);
    t(0,0,10.4) r(90,0,0) spur_gear(pitch=rp_pitch, teeth=10, thickness=thick);
}


module brake_body(){ // public
    difference(){
        t(0,0,10.4) b(32,thick+8,39);
        t(0,0,10.4) b(34,thick+0.2,31);
    }
}


module servo(){
    union(){
        b(20,46,31); // standard servo footprint
        t(0,14,17) c(8,4); // shaft
    }
}


brake_body();
color("red") brake_internals();
// axle marker
// color("green") t(0,0,10.4) r(90,0,0) c(20,4.2);

// a place where the brake will attach to
%t(0,8.1+thick/2,-5) b(disk_spacing+20,16,8);

color("yellow") t(0, 11, 25) b(32, 8.5, 56);
t(0, 22.25, 24.5) r(90,180,0) servo();
