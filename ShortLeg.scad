$fs=.75;

rotate(a = [90, 0, 0]) {
	difference() {
		hull() {
			translate(v = [-0.0000000000, -0.0000000000, -3.7500000000]) {
				cylinder(h = 7.5000000000, r = 4.5000000000);
			}
			translate(v = [30, 0, 0]) {
				translate(v = [-0.0000000000, -0.0000000000, -3.7500000000]) {
					cylinder(h = 7.5000000000, r = 4.5000000000);
				}
			}
		}
		union() {
			translate(v = [0, 0, -3.7500000000]) {
				cylinder(d = 3, h = 7.5000000000);
			}
			translate(v = [30, 0, 0]) {
				translate(v = [0, 0, -3.7500000000]) {
					cylinder(d = 3, h = 7.5000000000);
				}
			}
		}
		hull() {
			translate(v = [-0.0000000000, -0.0000000000, -1.7500000000]) {
				cylinder(h = 3.5000000000, r = 4.5000000000);
			}
			translate(v = [13.5000000000, 4.5000000000, 0]) {
				translate(v = [-0.0000000000, -0.0000000000, -1.7500000000]) {
					cylinder(h = 3.5000000000, r = 0.1000000000);
				}
			}
		}
		translate(v = [0, 0, 2.7500000000]) {
			#difference() {
				hull() {
					translate(v = [30, 0, 0]) {
						translate(v = [-0.0000000000, -0.0000000000, -1.0000000000]) {
							cylinder(h = 2, r = 4.5000000000);
						}
					}
					translate(v = [16.5000000000, 0, 0]) {
						translate(v = [-0.0000000000, -0.0000000000, -1.0000000000]) {
							cylinder(h = 2, r = 4.5000000000);
						}
					}
				}
				translate(v = [16.5000000000, 0, 0]) {
					translate(v = [-0.0000000000, -0.0000000000, -1.0000000000]) {
						cylinder(h = 2, r = 4.5000000000);
					}
				}
			}
		}
		translate(v = [0, 0, -2.7500000000]) {
			#difference() {
				hull() {
					translate(v = [30, 0, 0]) {
						translate(v = [-0.0000000000, -0.0000000000, -1.0000000000]) {
							cylinder(h = 2, r = 4.5000000000);
						}
					}
					translate(v = [16.5000000000, 0, 0]) {
						translate(v = [-0.0000000000, -0.0000000000, -1.0000000000]) {
							cylinder(h = 2, r = 4.5000000000);
						}
					}
				}
				translate(v = [16.5000000000, 0, 0]) {
					translate(v = [-0.0000000000, -0.0000000000, -1.0000000000]) {
						cylinder(h = 2, r = 4.5000000000);
					}
				}
			}
		}
	}
}
/***********************************************
*********      SolidPython code:      **********
************************************************
 
from solid import *
from solid import extensions
from math import *

class Object:
    pass

thkOut = 2
thkIn = 3
thkPlay = .5
thk = 2*thkOut+thkIn+thkPlay
length =30

screwD=3
rLink = screwD/2.+3

screwHoles = cylinder(d=screwD, h=thk).center()+cylinder(d=screwD,h=thk).center().move(x=length)
baseBody = hull(cylinder(r=rLink, h=thk).center(),cylinder(r=rLink,h=thk).center().move(x=length))
hornSpace = hull(cylinder(rLink,h=thkIn+thkPlay).center(), cylinder(0.1,h=thkIn+thkPlay).center().move(x=3*rLink,y=rLink))
def sideSpace() :
	return  ( hull(cylinder(rLink,h=thkOut).center().move(x=length), 
		           cylinder(rLink,h=thkOut).center().move(x=length-3*rLink))
	        - cylinder(rLink,h=thkOut).center().move(x=length-3*rLink)).debug()

scene = ( baseBody 
	    - screwHoles 
	    - hornSpace
	    - sideSpace().move(z=thk/2.-thkOut/2) 
	    - sideSpace().move(z=-thk/2.+thkOut/2)).rot(x=90)

scad_render_to_file(scene, 'preview.scad', '$fs=.75;') 
 
************************************************/
