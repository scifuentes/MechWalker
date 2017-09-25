$fs=.75;

difference(){
	union() {
		translate(v = [0, -13.5000000000, 0]) {
			union() {
				translate(v = [0, 13.5000000000, 1.5000000000]) {
					translate(v = [-2.5000000000, -13.5000000000, -1.5000000000]) {
						cube(size = [5, 27, 3]);
					}
				}
				translate(v = [0, 6.0000000000, 0]) {
				}
				translate(v = [0, 21.0000000000, 0]) {
				}
			}
		}
		translate(v = [28, 0, 0]) {
			translate(v = [0, -13.5000000000, 0]) {
				union() {
					translate(v = [0, 13.5000000000, 1.5000000000]) {
						translate(v = [-2.5000000000, -13.5000000000, -1.5000000000]) {
							cube(size = [5, 27, 3]);
						}
					}
					translate(v = [0, 6.0000000000, 0]) {
					}
					translate(v = [0, 21.0000000000, 0]) {
					}
				}
			}
		}
		translate(v = [13.5000000000, 0, 1.5000000000]) {
			translate(v = [-13.5000000000, -1.5000000000, -1.5000000000]) {
				cube(size = [27, 3, 3]);
			}
		}
	}
	/* Holes Below*/
	union(){
		translate(v = [0, -13.5000000000, 0]){
			union(){
				translate(v = [0, 6.0000000000, 0]){
					cylinder(d = 2, h = 3);
				}
				translate(v = [0, 21.0000000000, 0]){
					cylinder(d = 2, h = 3);
				}
			}
		}
		translate(v = [28, 0, 0]){
			translate(v = [0, -13.5000000000, 0]){
				union(){
					translate(v = [0, 6.0000000000, 0]){
						cylinder(d = 2, h = 3);
					}
					translate(v = [0, 21.0000000000, 0]){
						cylinder(d = 2, h = 3);
					}
				}
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
servo.width = 12
servo.height = 23
servo.wingL = 5
servo.holeD = 2
thk= 3

servoSpace = 3
w = servo.width*2 + servoSpace

screwHole = cylinder(d=servo.holeD,h=thk).set_hole()

def bar(): 
	return ( cube([servo.wingL,w,thk]).align('y-','z-')
				  + screwHole.move(y=servo.width/2.)
				  + screwHole.move(y= w-servo.width/2.)
			).move(y=-w/2.)
bar2bar = cube([w,servoSpace,thk]).align('x-','z-')

scene = bar() + bar().move(x=servo.height+servo.wingL)+bar2bar

scad_render_to_file(scene, 'preview.scad', '$fs=.75;') 
 
************************************************/
