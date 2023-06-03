set term pdfcairo enhanced color size 45cm, 10cm
set output 'multiplot.pdf'
set grid

set datafile separator comma
plot '$map3' matrix rowheaders columnheaders using 1:2:3 with image
set datafile separator