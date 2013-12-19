#!/usr/bin/python

from __future__ import division
from numpy import *
import matplotlib.pyplot as plt
import sys

fcns = sys.argv[1].split(';')
minx = eval(sys.argv[2])
maxx = eval(sys.argv[3])
plt.xlim(minx, maxx)
try:
  miny = float(sys.argv[4])
  maxy = float(sys.argv[5])
  plt.ylim(miny, maxy)
except IndexError:
  pass

x = linspace(minx, maxx, 100)
for i, f in enumerate(fcns):
  y = eval(f)
  plt.plot(x, y, "-", linewidth=2)
plt.minorticks_on()
plt.grid(which='both', color='#aaaaaa')
plt.savefig(sys.stdout, format='png')
