include <../rectangles/rectangles.scad>
include <../m3/m3.scad>

module panels_hole() {
    rountedRectFull(11, 6);
}

module panels_1uHoles(pattern=[true,true,true]) {
    for(i=[0:1:2]) {
        if (pattern[i]) {
            translate([0,6.15+i*15.875,0])
                panels_hole();
        }
    }
}

module panels_2uHoles(patternLower=[true,true,true], patternUpper=[true,true,true]) {
    panels_1uHoles(patternLower);
    
    translate([0,44.5,0])
        panels_1uHoles(patternUpper);
}

module panels_1u() {
    linear_extrude(3)
        difference() {
            roundedRect(257, 44, 5);
            
            translate([15.875/2,0,0])
                panels_1uHoles();
            
            translate([257-(15.875/2),0,0])
                panels_1uHoles();
        }
}

module panels_2u(patternLower=[true,true,true], patternUpper=[true,true,true]) {
    linear_extrude(3)
        difference() {
            roundedRect(257, 88.5, 5);
            
            translate([15.875/2,0,0])
                panels_2uHoles(patternLower, patternUpper);
            
            translate([257-(15.875/2),0,0])
                panels_2uHoles(patternLower, patternUpper);
        }
}
