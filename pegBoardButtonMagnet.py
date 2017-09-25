from solid import *
from solid import extensions
from math import *

scene = cylinder(h=5,d=5)


if __name__ == '__main__':
	scad_render_to_file(scene, 'preview.scad', '$fs=.75;')