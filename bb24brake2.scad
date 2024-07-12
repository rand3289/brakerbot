// Breaker Bot 2024 toandrey(at)yahoo(dot)com
// designed to be 3D printed with 0.3mm layer height
include <BOSL2/std.scad>
include <BOSL2/gears.scad>
use <misc.scad>
// use <bb24brake.scad> // for servo() and brake_internals()

$fn=32;


/* This is the old design

// a place where the brake will attach to
%t(0,8.1+thick/2,-5.1) b(disk_spacing+20,16,8);

difference(){
    union(){
        brake_body();
        t(0, 11, 25) b(32, 8.5, 56);    // servo collar
    }
    t(0, 10, 10.4) r(90,0,0) c(20, 13.1); // servo hole
    t(0,14.24,24.5) b(20, 15, 41); // standard servo body hole
}
t(0, 19.25, 25) r(90,0,0) sq_tube(32, 56, 4, 0.3); // support
t(0, 19.25, 24.5) r(90,0,0) sq_tube(20.6, 41.6, 4, 0.3); // support
t(0,13,10.4) r(90,0,0) tube(h=14, od=13.6,id=13);   // support

//color("red") brake_internals();
%t(0, 24.7, 24.5) r(90,180,0) servo();
//color("green") t(0,0,10.4) r(90,0,0) c(20,4.2); // axle marker
*/


module brake_block(){ // public
    difference(){
        t(1.3,0,0)     b(25, 28, 66);
        t(7.4, 0, -14) b(5.2, 34, 31);  // brake arm hole
        t(-16.7, 0, 0) b(36, 20.4, 41); // servo hole
        t(-20.2, 0, 0) b(36, 20.4, 56); // servo rim
        t(8.8, 0, 20)  b(15, 34, 30);   // corner cutout
        // holes are printed with a 0.3mm membrane on the bottom as print supports
        t(3.35, 0, -14)   r(0,90,0) c(3.5, 13); // servo shaft hole
        t(2.1, 5, 24.5)   r(0,90,0) c(8, 4.1);
        t(2.1,-5, 24.5)   r(0,90,0) c(8, 4.1);
        t(2.1, 5, -24.5)  r(0,90,0) c(8, 4.1);
        t(2.1,-5, -24.5)  r(0,90,0) c(8, 4.1);
        t(3.81, 5, -24.5) r(0,90,0) c(2, 8); // screw cap holes
        t(3.81,-5, -24.5) r(0,90,0) c(2, 8);
        t(12.3, 5, -24.5) r(0,90,0) c(4, 8); // top holes
        t(12.3,-5, -24.5) r(0,90,0) c(4, 8);
        t(-1.15, 0, 23.99)  b(1.5,1.5,7); // notches between screws
        t(-1.15, 0, -23.99) b(1.5,1.5,7);
    }
} // brake_block

brake_block();
