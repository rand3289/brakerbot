// Breaker Bot 2024 toandrey(at)yahoo(dot)com

disk_id = 25;
disk_od = 95;
disk_h  = 1.25;

bl = 54; // beam length
fw = 54; // frame width
fl = 16+disk_od+3; // frame length

hole_tolerance = 0.1;
round_wall_thick=1.5;

bearing_od=22; // 608 bearing outer diameter

shaft_round = 8; // 608 bearings fit an 8mm round shaft
// if you grind an end of a round shaft into a square, it will be this size
shaft_square = sqrt(shaft_round*shaft_round/2);
echo("Shaft end square size", shaft_square);
