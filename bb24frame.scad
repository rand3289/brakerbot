// Breaker Bot 2024 toandrey(at)yahoo(dot)com
include <BOSL2/std.scad> // tube()
include <bb24const.scad>
include <misc.scad>


// bearing block for 2 bearings and a shaft through it
module bearing_block(x, y, az, second_hole = true){ // static
    full_arch = false;
    height = full_arch ? 24 : 16;
    translate([x,y,8]) rotate([0,-90,az]) difference() {
        intersection() {
            difference(){
                cylinder(34, d=(bearing_od+2*pipe_wall_thick)); // outer cylinder
                translate([0,0,2]) cylinder(30, d=bearing_od+2*hole_tolerance);
            }
            translate([-8,-15,-1]) cube([height, 30, 36], false); // cutoff part of cylinder
        }
        shaft_height = second_hole? 36 : 10;
        translate([0,0,-1]) cylinder(shaft_height,d=9); // shaft hole
    }
}


// Make a hole and then add a bearing_block()
module bearing_block_install(x, y, az, second_hole=true){ // static
    union(){
        difference(){
            union(){ children(); }
            translate([x,y,8]) rotate([0,-90,az]) cylinder(34, d=23);
        }
        bearing_block(x,y,az,second_hole);
    }
}


module cframe(x,y,az,width = 54){ // C shaped frame // static
    length = 56;
    // unlike other pieces frame is not translated 8 up
    color([1,0,0])  translate([x,y,0])  rotate([0,0,az])  difference(){
        cube([width, length, 16]);
        translate([8,-1,-1]) cube([width-16, length-7, 18]);
    }
}


module hollow_shaft(x,y,az){ // static
    translate([x,y,8]) rotate([0,90,az]) tube(h=8, od=12, id=shaft_round+1);
}


module frame(){ // public
difference(){
    bearing_block_install(8,0,0,false)
    bearing_block_install(46,0,180)
    bearing_block_install(fw/2,57,90) // shared
    bearing_block_install(fw/2,115,-90,false)
    bearing_block_install(49,86,180,false)
    union(){
        translate([fw/2,  0, 0]) sq_tube(fw,fl,16,8);
        cframe(fw/2,123,-90,74);
        hollow_shaft(fw/2,61,-90);
        hollow_shaft(fw/2,111,-90);

        // angle for stiffness
        alen=90;
        translate([53,22,0]) rotate([0,0,53]) difference(){
            cube([alen,alen,16]);
            translate([-4,4,-1]) cube([alen,alen,18]);
        }
    }
    // holes for attaching brakes
    translate([23,-(fl/2-4),-1]) cylinder(h=18,d=3,center=false);
    translate([31,-(fl/2-4),-1]) cylinder(h=18,d=3,center=false);
    translate([27,-(fl/2-10),8]) rotate([90,0,0]) cylinder(h=12,d=3,center=false);
} // difference()
} // frame()
