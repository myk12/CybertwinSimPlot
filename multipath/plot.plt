set term pdfcairo enhanced color size 50cm, 12cm
set output 'multipath.pdf'
set grid
set grid xtics ytics
#set object 1 rectangle behind from graph 0,0 to graph 1,1 fc rgb "#EFEFEF" fillstyle solid noborder
#unset border

# MACROS

set multiplot layout 1,3

######################
#    Plot Figure 1   #
######################

set key font ",17" box reverse
set origin 0.01,0.1; set size 0.33, 0.9;
set xlabel "Time (s)" font ",25"
set ylabel "Throughput (Mbps)" font ",25"
set yrange [0:200]
set xrange [0:10]

set title "a) Throughput comparision between SP and MP" font ",30" offset 0, -35.5
plot "data/SinglePath_100_100.dat" using 1:2 title "SP 100Mbps + 100Mbps" with lines, \
     "data/MultiPath_100_100.dat" using 1:2 title  "MP  100Mbps + 100Mbps" with lines

unset ylabel
######################
#    Plot Figure 2   #
######################
set origin 0.34,0.1; set size 0.33, 0.9;
set title "b) Throughput comparision of SP"
plot  "data/SinglePath_50_100.dat" using 1:2 title "SP 50Mbps + 50Mbps" with lines, \
    "data/MultiPath_50_50.dat" using 1:2 title "SP 100Mbps + 50Mbps" with lines, \
    "data/SinglePath_100_100.dat" using 1:2 title "SP 100Mbps + 100Mbps" with lines

######################
#    Plot Figure 3   #
######################
set origin 0.67,0.1; set size 0.33, 0.9;
set title "c) Throughput comparision of MP"
plot   "data/MultiPath_50_50.dat" using 1:2 title    "MP 50Mbps  + 50Mbps" with lines, \
       "data/MultiPath_100_50.dat" using 1:2 title   "MP 100Mbps + 50Mbps" with lines, \
       "data/MultiPath_100_100.dat" using 1:2 title  "MP 100Mbps + 100Mbps" with lines

unset multiplot
