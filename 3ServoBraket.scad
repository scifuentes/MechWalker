$fs=.75;

difference() {
	union() {
		difference() {
			union() {
				translate(v = [0, -14.5000000000, 0]) {
					translate(v = [0.0000000000, 14.5000000000, 6.0000000000]) {
						translate(v = [-2.5000000000, -14.5000000000, -6.0000000000]) {
							cube(size = [5.0000000000, 29.0000000000, 12.0000000000]);
						}
					}
				}
				union() {
					translate(v = [0, 14.5000000000, 0]) {
						translate(v = [0.0000000000, 9.5000000000, 6.0000000000]) {
							translate(v = [-2.5000000000, -9.5000000000, -6.0000000000]) {
								cube(size = [5.0000000000, 19.0000000000, 12.0000000000]);
							}
						}
					}
					translate(v = [0, 33.5000000000, 0]) {
						translate(v = [0.0000000000, -6.0000000000, 6.0000000000]) {
							translate(v = [-2.5000000000, -6.0000000000, -6.0000000000]) {
								cube(size = [5.0000000000, 12.0000000000, 12.0000000000]);
							}
						}
					}
				}
			}
			translate(v = [0, -14.5000000000, 0]) {
				union() {
					translate(v = [0, 6.0000000000, 0]) {
						cylinder(d = 2.0000000000, h = 12.0000000000);
					}
					translate(v = [0, 23.0000000000, 0]) {
						cylinder(d = 2.0000000000, h = 12.0000000000);
					}
				}
			}
			#translate(v = [0, 33.6000000000, 6.0000000000]) {
				rotate(a = [90, 0, 0]) {
					cylinder(d = 2.0000000000, h = 12.0000000000);
				}
			}
		}
		translate(v = [28.0000000000, 0, 0]) {
			difference() {
				union() {
					translate(v = [0, -14.5000000000, 0]) {
						translate(v = [0.0000000000, 14.5000000000, 6.0000000000]) {
							translate(v = [-2.5000000000, -14.5000000000, -6.0000000000]) {
								cube(size = [5.0000000000, 29.0000000000, 12.0000000000]);
							}
						}
					}
					union() {
						translate(v = [0, 14.5000000000, 0]) {
							translate(v = [0.0000000000, 9.5000000000, 6.0000000000]) {
								translate(v = [-2.5000000000, -9.5000000000, -6.0000000000]) {
									cube(size = [5.0000000000, 19.0000000000, 12.0000000000]);
								}
							}
						}
						translate(v = [0, 33.5000000000, 0]) {
							translate(v = [0.0000000000, -6.0000000000, 6.0000000000]) {
								translate(v = [-2.5000000000, -6.0000000000, -6.0000000000]) {
									cube(size = [5.0000000000, 12.0000000000, 12.0000000000]);
								}
							}
						}
					}
				}
				translate(v = [0, -14.5000000000, 0]) {
					union() {
						translate(v = [0, 6.0000000000, 0]) {
							cylinder(d = 2.0000000000, h = 12.0000000000);
						}
						translate(v = [0, 23.0000000000, 0]) {
							cylinder(d = 2.0000000000, h = 12.0000000000);
						}
					}
				}
				#translate(v = [0, 33.6000000000, 6.0000000000]) {
					rotate(a = [90, 0, 0]) {
						cylinder(d = 2.0000000000, h = 12.0000000000);
					}
				}
			}
		}
		difference() {
			translate(v = [-2.5000000000, -14.5000000000, 0]) {
				translate(v = [16.5000000000, -2.0000000000, 6.0000000000]) {
					translate(v = [-16.5000000000, -2.0000000000, -6.0000000000]) {
						cube(size = [33.0000000000, 4.0000000000, 12.0000000000]);
					}
				}
			}
			translate(v = [8.5000000000, -14.5000000000, 6.0000000000]) {
				rotate(a = [90, 0, 0]) {
					cylinder(d = 3, h = 12.0000000000);
				}
			}
		}
	}
	#resize(newsize = [0, 44, 0]) {
		translate(v = [-2.6000000000, 2.8000000000, 12.0000000000]) {
			rotate(a = [0, 90, 0]) {
				cylinder(h = 34.0000000000, r = 8);
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

servo = Object()
servo.width = 12.0
servo.height = 23.0
servo.wingL = 5.0
servo.holeD = 2.0
servo.wingH = 19.0
servo.wingThk = 4.0

thk= servo.width
servoSpace = 5.0
w = servo.width*2 + servoSpace

def screwHole():
	return cylinder(d=servo.holeD,h=servo.width)

def bar2(): 
	return cube([servo.wingL,w,thk]).align('y-','z-').move(y=-w/2.)
bar2bar = cube([w,servoSpace-1,thk]).align('x-','z-')
bar2Holes = (screwHole().move(y=servo.width/2.)+ screwHole().move(y= w-servo.width/2.)).move(y=-w/2.)

def bar3():
	return ( cube([servo.wingL, servo.wingH,thk]).align('y-','z-').move(y=servo.width+servoSpace/2)
		     + cube([servo.wingL, thk, servo.width]).align('y+','z-').move(y=servo.width+servoSpace/2+servo.wingH)
		    )
	         
bar3Hole = screwHole().rot(x=90).move(y=servo.width+servoSpace/2+servo.wingH+.1, z = servo.width/2).debug()
_3rdServo = bar3() + bar3().move(x=servo.height+servo.wingL)

_3rdAxis = (cube([servo.height+2*servo.wingL, servo.wingThk,servo.width]).align('x-','y+','z-').move(x=-servo.wingL/2,y=-w/2.)
	        - cylinder(d=3, h = thk).rot(x=90).move(x=+servo.wingL/2.+servo.width/2,y=-w/2,z=servo.width/2))

def bar():
	return bar2() + bar3() - bar2Holes - bar3Hole

foo = cylinder(8,servo.height+2*servo.wingL+1).rot(y=90).move(x=-servo.wingL/2-.1,y=2.8,z=thk).resize([0,44,0]).debug()
scene = bar() + bar().move(x=servo.height+servo.wingL) + _3rdAxis - foo

scad_render_to_file(scene, 'preview.scad', '$fs=.75;') 
 
************************************************/
