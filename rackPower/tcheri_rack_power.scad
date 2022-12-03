
$fn = 100;

module screwPillar() {
    difference() {
        rotate([90,0,0]) {
            cylinder(48,3,3);
        }

        translate([0,1,0]) {
            rotate([90,0,0]) {
                cylinder(50,1.54,1.54);
            }
        }
    }
}

module outletCutoutWithSwitch() {
    // Switch
    translate([2.5,0,32]) {
        rotate([90,0,0]) {
            cube([20,13.5,6]);
        }
    }

    // Outlet
    rotate([90,0,0]) {
        cube([25,23,6]);
    }

}

union() {

    // Four screw pillars inside the box.
    for(x=[0:1:1]) {
        for(z=[0:1:1]) {
             translate([24+(x*122),50,4+(z*62)]) {
                screwPillar();
            }
        }
    }

    difference() {
        // Base frame
        cube([170,50,70]);

        // Internal hollow-out
        translate([22,3,2]) {
            cube([126,48,66]);
        }
        
        // Left side wing cutout
        translate([-1,4,-1]) {
            cube([21,52,72]);
        }

        // Right side wing cutout
        translate([150,4,-1]) {
            cube([21,52,72]);
        }

        // Bolt holes for the wings.
        for(x=[0:1:1]) {
            for(z=[0:1:1]) {
                 translate([10+(x*150),5,10+(z*50)]) {
                    rotate([90,0,0]) {
                        cylinder(6,3,3);
                    }
                }
            }
        }

        // IEC cutout
        translate([24,-1,11]) {
            cube([28.5,6,48.5]);
        }
        
        // Outlet and switches.
        for (x=[0:1:2]) {
            translate([60+(x*30),4,12.5]) {
                outletCutoutWithSwitch();
            }
        }
    }
}
