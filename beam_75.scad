$fs=.75;

difference() {
	hull() {
		translate(v = [-37.5000000000, 0, 0]) {
			cylinder(d = 9, h = 3);
		}
		translate(v = [37.5000000000, 0, 0]) {
			cylinder(d = 9, h = 3);
		}
	}
	union() {
		translate(v = [37, 0, 0]) {
			cylinder(d = 3.0000000000, h = 3);
		}
		mirror(v = [1, 0, 0]) {
			translate(v = [37, 0, 0]) {
				cylinder(d = 3.0000000000, h = 3);
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

l = 75
hole = 3.0
thk=3
h=9

def rbeam(w,l,thk):
	return hull(cylinder(d=w,h=thk).move(x=-l/2.),
	     	     cylinder(d=w,h=thk).move(x=l/2.))


beam = ( rbeam(h,l,thk)
	     - cylinder(d=hole,h=thk).move(x=l/2).mirrorCopy('x')
	    )

scene = beam
scad_render_to_file(scene, 'preview.scad', '$fs=.75;')
 
 
************************************************/
