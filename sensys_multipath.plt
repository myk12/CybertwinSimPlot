set term pdfcairo enhanced color size 8cm, 4cm
set output 'multipath.pdf'
set grid
unset border

# MACROS
MULTIPATH_DIR="multipath/"

########################################################
#              Plot Figure - Multipath Test            #
########################################################
set xlabel "Time (s)"
set ylabel "Throughput (Mbps)"
set yrange [0:250]
set xrange [0:7]
set key font ",10"

#plot  MULTIPATH_DIR . "data/MultiPath_100_100.dat" using 1:2 title  "L1 100Mbps, L2 100Mbps" with lines linecolor rgb "#0072BB", \
#      MULTIPATH_DIR . "data/MultiPath_100_50.dat" using 1:2 title   "L1 100Mbps, L2  50Mbps" with lines linecolor rgb "#4CAF50", \
#      MULTIPATH_DIR . "data/MultiPath_50_50.dat" using 1:2 title    "L1  50Mbps, L2  50Mbps" with lines linecolor rgb "#FF5722"

#plot with default color
# bold line and with default color
plot  MULTIPATH_DIR . "data/MultiPath_100_100.dat" using 1:2 title  "L1 100Mbps, L2 100Mbps" with lines lw 1.5, \
      MULTIPATH_DIR . "data/MultiPath_100_50.dat" using 1:2 title   "L1 100Mbps, L2  50Mbps" with lines lw 1.5, \
      MULTIPATH_DIR . "data/MultiPath_50_50.dat" using 1:2 title    "L1  50Mbps, L2  50Mbps" with lines lw 1.5



