// generic public modules
module t(x,y,z){           translate([x,y,z]) children(); } // translate
module r(ax,ay,az){        rotate([ax,ay,az]) children(); } // rotate
module b(x,y,z){           cube([x,y,z],center=true); }     // block (cube)
module c(height,diameter){ cylinder(h=height, d=diameter, center=true); } // cylinder
module s(diameter){        sphere(d=diameter); }            // sphere
// comments after modules show up in vscode tooltips

/*
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


color("red") s(100);
c(100,50);
b(100,100,50);
