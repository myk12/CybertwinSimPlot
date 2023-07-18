# set pdfcairo as the terminal for output
set terminal pdfcairo enhanced color size 17cm,17cm font 'Times,12' linewidth 2
set output "output.pdf"
set grid
set xrange [0:600]
set yrange [0:160]

###############################################
#        STYLE one: 3x2 multiplot             #
###############################################
#
# set layout of the multiplot
set multiplot layout 3,2
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

# 绘制policing目录下的80Mbps子图
unset ylabel
set title "Policing - 80Mbps"
plot dataDir."policing/80Mbps/recv.dat" using 1:2 notitle with lines linecolor "#009E73", \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor "#009E73", \
     dataDir."policing/80Mbps/policed.dat" using 1:2 notitle with lines linecolor "#9400D3", \
     "" using 1:2 title "Policed" with filledcurves y1=0  fill transparent pattern 5 fillcolor "#9400D3", \

# 绘制shaping目录下的100Mbps子图
set ylabel "Throughput (Mbps)"
set title "Shaping - 100Mbps"
plot dataDir."shaping/100Mbps/recv.dat" using 1:2 notitle with lines linecolor "#009E73", \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor "#009E73", \
     dataDir."shaping/100Mbps/shaped.dat" using 1:2 notitle with lines linecolor "#E69F00", \
     "" using 1:2 title "Shaped" with filledcurves y1=0  fill transparent pattern 5 fillcolor "#E69F00", \


# 绘制policing目录下的100Mbps子图
unset ylabel
set title "Policing - 100Mbps"
plot dataDir."policing/100Mbps/recv.dat" using 1:2 notitle with lines linecolor "#009E73", \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor "#009E73", \
     dataDir."policing/100Mbps/policed.dat" using 1:2 notitle with lines linecolor "#9400D3", \
     "" using 1:2 title "Policed" with filledcurves y1=0  fill transparent pattern 5 fillcolor "#9400D3", \

# 绘制shaping目录下的120Mbps子图
set xlabel "Time (ms)"
set ylabel "Throughput (Mbps)"
set title "Shaping - 120Mbps"
plot dataDir."shaping/120Mbps/recv.dat" using 1:2 notitle with lines linecolor "#009E73", \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor "#009E73", \
     dataDir."shaping/120Mbps/shaped.dat" using 1:2 notitle with lines linecolor "#E69F00", \
     "" using 1:2 title "Shaped" with filledcurves y1=0  fill transparent pattern 5 fillcolor "#E69F00", \


# 绘制policing目录下的120Mbps子图
unset ylabel
set title "Policing - 120Mbps"
plot dataDir."policing/120Mbps/recv.dat" using 1:2 notitle with lines linecolor "#009E73", \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor "#009E73", \
     dataDir."policing/120Mbps/policed.dat" using 1:2 notitle with lines linecolor "#9400D3", \
     "" using 1:2 title "Policed" with filledcurves y1=0  fill transparent pattern 5 fillcolor "#9400D3", \

# 结束图像的绘制
unset multiplot


###############################################
#        STYLE one: 3x2 multiplot             #
###############################################
#
# set layout of the multiplot
set multiplot layout 3,2
dataDir="trafficShaping/"
recvColor="#009E73"
shapedColor="#E69F00"
policedColor="#9400D3"
set object 1 rectangle behind from graph 0,0 to graph 1,1 fc rgb "#EEEEEE" fillstyle solid noborder

# 绘制shaping目录下的80Mbps子图
# plot shaping directory's 80Mbps subgraph
set ylabel "Throughput (Mbps)"
set title "Shaping - 80Mbps"
plot dataDir."shaping/80Mbps/recv.dat" using 1:2 notitle with lines linecolor "#009E73", \
    "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor "#009E73", \
     dataDir."shaping/80Mbps/shaped.dat" using 1:2 notitle with lines linecolor "#9400D3", \
     "" using 1:2 title "Shaped" with filledcurves y1=0  fill transparent pattern 5 fillcolor "#9400D3", \

# 绘制policing目录下的80Mbps子图
unset ylabel
set title "Policing - 80Mbps"
plot dataDir."policing/80Mbps/recv.dat" using 1:2 notitle with lines linecolor "#009E73", \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor "#009E73", \
     dataDir."policing/80Mbps/policed.dat" using 1:2 notitle with lines linecolor "#9400D3", \
     "" using 1:2 title "Policed" with filledcurves y1=0  fill transparent pattern 5 fillcolor "#9400D3", \

