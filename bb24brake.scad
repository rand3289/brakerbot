// Breaker Bot 2024 toandrey(at)yahoo(dot)com
include <BOSL2/std.scad>
include <BOSL2/gears.scad>
use <misc.scad>

rp_pitch = 4; // rack and pinion pitch
disk_spacing = 45;
thick = 5;


module bbeam(len){ // private
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


module brake() { // public
    bbeam(disk_spacing+26);
    t(0,0,20.8) r(180,0,0) bbeam(disk_spacing);
    t(0,0,10.4) r(90,0,0) spur_gear(pitch=rp_pitch, teeth=10, thickness=thick);
}


brake();
// create a panel that the brake will attach to
color("green") union(){
    t(0,9+thick/2,-3) b(disk_spacing+20,18,16);
    t(0,2+thick/2,8+7) b(16,4,22);
}
