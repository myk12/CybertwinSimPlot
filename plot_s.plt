set term pdfcairo enhanced color size 45cm, 10cm
set output 'multiplot.pdf'
set grid

# MACROS
MOBILITY_DIR="mobility"
MULTIPATH_DIR="multipath"

SET_FIGURE1_POS="set origin 0,0; set size 0.25,1;"
SET_FIGURE2_POS="set origin 0.25,0; set size 0.25,1;"
SET_FIGURE3_POS="set origin 0.5,0; set size 0.25,1;"
SET_FIGURE4_POS="set origin 0.75,0; set size 0.25,1;"


set multiplot layout 1,4
unset border

######################
#    Plot Figure 1   #
######################
@SET_FIGURE1_POS
set key font ",10"
set xlabel "Time (s)" font ",10"
set ylabel "Throughput (Mbps)" font ",10"
set yrange [0:200]

set title "a) Throughput comparision 1" font ",15" offset 0,-28.5
set bmargin 5

#set rmargin at screen 0.3
plot MULTIPATH_DIR . "/SinglePath_100_100.dat" using 1:2 title "SinglePath 50Mbps + 50Mbps" with lines, \
     MULTIPATH_DIR . "/MultiPath_100_100.dat" using 1:2 title  "Multipath  50Mbps + 50Mbps" with lines
#unset rmargin

######################
#    Plot Figure 2   #
######################
@SET_FIGURE2_POS
set xlabel "Time (s)" font ",10"
set title "b) Throughput comparision 2" font ",15" offset 0,-28.5
#unset ylabel
#unset ytics
#set tmargin at screen 0.9
#set bmargin at screen 0.1
plot   "multipath/MultiPath_50_50.dat" using 1:2 title    "Multipath 50Mbps  + 50Mbps" with lines, \
       "multipath/MultiPath_100_50.dat" using 1:2 title   "Multipath 100Mbps + 50Mbps" with lines, \
       "multipath/MultiPath_100_100.dat" using 1:2 title  "Multipath 100Mbps + 100Mbps" with lines

unset grid

####################################
#    Plot Figure Zero Trust        #
####################################
@SET_FIGURE3_POS

#####################################
#    Plot Figure Mobility support   #
#####################################
@SET_FIGURE4_POS

set title "c) Delay of receiving the first data packet"
set ylabel "Delays (ms)"
unset xlabel
set style fill solid
set boxwidth 0.9

set style data histograms
set style fill solid 1.00

set tic scale 0
set grid ytics
set yrange [0:2000]
set ytics 0, 500, 2000
set linetype 1 lc rgb "#0034FE"
set linetype 2 lc rgb "#67A1AD"
set linetype 3 lc rgb "#332C49"

#set border 3
plot MOBILITY_DIR . '/mobility-core-10-edge-50.dat'  using 2:xticlabels(1) linecolor 1 title "e2e delay 30ms", \
     MOBILITY_DIR . '/mobility-core-50-edge-50.dat' using 2  linecolor 2 title "e2e delay 50ms", \
     MOBILITY_DIR . '/mobility-core-100-edge-50.dat' using 2 linecolor 3 title "e2e delay 100ms"

unset multiplot