# 绘制shaping目录下的100Mbps子图
set ylabel "Throughput (Mbps)"
set title "Shaping - 100Mbps"
plot dataDir."shaping/100Mbps/recv.dat" using 1:2 notitle with lines linecolor "#009E73", \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor "#009E73", \
     dataDir."shaping/100Mbps/shaped.dat" using 1:2 notitle with lines linecolor "#9400D3", \
     "" using 1:2 title "Shaped" with filledcurves y1=0  fill transparent pattern 5 fillcolor "#9400D3", \



# 绘制policing目录下的100Mbps子图
unset ylabel
set title "Policing - 100Mbps"
plot dataDir."policing/100Mbps/recv.dat" using 1:2 notitle with lines linecolor "#009E73", \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor "#009E73", \
     dataDir."policing/100Mbps/policed.dat" using 1:2 notitle with lines linecolor "#9400D3", \
     "" using 1:2 title "Policed" with filledcurves y1=0  fill transparent pattern 5 fillcolor "#9400D3", \

# 绘制shaping目录下的120Mbps子图
set xlabel "Time (ms)"
set ylabel "Throughput (Mbps)"
set title "Shaping - 120Mbps"
plot dataDir."shaping/120Mbps/recv.dat" using 1:2 notitle with lines linecolor "#009E73", \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor "#009E73", \
     dataDir."shaping/120Mbps/shaped.dat" using 1:2 notitle with lines linecolor "#9400D3", \
     "" using 1:2 title "Shaped" with filledcurves y1=0  fill transparent pattern 5 fillcolor "#9400D3", \


# 绘制policing目录下的120Mbps子图
unset ylabel
set title "Policing - 120Mbps"
plot dataDir."policing/120Mbps/recv.dat" using 1:2 notitle with lines linecolor "#009E73", \
     "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4 fillcolor "#009E73", \
     dataDir."policing/120Mbps/policed.dat" using 1:2 notitle with lines linecolor "#9400D3", \
     "" using 1:2 title "Policed" with filledcurves y1=0  fill transparent pattern 5 fillcolor "#9400D3", \

# 结束图像的绘制
unset multiplot



###############################################
#        STYLE two: 3x2 multiplot             #
###############################################
# set layout of the multiplot
set multiplot layout 3,2
dataDir="trafficShaping/"
recvColor="#009E73"
shapedColor="#E69F00"
policedColor="#9400D3"

# 绘制shaping目录下的80Mbps子图
# plot shaping directory's 80Mbps subgraph
set ylabel "Throughput (Mbps)"
set title "Shaping - 80Mbps"
plot dataDir."shaping/80Mbps/recv.dat" using 1:2 title "Received" with filledcurves y1=0  fill transparent solid 0.5 , \
     dataDir."shaping/80Mbps/shaped.dat" using 1:2 title "Shaped" with filledcurves y1=0  fill transparent solid 0.5 , \

# 绘制policing目录下的80Mbps子图
unset ylabel
set title "Policing - 80Mbps"
plot dataDir."policing/80Mbps/recv.dat" using 1:2 title "Received" with filledcurves y1=0  fill transparent solid 0.5, \
     dataDir."policing/80Mbps/policed.dat" using 1:2 title "Policed" with filledcurves y1=0  fill transparent solid 0.5, \

# 绘制shaping目录下的100Mbps子图
set ylabel "Throughput (Mbps)"
set title "Shaping - 100Mbps"
plot dataDir."shaping/100Mbps/recv.dat" using 1:2 title "Received" with filledcurves y1=0  fill transparent solid 0.5, \
     dataDir."shaping/100Mbps/shaped.dat" using 1:2 title "Shaped" with filledcurves y1=0  fill transparent solid 0.5, \


# 绘制policing目录下的100Mbps子图
unset ylabel
set title "Policing - 100Mbps"
plot dataDir."policing/100Mbps/recv.dat" using 1:2 title "Received" with filledcurves y1=0  fill transparent solid 0.5, \
     dataDir."policing/100Mbps/policed.dat" using 1:2 title "Policed" with filledcurves y1=0  fill transparent solid 0.5, \

# 绘制shaping目录下的120Mbps子图
set xlabel "Time (ms)"
set ylabel "Throughput (Mbps)"
set title "Shaping - 120Mbps"
plot dataDir."shaping/120Mbps/recv.dat" using 1:2 title "Received" with filledcurves y1=0  fill transparent solid 0.5, \
     dataDir."shaping/120Mbps/shaped.dat" using 1:2 title "Shaped" with filledcurves y1=0  fill transparent solid 0.5, \


# 绘制policing目录下的120Mbps子图
unset ylabel
set title "Policing - 120Mbps"
plot dataDir."policing/120Mbps/recv.dat" using 1:2 title "Received" with filledcurves y1=0  fill transparent solid 0.5, \
     dataDir."policing/120Mbps/policed.dat" using 1:2 title "Policed" with filledcurves y1=0  fill transparent solid 0.5, \

# 结束图像的绘制
unset multiplot
