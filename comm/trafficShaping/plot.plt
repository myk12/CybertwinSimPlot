set term pdfcairo enhanced color size 10,6 font 'Times,20' 
set output "shaping.pdf"

set xlabel "time(ms)"
set ylabel "Throughput(Mbps)"
set title "Throughput vs Time"
set grid

# 设置填充区域颜色和透明度
set style fill transparent solid 0.5

set linetype 1 linewidth 2

recvData = "recv.log"
shapingData = "shaping.log"

set style fill border -1

plot recvData using 1:2 title "Received Throughput (Mbps)" with lines linewidth 3 , \
    "" using 1:2 title "Received" with filledcurves y1=0  fillstyle transparent solid 0.3, \
    shapingData using 1:2 title "Shaped Throughput (Mbps)" with lines linewidth 3 , \
    "" using 1:2 title "Shaped" with filledcurves y1=0  fillstyle transparent solid 0.3