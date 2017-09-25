from solid import *
from solid import extensions
from math import *

class Object:
    pass

thk = 2+3.5+2

screwD=3

screwHole =  cylinder(d=screwD, h = thk).set_hole()

r1 = screwD/2.+3
l=30

base = ( hull( cylinder(r1,thk) , cylinder(r1,thk).move(x=l))
		      + screwHole
		      + screwHole.move(x=l)
	   )

def voidPart(h):
	return hull(cylinder(r1+1,h).center(), cylinder(0.1,h).center().move(x=l*.75,y=r1))

scene = (base 
	     - voidPart(thk/2.).move(z=thk/4.) 
	     - voidPart(3.5).mirror([1,0,0]).move(x=l, z=thk/2)
	     )

scad_render_to_file(scene, 'preview.scad', '$fs=.75;')