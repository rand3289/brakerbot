// Breaker Bot 2024 toandrey(at)yahoo(dot)com
include <BOSL2/std.scad> // tube()
include <bb24const.scad>
use <misc.scad>


// connector between the brackets
module bracket_connector(){ // public
    difference() {
        union(){
            b(8, 14, fw+1+2*16);
            b(8, 16, fw+1);
        }
        c(fw*2,4); // screw hole
    }
}


// In theory brackets should be functions of fw (frame width) and fl (frame length)
module bracket(){ // public
    beam_id = bearing_od + 2*pipe_wall_thick + 2*radius_tolerance;
    beam_od = beam_id+2*pipe_wall_thick;
    w = 88;
    difference(){
        union(){
            b(8, w*2, 16); // long beam
            t(0, w+beam_id/2, 0) tube(h=16,od=beam_od,id=beam_id,center=true);
            t(0, -(w+beam_id/2), 0) tube(h=16,od=beam_od,id=beam_id,center=true);
            scale([0.5,1.5]) c(16, 25); // elipse in center
        }
        b(8.2, 14.2, 18); // hole for bracket connector
    }
}

bracket();
t(30,0,0) bracket_connector();
