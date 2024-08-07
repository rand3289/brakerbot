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


module servo(){ // public
    union(){
        b(20,41,36); // standard servo body
        t(0,0,8.25) b(20, 53.75, 2.5); // rim
        t(0,14,19.8) c(3.5,12.9);
        t(0,14,21.5) c(7,5.65); // shaft 7mm above top
    }
}


module brake_install(){ // public
  difference(){
    union(){
        children();
        t(0, 10.6, -35) b(28, 16, 64);
        difference(){
            t(0,0,10.4) b(16,thick+8,39); // arm part
            t(0,0,10.4) b(18,thick+0.2,31); // arm hole
        }
        t(0, 18.5, 15.4) r(90,0,0) sq_tube(16, 29, 12, 0.3); // print support
        t(0,6.5,9.5) r(-90,0,0) tube(h=24,id=8,od=8.6, center=true); // axle hole print support
    }
    t(0,10,-37.2) b(20.4,18,41.4);
    t(0,3.1,-37.2) b(20.4,10,55);
    t(0,-0.3,9.5) r(-90,0,0) c(15,8); // axle hole
    // holes for mounting servos
    t( 5, 14, -61.5) r(90,0,0) c(18, 4.1);
    t(-5, 14, -61.5) r(90,0,0) c(18, 4.1);
    t( 5, 14, -14)   r(90,0,0) c(18, 4.1);
    t(-5, 14, -14)   r(90,0,0) c(18, 4.1);
  }
}


/*
brake_internals();
t(0,15,-37) r(-90,180,180) servo();
color("green") t(0,0,10.4) r(90,0,0) c(20,4.2); // axle marker
sg_teeth=18;
t(0,-9.2,-24) r(90,180/sg_teeth,0) spur_gear(pitch=rp_pitch, teeth=sg_teeth, thickness=thick); // gear on the servo
t(0,-9.2,10.4) r(90,0,0) spur_gear(pitch=rp_pitch, teeth=36, thickness=thick); // gear on top of brake
*/

brake_install() 
{
        t(0,8.1+thick/2,0) b(70,16,8);
        t(0,8.1+thick/2,-44) b(16,16,80);
}

// TODO: add holes in gears
// TODO: make sure both brakes mash up together on axle