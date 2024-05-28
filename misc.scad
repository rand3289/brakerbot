// generic public modules

/*
// RotateTranslate().  Rotate by rx,ry,rz and translate by x,y,z.  Rotate is optional since rx,ry,rz default to 0.
module rt(x,y,z,rx=0,ry=0,rz=0){ translate([x,y,z]) rotate([rx,ry,rz]) children(); }
module t(x,y,z){ translate([x,y,z]) children(); }
module r(x,y,z){ rotate([x,y,z]) children(); }

module flipx(){ rotate([90,0,0]) children(); }
module flipy(){ rotate([0,90,0]) children(); }
module flipz(){ rotate([0,0,90]) children(); }
module flip_x(){ rotate([-90,0,0]) children(); }
module flip_y(){ rotate([0,-90,0]) children(); }
module flip_z(){ rotate([0,0,-90]) children(); }
*/


// square tube
module sq_tube(length, width, height, wall){ // wall is wall thickness
    translate([0,0,height/2]) difference(){
        cube([length,width,height], true);
        cube([length-2*wall, width-2*wall, height+2], true);
    }
}
