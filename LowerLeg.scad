$fs=.75;

difference(){
	difference() {
		union() {
			hull() {
				cylinder(h = 7.5000000000, r = 4.5000000000);
				translate(v = [40, 0, 0]) {
					cylinder(h = 7.5000000000, r = 4.5000000000);
				}
			}
			translate(v = [40, 0, 0]) {
			}
		}
		translate(v = [0, 0, 1.8750000000]) {
			hull() {
				translate(v = [-0.0000000000, -0.0000000000, -1.8750000000]) {
					cylinder(h = 3.7500000000, r = 5.5000000000);
				}
				translate(v = [30.0000000000, 4.5000000000, 0]) {
					translate(v = [-0.0000000000, -0.0000000000, -1.8750000000]) {
						cylinder(h = 3.7500000000, r = 0.1000000000);
					}
				}
			}
		}
		translate(v = [40, 0, 3.7500000000]) {
			mirror(v = [1, 0, 0]) {
				hull() {
					translate(v = [-0.0000000000, -0.0000000000, -1.7500000000]) {
						cylinder(h = 3.5000000000, r = 5.5000000000);
					}
					translate(v = [30.0000000000, 4.5000000000, 0]) {
						translate(v = [-0.0000000000, -0.0000000000, -1.7500000000]) {
							cylinder(h = 3.5000000000, r = 0.1000000000);
						}
					}
				}
			}
		}
	}
	/* Holes Below*/
	difference(){
		union(){
			cylinder(d = 3, h = 7.5000000000);
			translate(v = [40, 0, 0]){
				cylinder(d = 3, h = 7.5000000000);
			}
		}
	} /* End Holes */ 
}
/***********************************************
*********      SolidPython code:      **********
************************************************
 
from solid import *
from solid import extensions
from math import *

class Object:
    pass

thk = 2+3.5+2

screwD=3

screwHole =  cylinder(d=screwD, h = thk).set_hole()

r1 = screwD/2.+3
l=40

base = ( hull( cylinder(r1,thk) , cylinder(r1,thk).move(x=l))
		      + screwHole
		      + screwHole.move(x=l)
	   )

def voidPart(h):
	return hull(cylinder(r1+1,h).center(), cylinder(0.1,h).center().move(x=l*.75,y=r1))

scene = (base 
	     - voidPart(thk/2.).move(z=thk/4.) 
	     - voidPart(3.5).mirror([1,0,0]).move(x=l, z=thk/2)
	     )

scad_render_to_file(scene, 'preview.scad', '$fs=.75;') 
 
************************************************/
