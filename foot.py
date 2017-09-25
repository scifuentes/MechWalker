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
