// Breaker Bot 2024 toandrey(at)yahoo(dot)com
//
// TODO: test a single leg by putting the "beam" hoops for the other leg onto some vertical pole
// TODO: will the gears fit within "fw" parameter - measure gear width
// TODO: add tolerances to all holes
// TODO: gears with a disk on the bottom have about 1.5mm overhang and will not print as is. Add support

include <bb24const.scad>
use <misc.scad>
use <bb24bracket.scad>
use <bb24frame.scad>
use <bb24leg.scad>
use <bb24misc.scad>


// operator module "TranslateRotate" to place a component on the x-y plane
module tr(x, y, az, rotate_forward=false, z=8){
    ay = rotate_forward ? 90 : 0;
    translate([x,y,z]) rotate([0,ay,az]) children();
}


if ($preview) { // do not show this stuff during rendering
    // These are a bunch of gears, disks, shafts and bearing for visualization
    tr(12.5,0,0,true)  dgear();
    tr(41,0,180,true)  dgear();
    tr(27,20,-90,true) dgear();

    tr(27,69,90,true)   dgear();
    tr(27,100,-90,true) dgear();
    tr(46,85,180,true)  dgear();

    tr(11,0,0,true)    tube(h=disk_h, od=disk_od, id=disk_id); // disks
    tr(43,0,0,true)    tube(h=disk_h, od=disk_od, id=disk_id);
    tr(27,67,90,true)  tube(h=disk_h, od=disk_od, id=disk_id);
    tr(27,102,90,true) tube(h=disk_h, od=disk_od, id=disk_id);

    tr(-24,0,0, true) bearing_assembly();
    tr(-24,0,0, true) color("yellow") shaft(34);
} // if($preview)


if($preview) { // F5 = preview, F6 = render
    translate([-16,-83,4]) bracket_connector();
} else { // separate parts for printing when rendered
    translate([-16,-83,24]) bracket_connector();
}
bracket();
translate([fw+16+1,0,0]) bracket();


frame(); // main frame of the robot
if(!$preview){ // when rendering add print supports for hollow_shaft() in frame()
    translate([27,108,0]) sq_tube(6, 2, 3, 0.3);
    translate([27,64,0])  sq_tube(6, 2, 3, 0.3);
}


translate([-180,76,0]) color("grey") thigh();
translate([-172,80,-16]) rotate([90,0,180]) shin();
translate([-30,60,0]) hip();
translate([-210,80,18]) pushrod();
