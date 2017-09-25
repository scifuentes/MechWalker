$fs=.75;

rotate(a = [90, 0, 0]) {
	difference() {
		hull() {
			translate(v = [-0.0000000000, -0.0000000000, -3.7500000000]) {
				cylinder(h = 7.5000000000, r = 4.5000000000);
			}
			translate(v = [75, 0, 0]) {
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
			translate(v = [75, 0, 0]) {
				translate(v = [0, 0, -3.7500000000]) {
					cylinder(d = 3, h = 7.5000000000);
				}
			}
		}
		hull() {
			translate(v = [-0.0000000000, -0.0000000000, -1.7500000000]) {
				cylinder(h = 3.5000000000, r = 5.0000000000);
			}
			translate(v = [30, 0, 0]) {
				translate(v = [-0.0000000000, -0.0000000000, -1.7500000000]) {
					cylinder(h = 3.5000000000, r = 5.0000000000);
				}
			}
			translate(v = [43.5000000000, 4.5000000000, 0]) {
				translate(v = [-0.0000000000, -0.0000000000, -1.7500000000]) {
					cylinder(h = 3.5000000000, r = 0.1000000000);
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
play = .5
thk = 2*thkOut+thkIn+play
length = 75
shortLink = 30
screwD = 3
rLink = screwD/2.+3

screwHoles = cylinder(d=screwD, h=thk).center()+cylinder(d=screwD,h=thk).center().move(x=shortLink)+cylinder(d=screwD,h=thk).center().move(x=length)
baseBody = hull(cylinder(r=rLink, h=thk).center(),cylinder(r=rLink,h=thk).center().move(x=length))
hornSpace = hull(cylinder(rLink+play,h=thkIn+play).center(), cylinder(rLink+play,h=thkIn+play).center().move(x=shortLink), cylinder(0.1,h=thkIn+play).center().move(x=shortLink+3*rLink,y=rLink))

scene = ( baseBody 
	    - screwHoles 
	    - hornSpace).rot(x=90)

scad_render_to_file(scene, 'preview.scad', '$fs=.75;') 
 
************************************************/
