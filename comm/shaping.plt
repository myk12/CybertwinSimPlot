# set pdfcairo as the terminal for output
set terminal pngcairo enhanced color size 46cm,11cm font 'Times,12' linewidth 2
set output "output.png"
set grid
set xrange [0:600]
set yrange [0:160]
set xlabel "Time (ms)"

###############################################
#        STYLE one: 3x2 multiplot             #
###############################################
#
# set layout of the multiplot
set multiplot layout 1,3
dataDir="trafficShaping/"
recvColor="#009E73"
shapedColor="#E69F00"
policedColor="#9400D3"
#set object 1 rectangle behind from graph 0,0 to graph 1,1 fc rgb "#EEEEEE" fillstyle solid noborder

# 绘制shaping目录下的80Mbps子图
# plot shaping directory's 80Mbps subgraph
set ylabel "Throughput (Mbps)"
set title "Shaping - 80Mbps"
plot dataDir."shaping/80Mbps/recv.dat" using 1:2 notitle with lines linecolor "#009E73", \
    "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor "#009E73", \
     dataDir."shaping/80Mbps/shaped.dat" using 1:2 notitle with lines linecolor "#9400D3", \
     "" using 1:2 title "Shaped" with filledcurves y1=0  fill transparent pattern 5 fillcolor "#9400D3", \

# 绘制shaping目录下的100Mbps子图
set ylabel "Throughput (Mbps)"
set title "Shaping - 100Mbps"
plot dataDir."shaping/100Mbps/recv.dat" using 1:2 notitle with lines linecolor "#009E73", \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor "#009E73", \
     dataDir."shaping/100Mbps/shaped.dat" using 1:2 notitle with lines linecolor "#9400D3", \
     "" using 1:2 title "Shaped" with filledcurves y1=0  fill transparent pattern 5 fillcolor "#9400D3", \


# 绘制shaping目录下的120Mbps子图
set ylabel "Throughput (Mbps)"
set title "Shaping - 120Mbps"
plot dataDir."shaping/120Mbps/recv.dat" using 1:2 notitle with lines linecolor "#009E73", \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor "#009E73", \
     dataDir."shaping/120Mbps/shaped.dat" using 1:2 notitle with lines linecolor "#9400D3", \
     "" using 1:2 title "Shaped" with filledcurves y1=0  fill transparent pattern 5 fillcolor "#9400D3", \

# 结束图像的绘制
unset multiplot
