include <../rectangles/rectangles.scad>

module labstack_moduleBlankOutline() {
    difference() {
        roundedRect(54, 87, 5);
        
        translate([12.2+(3.8/2),1.5+(3.8/2),0]) 
            circle(d=3.6, $fn=20);

        translate([54-12.2-(3.8/2),1.5+(3.8/2),0]) 
            circle(d=3.6, $fn=20);

        translate([12.2+(3.8/2),87-1.5-(3.8/2),0]) 
            circle(d=3.6, $fn=20);

        translate([54-12.2-(3.8/2),87-1.5-(3.8/2),0]) 
            circle(d=3.6, $fn=20);

    }
}

module labstack_moduleFace() {
    difference() {
        linear_extrude(3)
            children();

        translate([0,87/2,0])
            rotate([0,45,0])
                cube([3,87,3], center=true);

        translate([54,87/2,0])
            rotate([0,45,0])
                cube([3,87,3], center=true);
    }
}

module labstack_moduleBlank() {
    labstack_moduleFace()
        labstack_moduleBlankOutline();
}