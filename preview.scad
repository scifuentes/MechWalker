$fs=.75;

difference() {
	union() {
		translate(v = [0, 0, -8.5000000000]) {
			rotate(a = [0, 90, 0]) {
				difference() {
					translate(v = [0, -26.5000000000, 0]) {
						translate(v = [0.0000000000, 32.5000000000, 6.0000000000]) {
							translate(v = [-2.5000000000, -32.5000000000, -6.0000000000]) {
								cube(size = [5.0000000000, 65.0000000000, 12.0000000000]);
							}
						}
					}
					#translate(v = [0, -8.5000000000, 0]) {
						cylinder(d = 2.0000000000, h = 14.0000000000);
					}
					#translate(v = [0, 8.5000000000, 0]) {
						cylinder(d = 2.0000000000, h = 14.0000000000);
					}
					#translate(v = [0, 38.5000000000, 6.0000000000]) {
						rotate(a = [90, 0, 0]) {
							cylinder(d = 2.0000000000, h = 14.0000000000);
						}
					}
				}
			}
		}
		translate(v = [0, 0, 19.5000000000]) {
			rotate(a = [0, 90, 0]) {
				difference() {
					translate(v = [0, -26.5000000000, 0]) {
						translate(v = [0.0000000000, 32.5000000000, 6.0000000000]) {
							translate(v = [-2.5000000000, -32.5000000000, -6.0000000000]) {
								cube(size = [5.0000000000, 65.0000000000, 12.0000000000]);
							}
						}
					}
					#translate(v = [0, -8.5000000000, 0]) {
						cylinder(d = 2.0000000000, h = 14.0000000000);
					}
					#translate(v = [0, 8.5000000000, 0]) {
						cylinder(d = 2.0000000000, h = 14.0000000000);
					}
					#translate(v = [0, 38.5000000000, 6.0000000000]) {
						rotate(a = [90, 0, 0]) {
							cylinder(d = 2.0000000000, h = 14.0000000000);
						}
					}
				}
			}
		}
		translate(v = [0, -29.5000000000, -11.0000000000]) {
			cube(size = [12.0000000000, 3, 33.0000000000]);
		}
		translate(v = [0, -26.5000000000, -11.0000000000]) {
			cube(size = [2.5000000000, 12.0000000000, 33.0000000000]);
		}
	}
	#translate(v = [6.0000000000, 0, 0]) {
		rotate(a = [90, 0, 0]) {
			cylinder(d = 3, h = 50);
		}
	}
	#translate(v = [0, -20.5000000000, 0]) {
		rotate(a = [0, 90, 0]) {
			cylinder(d = 3, h = 20);
		}
	}
	#translate(v = [12.0000000000, 0, 0]) {
		hull() {
			translate(v = [0, -17.5000000000, 0]) {
				translate(v = [-0.0000000000, -0.0000000000, -25.0000000000]) {
					cylinder(d = 15.0000000000, h = 50);
				}
			}
			translate(v = [0, 25.5000000000, 0]) {
				translate(v = [-0.0000000000, -0.0000000000, -25.0000000000]) {
					cylinder(d = 15.0000000000, h = 50);
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

servo = Object()
servo.width = 12.0
servo.height = 23.0
servo.wingL = 5.0
servo.holeD = 2.0
servo.wingH = 19.0
servo.wingThk = 4.0

h=servo.wingL
thk= servo.width
servoSpace = 5.0
w = servo.width*2 + servoSpace

def screwHole():
    return cylinder(d=servo.holeD,h=servo.width+2)



def hbar() :
	bar = (cube([h, 3*servo.width+servoSpace+servo.height+1,thk]).align('y-','z-')
	      .move(y=-2*servo.width-.5*servoSpace))
	servo1Hole = screwHole().move(y=-.5*servo.width-.5*servoSpace).debug()
	servo2Hole = screwHole().move(y=.5*servo.width+.5*servoSpace).debug()
	servo3Hole = screwHole().rot(x=90).move(z= servo.width/2,
	                                        y=.5*servoSpace+servo.width+servo.height+1).debug()
	return (bar - servo1Hole - servo2Hole - servo3Hole).rot(y=90)


vbar = cube([thk,3,servo.height+2*h]).move( z=-servo.width/2-h,
	                                        y=-(.5*servoSpace+servo.width*2+3))
Axis3Hole = cylinder(d=3,h=50).rot(x=90).move(x=servo.width/2).debug()

Axis4Hole = cylinder(d=3,h=20).rot(y=90).move(y=-servoSpace/2-servo.width*1.5).debug()

Servo4Cover = cube([2.5,servo.width,servo.height+2*h]).move( z=-servo.width/2-h,
	                                        y=-(.5*servoSpace+servo.width*2))

foo = hull( cylinder(d=servo.width+3,h=50).center().move(y=-servoSpace/2-servo.width-3),
	        cylinder(d=servo.width+3,h=50).center().move(y=servoSpace/2+servo.height)).move(x=thk).debug()

scene = ( hbar().move(z=-servo.width/2-h/2) + hbar().move(z=servo.height-servo.width/2+h/2)
	      + vbar + Servo4Cover - Axis3Hole - Axis4Hole  - foo)

scad_render_to_file(scene, 'preview.scad', '$fs=.75;')
 
 
************************************************/
