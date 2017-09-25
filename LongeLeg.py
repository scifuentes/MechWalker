from solid import *
from solid import extensions
from math import *

class Object:
    pass

thkOut = 2
thkIn = 3
play = .5
thk = 2*thkOut+thkIn+play
length = 75
shortLink = 30
screwD = 3
rLink = screwD/2.+3

screwHoles = cylinder(d=screwD, h=thk).center()+cylinder(d=screwD,h=thk).center().move(x=shortLink)+cylinder(d=screwD,h=thk).center().move(x=length)
baseBody = hull(cylinder(r=rLink, h=thk).center(),cylinder(r=rLink,h=thk).center().move(x=length))
hornSpace = hull(cylinder(rLink+play,h=thkIn+play).center(), cylinder(rLink+play,h=thkIn+play).center().move(x=shortLink), cylinder(0.1,h=thkIn+play).center().move(x=shortLink+3*rLink,y=rLink))

scene = ( baseBody 
	    - screwHoles 
	    - hornSpace).rot(x=90)

scad_render_to_file(scene, 'preview.scad', '$fs=.75;')