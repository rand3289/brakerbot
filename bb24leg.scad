// Breaker Bot 2024 toandrey(at)yahoo(dot)com
include <bb24const.scad>
use <misc.scad>

knee_offset = 40;
thigh_len = 150;


/////////////////////// public modules ///////////////////////

module shin(){ // public
    difference(){
        union(){
            cube([thigh_len,16,8]);
            translate([-8,8,0]) cube([16,16,8]);
            translate([knee_offset,8,0]) cube([16,32,8]);

            translate([0,8,0]) cylinder(8,8,8);
            translate([thigh_len,8,0]) cylinder(8,8,8);
            translate([0,24,0]) cylinder(8,8,8);
            translate([knee_offset+8,40,0]) cylinder(8,8,8);
        }
        translate([0,24,-1]) cylinder(10,4,4);
        translate([knee_offset+8,40,-1]) cylinder(10,4,4);
        translate([thigh_len,8,-1]) cylinder(10,4,4);
    }
}


module thigh(){ // public
    difference(){
        union(){
            cube([thigh_len, 16,16]);
            translate([thigh_len, 8-fw/2, 0]) cube([fl/2+8,fw,16]);
        }
        translate([thigh_len+8, 12-fw/2, -1]) cube([fl/2+8,fw-8,18]);
        translate([-1,4,-1]) cube([19,8,18]);
        translate([8,17,8]) flipx() cylinder(20,4,4);
        translate([thigh_len+fl/2,fw/2+14,8]) flipx() cylinder(fw+12,6,6);
    }
}


module hip(){ // public
    difference(){
        union(){
            translate([0,0,0]) cube([fl/2+8,fw,16]);
        }
        translate([8,4,-1]) cube([fl/2+8,fw-8,18]);
        translate([fl/2,-1,8]) rotate([-90,0,0]) cylinder(fw+12,6,6);
    }
    difference(){
        translate([-4,fw/2-4,0]) cube([16, 8, 32]);
        translate([4,0,24]) rotate([-90,0,0]) cylinder(fw,4,4);
    }
}


module pushrod(){ // public
    len = thigh_len+knee_offset-16;
    difference(){
        union(){
            cube([len,8,12]);
            translate([-16,-4,0]) cube([20,16,12]);
            translate([len-4,-4,0]) cube([20,16,12]);
        }
        translate([-20,0,-1]) cube([20,8,14]);
        translate([len,0,-1]) cube([20,8,14]);
        translate([-8,-8,6]) rotate([-90,0,0]) %cylinder(24,4,4);
        translate([len+8,-8,6]) rotate([-90,0,0]) %cylinder(24,4,4);
    }
}


translate([-16,12,8]) flipy() flipx() shin();
thigh();
translate([200,-20, 30]) hip();
translate([0,4, 48]) pushrod();
