#set term pdfcairo enhanced color size 50cm, 12cm
#set output 'multipath.pdf'
set terminal pngcairo enhanced color size 60cm, 17cm linewidth 2
set output 'multipath.png'
set grid
set grid xtics ytics
#set object 1 rectangle behind from graph 0,0 to graph 1,1 fc rgb "#EFEFEF" fillstyle solid noborder
#unset border

# MACROS

set multiplot layout 1,3

######################
#    Plot Figure 1   #
######################
set xlabel "Time (s)"
set ylabel "Throughput (Mbps)"
set yrange [0:200]
set xrange [0:10]

#set title "a) Throughput comparision between SP and MP" font ",30" offset 0, -35.5
set title "a) Throughput comparision between SP and MP"
plot "data/SinglePath_100_100.dat" using 1:2 title "SP 100Mbps and 100Mbps" with lines, \
     "data/MultiPath_100_100.dat" using 1:2 title  "MP  100Mbps and 100Mbps" with lines

unset ylabel
######################
#    Plot Figure 2   #
######################
set title "b) Throughput comparision of Single Path"
plot  "data/SinglePath_50_100.dat" using 1:2 title "50Mbps and 50Mbps" with lines, \
    "data/MultiPath_50_50.dat" using 1:2 title "100Mbps and 50Mbps" with lines, \
    "data/SinglePath_100_100.dat" using 1:2 title "100Mbps and 100Mbps" with lines

######################
#    Plot Figure 3   #
######################
set title "c) Throughput comparision of Multi Path"
plot   "data/MultiPath_50_50.dat" using 1:2 title    "50Mbps  and 50Mbps" with lines, \
       "data/MultiPath_100_50.dat" using 1:2 title   "100Mbps and 50Mbps" with lines, \
       "data/MultiPath_100_100.dat" using 1:2 title  "100Mbps and 100Mbps" with lines

unset multiplot
