$fn = 50;

module basePlate() {
    points = [[0,0], [0,14], [13,39], [43,39], [43,10], [64,10], [64,0]];
    polygon(points);
}

module fanHoles25mm() {
    translate([12.5,12.5,0]) {
        circle(d = 20);
    }

    translate([2.5, 2.5, 0]) {
        for(x = [0,0,20,20]) {
            for( y = [0,20,0,20]) {
                translate([x, y, 0]) {
                    circle(d=4.6);
                }
            }
        }
    }
}



linear_extrude(2) {
    difference() {
        basePlate();
        
        translate([16,12,0]) {
            fanHoles25mm();
        }
    }
}

    for(x = [3.25,60.75]){
        translate([x,3,2]) {
            difference() {
                translate([0,0.2,(11.5/2)]) {
                    cube([6.5,6.5,11.5], center = true);
                }
                translate([0,0,(11.5-6)]) {
                    cylinder(d=4.6, h=7);
                }
            }
        }
    }

translate([16,12,0]) {
    translate([2.5, 2.5, 0]) {
        for(x = [0,0,20,20]) {
            for( y = [0,20,0,20]) {
                translate([x, y, 0]) {
                    difference() {
                        cylinder(d=8, h=5.6);
                        
                        translate([0,0,-1]) {
                            cylinder(d=4.6, h=7);
                        }
                    }
                }
            }
        }
    }
}