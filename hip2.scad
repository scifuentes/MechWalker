$fs=.75;

union() {
	rotate(a = [90, 0, 0]) {
		difference() {
			hull() {
				translate(v = [16.0000000000, 0, 0]) {
					cylinder(d = 10.0000000000, h = 3);
				}
				translate(v = [-16.0000000000, 0, 0]) {
					cylinder(d = 10.0000000000, h = 3);
				}
				translate(v = [0, 0.0000000000, 1.5000000000]) {
					translate(v = [-1.5000000000, -5.0000000000, -1.5000000000]) {
						cube(size = [3, 10.0000000000, 3]);
					}
				}
			}
			union() {
				translate(v = [16, 0, 0]) {
					cylinder(d = 3.0000000000, h = 4);
				}
				mirror(v = [1, 0, 0]) {
					translate(v = [16, 0, 0]) {
						cylinder(d = 3.0000000000, h = 4);
					}
				}
			}
		}
	}
	translate(v = [0, 77.0000000000, 0]) {
		union() {
			rotate(a = [-90, 0, 0]) {
				difference() {
					hull() {
						translate(v = [-16.0000000000, 0, 0]) {
							cylinder(d = 10.0000000000, h = 3);
						}
						translate(v = [16.0000000000, 0, 0]) {
							cylinder(d = 10.0000000000, h = 3);
						}
					}
					union() {
						translate(v = [16, 0, 0]) {
							cylinder(d = 4.5000000000, h = 3);
						}
						mirror(v = [1, 0, 0]) {
							translate(v = [16, 0, 0]) {
								cylinder(d = 4.5000000000, h = 3);
							}
						}
					}
				}
			}
			translate(v = [0, 3, 0]) {
				rotate(a = [-90, 0, 0]) {
					difference() {
						hull() {
							translate(v = [-16.0000000000, 0, 0]) {
								cylinder(d = 10.0000000000, h = 1);
							}
							translate(v = [16.0000000000, 0, 0]) {
								cylinder(d = 10.0000000000, h = 1);
							}
						}
						union() {
							translate(v = [16, 0, 0]) {
								cylinder(d = 2, h = 3);
							}
							mirror(v = [1, 0, 0]) {
								translate(v = [16, 0, 0]) {
									cylinder(d = 2, h = 3);
								}
							}
						}
					}
				}
			}
		}
	}
	difference() {
		translate(v = [0, 38.5000000000, 0.0000000000]) {
			translate(v = [-1.5000000000, -38.5000000000, -5.0000000000]) {
				cube(size = [3, 77.0000000000, 10.0000000000]);
			}
		}
		translate(v = [-2, 38.5000000000, 5.0000000000]) {
			rotate(a = [90, 0, 90]) {
				hull() {
					translate(v = [-33.5000000000, 0, 0]) {
						cylinder(d = 10.0000000000, h = 6);
					}
					translate(v = [33.5000000000, 0, 0]) {
						cylinder(d = 10.0000000000, h = 6);
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

w = 32
l = 12*3+23+6+4+8.
screw = 3.0
shaftD = 4.5
thk=3
h=10.

def washer(r1,r0,h=1):
	return cylinder(r=r1,h=h)-cylinder(r=r0,h=h).set_hole()

def rbeam(w,l,thk):
	return hull(cylinder(d=w,h=thk).move(x=-l/2.),
	     	     cylinder(d=w,h=thk).move(x=l/2.))

beam1 = (hull(cylinder(d=h,h=thk).move(x=w/2.), cylinder(d=h,h=thk).move(x=-w/2.), cube([thk,h,thk]).align('z-'))
	     - cylinder(d=screw,h=thk+1).move(x=w/2).mirrorCopy('x')
	    ).rot(x=90)

beam2 = ( rbeam(h,w,thk)
	     - cylinder(d=shaftD,h=thk).move(x=w/2).mirrorCopy('x')
	    ).rot(x=-90)

beam2_1 = ( rbeam(h,w,1)
	     - cylinder(d=2,h=thk).move(x=w/2).mirrorCopy('x')).rot(x=-90).move(y=thk)

middleBar = ( cube([thk,l,h]).align('y-')
	          -rbeam(h,l-h,thk*2).rot(x=90,z=90).move(x=-thk/2,y=l/2,z=h/2))
scene = beam1+(beam2+beam2_1).move(y=l)+middleBar
scad_render_to_file(scene, 'preview.scad', '$fs=.75;')
 
 
************************************************/
