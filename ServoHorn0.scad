$fs=.75;

difference(){
	union() {
		union() {
			union() {
				cylinder(h = 4, r = 6.0000000000);
			}
		}
		hull() {
			cylinder(h = 4, r = 6.0000000000);
			translate(v = [35, 0, 0]) {
				union() {
					cylinder(d = 7, h = 4);
				}
			}
		}
		translate(v = [35, 0, 0]) {
			union() {
				cylinder(d = 7, h = 4);
			}
		}
	}
	/* Holes Below*/
	union(){
		union(){
			union(){
				cylinder(d = 4, h = 4);
			}
			translate(v = [0, 0, 0]) {
				translate(v = [0.0000000000, 0, 2.0000000000]) {
					translate(v = [-6.0000000000, -0.5000000000, -2.0000000000]) {
						cube(size = [12.0000000000, 1, 4]);
					}
				}
			}
		}
		translate(v = [-4.0000000000, 0, 2.0000000000]) {
			rotate(a = [90, 0, 0]) {
				translate(v = [0, 0, -10.0000000000]) {
					cylinder(d = 2, h = 20);
				}
			}
		}
		hull(){
			translate(v = [35, 0, 0]){
				union(){
					cylinder(d = 3, h = 4);
				}
			}
		}
		translate(v = [35, 0, 0]){
			union(){
				cylinder(d = 3, h = 4);
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

servo = Object()
servo.shaft = Object()
servo.shaft.d = 4
servo.shaft.r = servo.shaft.d/2.
servo.shaft.h = 4
servoShaft = cylinder(d=servo.shaft.d,h=servo.shaft.h)

grip = Object()
grip.r=servo.shaft.r+4
shaftGrip = ( cylinder(r=grip.r, h=servo.shaft.h)
	          - servoShaft.set_hole()
              - cube([2*grip.r, 1, servo.shaft.h]).align('z-').move(x=0).set_hole()
              - cylinder(d=2,h=20).center().rot(x=90).move(x=-(grip.r+servo.shaft.r)/2,z=servo.shaft.h/2.).set_hole()
               )

hornLenght = 35

hornEnd = ( cylinder(d=3+2*2, h = servo.shaft.h)
	       - cylinder(d=3, h = servo.shaft.h).set_hole()).move(x=hornLenght)

hornBody = hull(cylinder(r=grip.r, h=servo.shaft.h), hornEnd)

scene = shaftGrip + hornBody + hornEnd


scad_render_to_file(scene, 'preview.scad', '$fs=.75;')
 
 
************************************************/
