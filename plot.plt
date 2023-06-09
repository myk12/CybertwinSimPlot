set term pdfcairo enhanced color size 30cm, 10cm
set output 'multiplot.pdf'
set grid

# MACROS
MOBILITY_DIR="mobility"
MULTIPATH_DIR="multipath"


set multiplot layout 2,3

######################
#    Plot Figure 1   #
######################

set origin 0,0.5
set key font ",7"
#set xlabel "Time (s)" font ",10"
set ylabel "Throughput (Mbps)" font ",10"
plot MULTIPATH_DIR . "/SinglePath_50_50.dat" using 1:2 title "SinglePath 50Mbps + 50Mbps" with lines, \
     MULTIPATH_DIR . "/MultiPath_50_50.dat" using 1:2 title  "Multipath  50Mbps + 50Mbps" with lines

######################
#    Plot Figure 2   #
######################
set origin 0.33,0.5
plot  MULTIPATH_DIR . "/MultiPath_100_50.dat" using 1:2 title "Multipath 100Mbps + 50Mbps" with lines

######################
#    Plot Figure 3   #
######################
set origin 0,0
set xlabel "Time (s)" font ",10"
#set title "Throughput comparision"
plot   "multipath/MultiPath_50_50.dat" using 1:2 title    "Multipath 50Mbps  + 50Mbps" with lines, \
       "multipath/MultiPath_100_50.dat" using 1:2 title   "Multipath 100Mbps + 50Mbps" with lines, \
       "multipath/MultiPath_100_100.dat" using 1:2 title  "Multipath 100Mbps + 100Mbps" with lines

######################
#    Plot Figure 4   #
######################
set origin 0.33,0
plot   "multipath/SinglePath_100_50.dat" using 1:2 title "Singlepath 100Mbps + 50Mbps" with lines

unset grid

#####################################
#    Plot Figure Mobility support   #
#####################################
set origin 0.66,0.5
set size 0.3, 0.5

set title "Delay of receiving the first data packet"
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
