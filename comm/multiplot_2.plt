# set pdfcairo as the terminal for output
set terminal pdfcairo enhanced color size 14cm,8cm font 'Times,12' linewidth 2
set output "output.pdf"
set grid
set xrange [0:600]
set yrange [0:200]
unset border

###############################################
#        STYLE one: 2x2 multiplot             #
###############################################
#
# set layout of the multiplot
set multiplot layout 2,2
dataDir="trafficShaping/"
recvColor="#009E73"
shapedColor="#E69F00"
policedColor="#9400D3"

# 绘制shaping目录下的80Mbps子图
# plot shaping directory's 80Mbps subgraph
set ylabel "Throughput (Mbps)"
set title "Shaping - 80Mbps"
plot dataDir."shaping/80Mbps/recv.dat" using 1:2 notitle with lines linecolor "#009E73", \
    "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor "#009E73", \
     dataDir."shaping/80Mbps/shaped.dat" using 1:2 notitle with lines linecolor "#E69F00", \
     "" using 1:2 title "Shaped" with filledcurves y1=0  fill transparent pattern 5 fillcolor "#E69F00", \

# 绘制shaping目录下的120Mbps子图
set xlabel "Time (ms)"
unset ylabel
set title "Shaping - 120Mbps"
plot dataDir."shaping/120Mbps/recv.dat" using 1:2 notitle with lines linecolor "#009E73", \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor "#009E73", \
     dataDir."shaping/120Mbps/shaped.dat" using 1:2 notitle with lines linecolor "#E69F00", \
     "" using 1:2 title "Shaped" with filledcurves y1=0  fill transparent pattern 5 fillcolor "#E69F00", \


# 绘制policing目录下的80Mbps子图

set ylabel "Throughput (Mbps)"
set title "Policing - 80Mbps"
plot dataDir."policing/80Mbps/recv.dat" using 1:2 notitle with lines linecolor "#009E73", \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor "#009E73", \
     dataDir."policing/80Mbps/policed.dat" using 1:2 notitle with lines linecolor "#9400D3", \
     "" using 1:2 title "Policed" with filledcurves y1=0  fill transparent pattern 5 fillcolor "#9400D3", \



# 绘制policing目录下的120Mbps子图
unset ylabel
set title "Policing - 120Mbps"
plot dataDir."policing/120Mbps/recv.dat" using 1:2 notitle with lines linecolor "#009E73", \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor "#009E73", \
     dataDir."policing/120Mbps/policed.dat" using 1:2 notitle with lines linecolor "#9400D3", \
     "" using 1:2 title "Policed" with filledcurves y1=0  fill transparent pattern 5 fillcolor "#9400D3", \
