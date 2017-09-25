from solid import *
from solid import extensions
from math import *

class Object:
    pass

l = 50.
hole = 3.0
thk=8+4.
h=12.
hd=18.

def base(thk):
	return cylinder(d=h,h=thk).center().rot(x=90).move(x=l/2).mirrorCopy('x')

sides = hull(base(2)).move(y=thk/2-1).mirrorCopy('y')

holes = cylinder(d=3, h = thk).center().rot(x=90).move(x=hd/2).mirrorCopy('x')

scene = base(thk) + sides - holes

scad_render_to_file(scene, 'preview.scad', '$fs=.75;')
