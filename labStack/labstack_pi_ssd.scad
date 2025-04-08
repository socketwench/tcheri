include <../rectangles/rectangles.scad>
include <../m2_5/m2_5.scad>
include <labstack_moduleBlank.scad>

module labstack_module1xPiSsdFaceOutline() {
    difference() {
        labstack_moduleBlankOutline();
        
        translate([26.6,13.8,0])
            roundedRect(16.6, 53.8, 1);
        
        translate([10,8.2,0])
            roundedRect(8.2, 87-(8.2*2), 1);
    }
}

module labstack_module1xPiSsdFace() {
    labstack_moduleFace()
        labstack_module1xPiSsdFaceOutline();
}

module labstack_ssdOutline() {
    difference() {
        roundedRect(100, 69.85, 3);
        
        translate([9.4,4.07,0])
            circle(d=3.6, $fn=20);

        translate([9.4,69.85-4.07,0])
            circle(d=3.6, $fn=20);

        translate([100-9.4,4.07,0])
            circle(d=3.6, $fn=20);

        translate([100-9.4,69.85-4.07,0])
            circle(d=3.6, $fn=20);
    }
}

module labstack_m3VertMountBoss() {
    union() {
        cylinder(h=2,d=6,center=false,$fn=20);

        translate([-5.3,3,0])
        rotate([90,0,0])
            linear_extrude(6)
                polygon([
                    [0,0],
                    [5.3,0],
                    [5.3,2],
                    [2,2]
                ]);
    }
}

module labstack_piHolePattern() {
    translate([3.5,3.5,0])
        for (x = [0:58:58]) {
            for (y = [0:49:49]) {
                translate([x,y,0])
                    children();
            }
        }
}

module labstack_ssdHolePattern() {
    translate([14,4.07,0]) {
        children();
        
        translate([76.6,0,0])
            children();

        translate([76.6,61.71,0])
            children();
    }
}

module labstack_ssdMntPattern() {
    translate([14,4.07,0]) {
        children();
        
        translate([76.6,0,0])
            children();

        translate([76.6,61.71,0])
            children();

        translate([0,61.71,0])
            children();

    }
}

module labstack_ssdBase() {
    difference() {
        union() {
            linear_extrude(3)
                roundedRect(94.4, 69.85, 3);

            mirror([0,0,1])
                labstack_ssdMntPattern()
                    labstack_m3VertMountBoss();
        }
        
        translate([0,0,-2])
            labstack_ssdHolePattern()
                cylinder(h=5, d=3.6, $fn=20);
        
    }
}

module labstack_supportBar() {
    translate([0,1.4,0])
        rotate([90,0,0])
            linear_extrude(1.6)
                polygon([
                    [0,0],
                    [88,0],
                    [88,3],
                    [82,9],
                    [22,9],
                    [3,22],
                    [0,22],
                ]);
}

module labstack_piSdCutout() {
    translate([88-19,21+3,1])
        hull() {
            translate([-1,-1,2])
                linear_extrude(0.1)
                    roundedRect(33,18,1);
            
            linear_extrude(0.1)
                roundedRect(33,16,1);
        };
}

module labstack_piPortCutout() {
    translate([0,56+2.4,2])
        rotate([90,0,0])
            linear_extrude(54.8)
                polygon([
                    [0,0],
                    [0,1],
                    [18+3.7,1],
                    [17+3.7,0]
                ]);
}


module labstack_piSsdMnt() {
    difference() {
        union() {
            labstack_ssdBase();
            
            translate([0,7,0]) {
                labstack_supportBar();    
                translate([23.5,2,3])
                    labstack_piHolePattern()
                        labstack_m3VertMountBoss();
            }
            
            translate([0,69.84,0])
            rotate([90,0,0])
            linear_extrude(3)
            polygon([
                [0,0],
                [0,25],
                [25,0]
            ]);

        }
        translate([0,6,0]) {
            labstack_piSdCutout();
            labstack_piPortCutout();
            
            translate([23.5,3,0.8])
                labstack_piHolePattern() 
                    cylinder(h=5, d=3.6, $fn=20);
        }
    }
}

union() {
    labstack_module1xPiSsdFace();
    
        translate([20.2,78.2,0])
            rotate([180,0,0])
                rotate([0,90,0])
                    labstack_piSsdMnt();
}