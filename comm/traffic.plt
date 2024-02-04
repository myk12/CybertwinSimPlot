# set pdfcairo as the terminal for output
set terminal pdfcairo enhanced color size 15cm,15cm linewidth 2
set output "trafficShapingPolicing.pdf"
set grid
set xrange [0:600]
set yrange [0:200]
unset border


###############################################
#        STYLE one: 3x2 multiplot             #
###############################################
#
# set layout of the multiplot
set multiplot layout 3,2
dataDir="trafficShaping/"
recvColor="#555555"
shapedColor="#0072BB"
policedColor="#4CAF50"

# 绘制shaping目录下的80Mbps子图
# plot shaping directory's 80Mbps subgraph
set ylabel "Throughput (Mbps)"
set title "Shaping - 80Mbps"
plot dataDir."shaping/80Mbps/recv.dat" using 1:2 notitle with lines linecolor rgb recvColor, \
    "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor rgb recvColor, \
     dataDir."shaping/80Mbps/shaped.dat" using 1:2 notitle with lines linecolor rgb shapedColor, \
     "" using 1:2 title "Shaped" with filledcurves y1=0  fill transparent pattern 5 fillcolor rgb shapedColor, \

# 绘制policing目录下的80Mbps子图
unset ylabel
set title "Policing - 80Mbps"
plot dataDir."policing/80Mbps/recv.dat" using 1:2 notitle with lines linecolor rgb recvColor, \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor rgb recvColor, \
     dataDir."policing/80Mbps/policed.dat" using 1:2 notitle with lines linecolor rgb policedColor, \
     "" using 1:2 title "Policed" with filledcurves y1=0  fill transparent pattern 5 fillcolor rgb policedColor, \

# 绘制shaping目录下的100Mbps子图
set ylabel "Throughput (Mbps)"
set title "Shaping - 100Mbps"
plot dataDir."shaping/100Mbps/recv.dat" using 1:2 notitle with lines linecolor rgb recvColor, \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor rgb recvColor, \
     dataDir."shaping/100Mbps/shaped.dat" using 1:2 notitle with lines linecolor rgb shapedColor, \
     "" using 1:2 title "Shaped" with filledcurves y1=0  fill transparent pattern 5 fillcolor rgb shapedColor, \


# 绘制policing目录下的100Mbps子图
unset ylabel
set title "Policing - 100Mbps"
plot dataDir."policing/100Mbps/recv.dat" using 1:2 notitle with lines linecolor rgb recvColor, \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor rgb recvColor, \
     dataDir."policing/100Mbps/policed.dat" using 1:2 notitle with lines linecolor rgb policedColor, \
     "" using 1:2 title "Policed" with filledcurves y1=0  fill transparent pattern 5 fillcolor rgb policedColor, \

# 绘制shaping目录下的120Mbps子图
set xlabel "Time (ms)"
set ylabel "Throughput (Mbps)"
set title "Shaping - 120Mbps"
plot dataDir."shaping/120Mbps/recv.dat" using 1:2 notitle with lines linecolor rgb recvColor, \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor rgb recvColor, \
     dataDir."shaping/120Mbps/shaped.dat" using 1:2 notitle with lines linecolor rgb shapedColor, \
     "" using 1:2 title "Shaped" with filledcurves y1=0  fill transparent pattern 5 fillcolor rgb shapedColor, \


# 绘制policing目录下的120Mbps子图
unset ylabel
set title "Policing - 120Mbps"
plot dataDir."policing/120Mbps/recv.dat" using 1:2 notitle with lines linecolor rgb recvColor, \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor rgb recvColor, \
     dataDir."policing/120Mbps/policed.dat" using 1:2 notitle with lines linecolor rgb policedColor, \
     "" using 1:2 title "Policed" with filledcurves y1=0  fill transparent pattern 5 fillcolor rgb policedColor, \

# 结束图像的绘制
unset multiplot