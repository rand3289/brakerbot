// Breaker Bot 2024 toandrey(at)yahoo(dot)com
use <misc.scad>
use <bb24brake.scad>
use <bb24brake2.scad>


module shin(){ // public
    difference(){
        union(){
            t(-25, 0, 0) b(200,16,8);
            t(71,  4, 0) b(16, 16, 8);
            t(31, 10, 0) b(16, 32, 8);

            t(-125, 0, 0) c(8, 16);
            t(71, 12, 0) c(8, 16);
            t(31, 26, 0) c(8, 16);
            t(75, -4, 0) c(8,  8);
        }
        t(71,12,0) c(10, 8.4);
        t(31,26,0) c(10, 8.4);
        t(-125,0,0) c(10, 8.4);
    }
}


module thigh(){ // public
    difference(){
        union(){
            t(107, 0, 0) b(64,50,16);
            b(150, 16,16);
        }
        t(-66, 0, 0) b(19, 8.4, 18);
        t(115, 0, 0) b(64, 42.4, 18);
        t(130, 0, 0) r(90, 0, 0) c(64, 12.4);
        t(-66, 0, 0) r(90, 0, 0) c(20, 8.4);
    }
}


module pushrod(){ // public
    difference(){
        union(){
            b(174, 8, 12);
            t(87, 0, 0)  b(20, 16, 12);
            t(-86, 0, 0) b(20, 16, 12);
        }
        t(91, 0, 0)  b(20, 8.4, 14);
        t(-90, 0, 0) b(20, 8.4, 14);
        t(100, 0, 6) r(0,45,0)    b(8, 20, 8); // cut off a corner
        t(91, 0, 0)  r(-90, 0, 0) c(24, 8.4);
        t(-90, 0, 0) r(-90, 0, 0) c(24, 8.4);
    }
}


module peg(){
    $fn = 32; // make the holes nice and round
    difference(){
        union(){
            c(16.4,8);
            t(0,0,8.8) c(1.2,12);
        }
        c(30,3);
    }
    difference(){
        t(0,0,-10) c(1.2,12);
        c(30,3);
    }
}


module hip(){ // public
    $fn=64;
    difference(){
        union(){
            b(64, 58, 16);
            t(-36, 0, 0) b(12, 8, 16);
            t(-42,0,0) r(90,0,0) c(8,16);
        }
        t(8, 0, 0)  b(64, 50.4, 18);
        t(24, 0, 0) r(-90, 0, 0) c(64, 12.4);
        t(-42,0,0) r(-90, 0, 0) c(20, 8.4);
    }
}


module hip_w_brake(){
    $fn=64;
    difference(){
        union(){
            hip();
            difference(){
                t(-17,0,10.5) b(38,30,15); // middle part
                t(-39.32,0,0) r(0,45,0) b(16,32,16); // cut off the edge
            }
            t(-31,-40,3.2) r(0,-90,0) brake_block();
            t(-2,0,-8) sq_tube(8,30,12,0.3); // print support
        }
        t(-17, 0, 10.6) b(31, 34, 5.2); // brake arm hole
        t(-17, 0, 5.8) c(5, 8);
        t(-17, 0, 16) c(5, 8);
    }
}


// local file debugging only
t(-137,0,-12) r(90,0,0) shin();
t(107, 0, 30) hip_w_brake();
t(-16, 0, 14) pushrod();
t(0,30,0) brake_install() t(0, 10.6, -80) r(90,-90,0) thigh();
t(0,0,-20) r(90,0,0) peg();
