$fs=.75;

difference() {
	hull() {
		union() {
			resize(newsize = [0, 0, 5]) {
				union() {
					rotate(a = [90, 0, 0]) {
						translate(v = [-0.0000000000, -0.0000000000, -17.5000000000]) {
							cylinder(d = 12.0000000000, h = 35.0000000000);
						}
					}
					union() {
						translate(v = [0, 17.5000000000, 0]) {
							sphere(d = 12.0000000000);
						}
						mirror(v = [0, 1, 0]) {
							translate(v = [0, 17.5000000000, 0]) {
								sphere(d = 12.0000000000);
							}
						}
					}
				}
			}
			translate(v = [1.5000000000, 0, 0]) {
				union() {
					translate(v = [0.0000000000, 0.0000000000, 4.5000000000]) {
						translate(v = [-1.5000000000, -8.0000000000, -4.5000000000]) {
							cube(size = [3.0000000000, 16.0000000000, 9.0000000000]);
						}
					}
					union() {
						translate(v = [0, 8.0000000000, 6.0000000000]) {
							rotate(a = [0, 90, 0]) {
								translate(v = [-0.0000000000, -0.0000000000, -1.5000000000]) {
									cylinder(d = 9.0000000000, h = 3.0000000000);
								}
							}
						}
						mirror(v = [0, 1, 0]) {
							translate(v = [0, 8.0000000000, 6.0000000000]) {
								rotate(a = [0, 90, 0]) {
									translate(v = [-0.0000000000, -0.0000000000, -1.5000000000]) {
										cylinder(d = 9.0000000000, h = 3.0000000000);
									}
								}
							}
						}
					}
				}
			}
		}
	}
	translate(v = [1.5000000000, 0, 0]) {
		union() {
			translate(v = [1.5000000000, 0, 0]) {
				translate(v = [6.0000000000, 0.0000000000, 6.5000000000]) {
					translate(v = [-6.0000000000, -24.0000000000, -6.5000000000]) {
						cube(size = [12.0000000000, 48.0000000000, 13.0000000000]);
					}
				}
			}
			mirror(v = [1, 0, 0]) {
				translate(v = [1.5000000000, 0, 0]) {
					translate(v = [6.0000000000, 0.0000000000, 6.5000000000]) {
						translate(v = [-6.0000000000, -24.0000000000, -6.5000000000]) {
							cube(size = [12.0000000000, 48.0000000000, 13.0000000000]);
						}
					}
				}
			}
		}
	}
	union() {
		translate(v = [0, 8.0000000000, 6.0000000000]) {
			rotate(a = [0, 90, 0]) {
				translate(v = [-0.0000000000, -0.0000000000, -6.0000000000]) {
					cylinder(d = 3.0000000000, h = 12.0000000000);
				}
			}
		}
		mirror(v = [0, 1, 0]) {
			translate(v = [0, 8.0000000000, 6.0000000000]) {
				rotate(a = [0, 90, 0]) {
					translate(v = [-0.0000000000, -0.0000000000, -6.0000000000]) {
						cylinder(d = 3.0000000000, h = 12.0000000000);
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

lenght = 35.
hole = 3.0
thk=3.
height=12.
holesDistance=16.
width=12.


base = ( cylinder(d=width,h=lenght).center().rot(x=90)
	     + sphere(d=width).move(y=lenght/2).mirrorCopy('y')
	   ).resize([0,0,5])

center = (cube([thk,holesDistance,height-3]).align('z-') +
          cylinder(d=height-3,h=thk).center().rot(y=90).move(y=holesDistance/2,z=height/2).mirrorCopy('y')
          ).move(x=1.5)

sidecuts = (cube([width,lenght+width+1,height+1]).align('x-','z-').move(x=thk/2).mirrorCopy('x')).move(x=1.5)

holes = cylinder(d=hole,h=width).center().rot(y=90).move(y=holesDistance/2,z=height/2).mirrorCopy('y')
scene = hull(base + center)-sidecuts-holes

scad_render_to_file(scene, 'preview.scad', '$fs=.75;')
 
 
************************************************/
