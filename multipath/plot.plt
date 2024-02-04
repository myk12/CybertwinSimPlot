#set term pdfcairo enhanced color size 50cm, 12cm
#set output 'multipath.pdf'
set terminal pdfcairo enhanced color size 23cm, 6cm linewidth 2
set output 'multipath.pdf'
set grid
set grid xtics ytics
#set object 1 rectangle behind from graph 0,0 to graph 1,1 fc rgb "#EFEFEF" fillstyle solid noborder
unset border

# MACROS

set multiplot layout 1,3

######################
#    Plot Figure 1   #
######################
set xlabel "Time (s)"
set ylabel "Throughput (Mbps)"
set yrange [0:250]
set xrange [0:2]

#set title "a) Throughput comparision between SP and MP" font ",30" offset 0, -35.5
set title "a) MSFP-disabled vs MSFP-enabled"
plot "data/SinglePath_100_100.dat" using 1:2 title "MSFP-disabled" with lines linecolor rgb "#0072BB", \
     "data/MultiPath_100_100.dat" using 1:2 title  "MSFP-enabled" with lines linecolor rgb "#4CAF50"

unset ylabel
######################
#    Plot Figure 2   #
######################
set title "b) MSFP-disabled with different link rates"
plot  "data/SinglePath_50_100.dat" using 1:2  title "L1  50Mbps, L2  50Mbps" with lines linecolor rgb "#0072BB", \
    "data/MultiPath_50_50.dat" using 1:2 title "L1 100Mbps, L2  50Mbps" with lines linecolor rgb "#4CAF50", \
    "data/SinglePath_100_100.dat" using 1:2 title "L1 100Mbps, L2 100Mbps" with lines linecolor rgb "#FF5722"

######################
#    Plot Figure 3   #
######################
set title "c) MSFP-enabled with different link rates"
plot   "data/MultiPath_50_50.dat" using 1:2 title    "L1  50Mbps, L2  50Mbps" with lines linecolor rgb "#0072BB", \
       "data/MultiPath_100_50.dat" using 1:2 title   "L1 100Mbps, L2  50Mbps" with lines linecolor rgb "#4CAF50", \
       "data/MultiPath_100_100.dat" using 1:2 title  "L1 100Mbps, L2 100Mbps" with lines linecolor rgb "#FF5722"

unset multiplot
