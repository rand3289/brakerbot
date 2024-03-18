// generic modules

module t(x,y,z){ translate([x,y,z]) children(); }
module r(x,y,z){ rotate([x,y,z]) children(); }
module flipx(){ rotate([90,0,0]) children(); }
module flipy(){ rotate([0,90,0]) children(); }
module flipz(){ rotate([0,0,90]) children(); }


// square tube
module sq_tube(length, width, height, wall){ // wall is wall thickness
    translate([0,0,height/2]) difference(){
        cube([length,width,height], true);
       cube([length-2*wall, width-2*wall, height+2], true);
    }
}
