from solid import *
from solid import extensions
from math import *

class Object:
    pass

thkOut = 2
thkIn = 3
thkPlay = .5
thk = 2*thkOut+thkIn+thkPlay
length =30

screwD=3
rLink = screwD/2.+3

screwHoles = cylinder(d=screwD, h=thk).center()+cylinder(d=screwD,h=thk).center().move(x=length)
baseBody = hull(cylinder(r=rLink, h=thk).center(),cylinder(r=rLink,h=thk).center().move(x=length))
hornSpace = hull(cylinder(rLink,h=thkIn+thkPlay).center(), cylinder(0.1,h=thkIn+thkPlay).center().move(x=3*rLink,y=rLink))
def sideSpace() :
	return  ( hull(cylinder(rLink,h=thkOut).center().move(x=length), 
		           cylinder(rLink,h=thkOut).center().move(x=length-3*rLink))
	        - cylinder(rLink,h=thkOut).center().move(x=length-3*rLink)).debug()

scene = ( baseBody 
	    - screwHoles 
	    - hornSpace
	    - sideSpace().move(z=thk/2.-thkOut/2) 
	    - sideSpace().move(z=-thk/2.+thkOut/2)).rot(x=90)

scad_render_to_file(scene, 'preview.scad', '$fs=.75;')