from solid import *
from solid import extensions
from math import *

class Object:
    pass

servo = Object()
servo.shaft = Object()
servo.shaft.d = 4.5
servo.shaft.r = servo.shaft.d/2.
servo.shaft.h = 5
servoShaft = cylinder(d=servo.shaft.d,h=3.5)+cylinder(d=2,h=servo.shaft.h)

grip = Object()
grip.rx = servo.shaft.r+4
grip.ry = servo.shaft.r+2

hornGrip = ( cylinder(d=grip.rx, h=servo.shaft.h).resize([grip.rx*2,grip.ry*2,0])
	         - servoShaft.set_hole()
             - cube([2*grip.rx-4, 1, servo.shaft.h]).align('z-').move(x=0).set_hole()
       
           )

horn = Object()
horn.height = 3
horn.lenght = 25
horn.end = Object()
horn.end.hole = 3
horn.end.r = horn.end.hole/2.+2
hornEnd = ( cylinder(r=horn.end.r, h = horn.height)
	       - cylinder(d=horn.end.hole, h = horn.height).set_hole()).move(x=horn.lenght)

hornBody = hull(cylinder(r=grip.ry, h=horn.height), hornEnd)

scene = hornGrip + hornBody + hornEnd


scad_render_to_file(scene, 'preview.scad', '$fs=.75;')
