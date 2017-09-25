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

side1 = (rbeam(h,w,thk)
         + hull(cylinder(d=h,h=thk), cylinder(d=h,h=thk).move(x=-w/2,y=25)).mirrorCopy('x')
         - cylinder(d=screw,h=thk+1).move(x=w/2).mirrorCopy('x')
        ).rot(x=90)

side2 = ( rbeam(h,w,thk)
         + hull(cylinder(d=h,h=thk), cylinder(d=h,h=thk).move(x=-w/2,y=-25)).mirrorCopy('x')
	     - cylinder(d=shaftD,h=thk).move(x=w/2).mirrorCopy('x')
	    ).rot(x=-90)

side2_1 = ( rbeam(h,w,1)
	     - cylinder(d=2,h=thk).move(x=w/2).mirrorCopy('x')).rot(x=-90).move(y=thk)

middleBar = ( cube([thk,l,h]).align('y-')
	          -rbeam(h,l-h,thk*2).rot(x=90,z=90).move(x=-thk/2,y=l/2,z=h/2))
scene = side1+(side2+side2_1).move(y=l)+middleBar
scad_render_to_file(scene, 'preview.scad', '$fs=.75;')
