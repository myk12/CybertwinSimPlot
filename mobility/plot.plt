set term pdfcairo enhanced color size 50cm, 12cm
set output 'heatmap.pdf'

set xlabel "edge delay(ms)" font ", 20"
set ylabel "core delay(ms)" font ", 20"
set xtics font ", 20"
set ytics font ", 20"

#set palette maxcolors 2500
#set cbtics 0,100,2500 scale 2 offset -3.5, 1.5
#set cbrange [0:2500]

set multiplot layout 1,3

set datafile separator comma
unset border
######################
#    Plot Figure 1   #
######################
set origin 0.01,0.1; set size 0.33, 0.9;
set palette defined (0 '#ffffff', 0.5 '#008000', 1 '#ffd700')
set cbrange [10:300]
set title "a) local heatmap" font ",30" offset 0, -35.5
plot "data/local.mat" matrix rowheaders columnheaders using 1:2:3 with image


######################
#    Plot Figure 2   #
######################
set origin 0.34,0.1; set size 0.33, 0.9;
set palette defined (0 '#008000', 0.5 '#ffd700', 1 '#8b0000')
set cbrange [120:600]
set title "b) global heatmap"
plot "data/global.mat" matrix rowheaders columnheaders using 1:2:3 with image

######################
#    Plot Figure 3   #
######################
set origin 0.67,0.1; set size 0.33, 0.9;
set palette defined (0 '#ffd700', 0.5 '#8b0000', 1 '#110000')
set cbrange [1000:2000]
set title "c) naive heatmap"
plot "data/naive.mat" matrix rowheaders columnheaders using 1:2:3 with image

unset multiplot
