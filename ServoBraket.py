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

_4thAxisThk = 2
_4thAxis = ( hull( cylinder(d=servo.width, h=_4thAxisThk)
	             , cube([servo.height+2*servo.wingL,1,_4thAxisThk]).align('x-','y+','z-').move(y=servo.width/2,x=-servo.wingL-servo.width/2).debug())
            - cylinder(d=3,h=_4thAxisThk)
	        ).move(x=servo.wingL/2+servo.width/2, y = -servo.width/2 -servo.width-servoSpace/2)

scene = bar() + bar().move(x=servo.height+servo.wingL) + _3rdAxis +_4thAxis - foo

scad_render_to_file(scene, 'preview.scad', '$fs=.75;')