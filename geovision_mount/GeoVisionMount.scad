
module mountHole() {
    circle(d=3.8, $fn=50);
}

module mountHolePattern() {
    mountHole();
    
    translate([20,0,0]) {
        mountHole();
    }
    
    translate([20,20,0]) {
        mountHole();
    }
    
    translate([0,20,0]) {
        mountHole();
    }
}

module lowerPlate() {
    difference() {
        square([43,48]);
        
        translate([11.5,17]) {
            mountHolePattern();
        }
    }
}

module roundSlot(d = 5, l = 10) {
   union() {
       r = d/2;
       
       translate([r,r,0]) {
           circle(d=d, $fn=50);
       }
       
       translate([r,0,0]) {
           square([l-d, d]);
       }
       
       translate([l-r,r,0]) {
           circle(d=d, $fn=50);
       }
   }
}

module frontPanel(h = 43, w = 20, slot_inset = 5, slot_d = 3.8) {
        difference() {
        square([h,w]);
            
        $slot_length = w - (slot_inset * 2);
        
        translate([slot_inset + slot_d, slot_inset, 0]) {
            rotate([0,0,90]) {
                roundSlot(d=slot_d,l=$slot_length);
            }
        }

        translate([h-slot_inset, slot_inset, 0]) {
            rotate([0,0,90]) {
                roundSlot(d=slot_d,l=$slot_length);
            }
        }
    }
}

union() {
    linear_extrude(3) {
        lowerPlate();
    }
    
    rotate([90,0,0]) {
        linear_extrude(3) {
            frontPanel(h=43, w=(20+17));
        }
    }
}