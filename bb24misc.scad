// Breaker Bot 2024 toandrey(at)yahoo(dot)com
include <BOSL2/std.scad>
include <BOSL2/gears.scad>
include <bb24const.scad>


// round shaft with a square end
module shaft(length){ // public
    eh = 10; // square end height
    union(){
        translate([0,0,length+eh/2]) cube([shaft_square,shaft_square,eh],true);
        cylinder(length,d=shaft_round);
    }
}


// differential gear with a square shaft hole
module dgear(){ // public
    gteeth=20;
    difference(){
        union(){
            translate([0,0,1.3]) bevel_gear(teeth=gteeth, mate_teeth=gteeth, mod=1.5, cutter_radius=0, spiral=0, shaft_diam=1);
            translate([0,0,-disk_h]) cylinder(disk_h, d=disk_id);
        } // I don't know why the gear is 1.4 below z=0
        shaft_hole = shaft_square + radius_tolerance*2;
        translate([0,0,-5]) cube([shaft_hole,shaft_hole,25], center=true);
    }
}


// two 608 bearings and a tube (spacer) pushing them apart on an imaginary axle
module bearing_assembly(){ // public
    union(){ // it's easier to treat it as one piece but it's not
        color([0,0.9,0]) translate([0,0,0])    tube(h=7, od=bearing_od, id=8, center=false); // bearing
        color([0,0,0])   translate([0,0,7])    tube(h=16,od=12, id=8, center=false); // spacer
        color([0,0.9,0]) translate([0,0,7+16]) tube(h=7, od=bearing_od, id=8, center=false); // bearing
    }
}



dgear();
if($preview){ // shaft and bearing assembly are here for preview only
    translate([50,0,0]) shaft(20);
    translate ([-50,0,0]) bearing_assembly();
} else { // render these for 3D printing
    supd = disk_id+2.4;
    translate([0,0,-1.25]) tube(h=disk_h, od=supd, id=supd-0.6, center = false); // add gear's 3D print supports

    translate([40,0,0])    tube(h=16, od=12, id=8, center=false); // spacer between bearings
}
