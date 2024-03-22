// Breaker Bot 2024 toandrey(at)yahoo(dot)com
//
// TODO: test a single leg by putting the "beam" hoops for the other leg onto some vertical pole
// TODO: will the gears fit within "fw" parameter - measure gear width
// TODO: add tolerances to all holes
// TODO: gears with a disk on the bottom have about 1.5mm overhang and will not print as is. Add support

include <BOSL2/std.scad>
include <BOSL2/gears.scad>
include <bb24const.scad>
use <misc.scad>
use <bb24bracket.scad>
use <bb24frame.scad>


// operator module "TranslateRotate" to place a component on the x-y plane
module tr(x, y, az, rotate_forward=false, z=8){
    ay = rotate_forward ? 90 : 0;
    translate([x,y,z]) rotate([0,ay,az]) children();
}


module disk(x,y,az){
    tr(x,y,az,true)  tube(h=disk_h, od=disk_od, id=disk_id);
}


// round shaft with a square end
module shaft(x, y, az, length){
    eh = 10; // square end height
    color("yellow")  tr(x,y,az,true)  union(){
        translate([0,0,length+eh/2]) cube([shaft_square,shaft_square,eh],true);
        cylinder(h=length,d=shaft_round,center=false);
    }
}


// differential gear with a square shaft hole
module dgear(x,y,az){
    gteeth=20;
    tr(x,y,az,true)  difference(){
        union(){
            translate([0,0,1.3]) bevel_gear(teeth=gteeth, mate_teeth=gteeth, mod=1.5, cutter_radius=0, spiral=0, shaft_diam=1);
            translate([0,0,-disk_h]) cylinder(h=disk_h, d=disk_id, center=false);
        } // I don't know why the gear is 1.4 below z=0
        translate([0,0,-5]) cube([shaft_square,shaft_square,20], center=true);
    }
}


// two 608 bearings and a tube (spacer) pushing them apart on an imaginary axle
module bearing_assembly(x,y,az){
    tr(x,y,az,true)  union(){ // it's easier to treat it as one piece but it's not
        color([0,0.9,0]) translate([0,0,0])    tube(h=7, od=bearing_od, id=8, center=false); // bearing
        color([0,0,0])   translate([0,0,7])    tube(h=16,od=12, id=8, center=false); // spacer
        color([0,0.9,0]) translate([0,0,7+16]) tube(h=7, od=bearing_od, id=8, center=false); // bearing
    }
}


if ($preview) { // do not show this stuff during rendering
    // These are a bunch of gears, disks, shafts and bearing for visualization
    dgear(12.5,0,0);
    dgear(41,0,180);
    dgear(27,20,-90);

    dgear(27,69,90);
    dgear(27,100,-90);
    dgear(46,85,180);

    disk(11,0,0);
    disk(43,0,0);
    disk(27,67,90);
    disk(27,102,90);

    bearing_assembly(-24,0,0);
    shaft(-24,0,0,34);
} // if($preview)


if($preview) { // F5 = preview, F6 = render
    bracket_connector();
} else { // separate parts for printing when rendered
    translate([0,0,20]) bracket_connector();
}
bracket();
translate([fw+16+1,0,0]) bracket();


frame(); // main frame of the robot
if(!$preview){ // when rendering add print supports for hollow_shaft() in frame()
    translate([27,108,0]) sq_tube(6, 2, 3, 0.3);
    translate([27,64,0]) sq_tube(6, 2, 3, 0.3);
}
