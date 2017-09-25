from solid import *
from solid import extensions
from math import *

def rbeam(w,l,thk):
	return hull(cylinder(d=w,h=thk).move(x=-l/2.),
	     	     cylinder(d=w,h=thk).move(x=l/2.))

def hbeam(w,l,thk,hole): 
	return ( hull(cylinder(d=w,h=thk).move(x=-l/2.),
	     	      cylinder(d=w,h=thk).move(x=l/2.))
	     - cylinder(d=hole,h=thk).move(x=l/2).mirrorCopy('x')
	    )

if __name__ == '__main__':
	scene = hbeam(9,27,3,3)
	scad_render_to_file(scene, 'preview.scad', '$fs=.75;')
