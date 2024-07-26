// Breaker Bot 2024 toandrey(at)yahoo(dot)com
//
// Test a single leg by putting the "beam" hoops for the other leg onto a vertical pole.  Allowing the leg to jump.
//
// TODO: add tolerances to all holes
// TODO: will the gears fit within "fw" parameter - measure gear width
// TODO: how do we put the hip and thigh onto the 12mm axels during assembly?
// TODO: how to attach the brakes

include <bb24const.scad>
use <misc.scad>
use <bb24bracket.scad>
use <bb24frame.scad>
use <bb24leg.scad>
use <bb24misc.scad>
use <bb24brake.scad>
use <bb24brake2.scad>


// operator module "TranslateRotate" to place a component on the x-y plane
module tr(x, y, az){
    translate([x,y,8]) rotate([0,90,az]) children();
}


if ($preview && false) { // do not show this stuff during rendering
    // These are a bunch of gears, disks, shafts and bearing for visualization
    tr(12.5,0,0)  dgear();
    tr(41,0,180)  dgear();
    tr(27,20,-90) dgear();

    tr(27,69,90)   dgear();
    tr(27,100,-90) dgear();
    tr(46,85,180)  dgear();

    tr(11,0,0)    tube(h=disk_h, od=disk_od, id=disk_id); // disks
    tr(43,0,0)    tube(h=disk_h, od=disk_od, id=disk_id);
    tr(27,67,90)  tube(h=disk_h, od=disk_od, id=disk_id);
    tr(27,102,90) tube(h=disk_h, od=disk_od, id=disk_id);

    tr(-24,0,0) bearing_assembly();
    tr(-24,0,0) color("yellow") shaft(34);
} // if($preview)

/*
if($preview) { // F5 = preview, F6 = render
    t(27, -100, 8)  r(0,90,0) bracket_connector();
} else { // separate parts for printing when rendered
    t(27, -100, 24) r(0,90,0) bracket_connector();
}
t(-9, -100, 8) r(0,90,0) bracket();
t(63, -100, 8) r(0,90,0) bracket();
*/

frame_wbrake();
if(!$preview){ // when rendering add print supports for hollow_shaft() in frame()
    t(27, 108, 0) sq_tube(6, 2, 3, 0.3);
    t(27,  64, 0) sq_tube(6, 2, 3, 0.3);
}


t(-22, 88, 40) r(90,0,90) brake_install() t(0, 10.6, -80) r(90,-90,0) thigh();
t(3, 86, -22)   r(180,0,0) hip_w_brake();
t(-120, 86, -6) pushrod();
t(-241, 86, 20) r(-90,0,0) shin();
t(-170, 86, 8)  r(90,0,0)  peg();
