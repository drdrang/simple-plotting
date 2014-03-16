# Simple plotting #

Two simple scripts for creating plots from the command line: one for plotting functions and the other for plotting points. The scripts require the [NumPy][1] and [matplotlib][2] modules.

The graphs produced aren't intended to be of publication quality. The goal is to make readable graphs very quickly.

## Functions ##

For these, everything is given on the command line.

    plot 'function(s)' minx maxx [miny maxy]

Three arguments are required: the function itself, which would normally be enclosed in quotes to avoid problems with shell interpretation; the minimum x value; and the maximum x value. The last two arguments, the minimum and maximum y values are optional—if they aren't given, the script will figure them out. A common reason to specify the y limits is if the function "blows up" between the x limits and the extreme y values make the rest of the graph look flat.

The function can include any Python expression or function, including those in the NumPy library. There's no need to use a `numpy` prefix. 

More than one function can be specified; separate them with a semicolon. Thus, something like

    plot 'tan(x); x' pi 3*pi/2-.01 0 5

can be used to find the intersection of the two given functions. This example also shows that you can use expressions in the limits.

The result of `plot` is an 800×600 PNG image that's sent to standard output. Normally, this would be redirected to a file,

    plot 'tan(x); x' pi 3*pi/2-.01 0 5 > plot.png

and viewed in whatever graphics program the user prefers. No controls for tick marks or grid spacing are provided—this is quick and dirty plotting.

<img src="http://farm8.staticflickr.com/7449/11444287224_fdf3652083.jpg" alt="Two-function plot" title="Two-function plot" />

A PDF can be produced by using the `-p` or `--pdf` switch:

    plot -p 'tan(x); x' pi 3*pi/2-.01 0 5 > plot.png

Given that both PNG and PDF start with "p," the `-p` switch is poorly named, but I couldn't think of a better one.

## Points ##

The script that plots lists of points, `pplot`, gets its data from standard input. On the Mac, it would be common to pass data in from the clipboard this way:

    pbpaste | pplot

As with `plot`, `pplot` produces an 800×600 PNG image that's sent to standard output, so one would normally redirect this to a file:

    pbpaste | pplot > plot.png

Each line of the input data represents one (x, y) point. The x and y values can be separated by tabs, spaces, or commas.

Normally, `pplot` plots the points only. If you want to connect the points with a line, use the `-l` option:

    pbpaste | pplot -l > plot.png



[1]: http://www.numpy.org/
[2]: http://matplotlib.org/
