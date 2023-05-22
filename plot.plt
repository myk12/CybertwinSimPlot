set term pdfcairo enhanced color size 30cm, 10cm
set output 'multiplot.pdf'
set grid

set multiplot layout 2,3

set origin 0,0.5
set key font ",7"
set xlabel "Time (s)" font ",10"
set ylabel "Throughput (Mbps)" font ",10"
plot "SinglePath_50_50.dat" using 1:2 title "SinglePath 50Mbps + 50Mbps" with lines, \
     "MultiPath_50_50.dat" using 1:2 title  "Multipath  50Mbps + 50Mbps" with lines

set origin 0.33,0.5
plot  "MultiPath_100_50.dat" using 1:2 title "Multipath 100Mbps + 50Mbps" with lines

set origin 0,0
plot   "MultiPath_50_50.dat" using 1:2 title    "Multipath 50Mbps  + 50Mbps" with lines, \
       "MultiPath_100_50.dat" using 1:2 title   "Multipath 100Mbps + 50Mbps" with lines, \
       "MultiPath_100_100.dat" using 1:2 title  "Multipath 100Mbps + 100Mbps" with lines

set origin 0.33,0
plot   "SinglePath_100_50.dat" using 1:2 title "Singlepath 100Mbps + 50Mbps" with lines

unset grid
set origin 0.66,0.5
set ylabel "Delays (ms)"
set size 0.3, 0.5
set style fill solid
set boxwidth 0.5
plot "mobility-test.dat" using 2:xtic(1) with boxes lc rgb "#1f77b4" title "Delay"

unset multiplot
