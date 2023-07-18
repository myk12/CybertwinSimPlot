set term pdfcairo enhanced color size 16cm,12cm font 'Times,20' 
#set object 1 rectangle behind from graph 0,0 to graph 1,1 fc rgb "#EEEEEE" fillstyle solid noborder
set output "shaping.pdf"
#unset border
set xlabel "time(ms)"
set ylabel "Throughput(Mbps)"
set title "Throughput vs Time"
set grid

# 设置填充区域颜色和透明度
set style fill transparent solid 0.5

set linetype 1 linewidth 2

recvData = "recv.log"
shapingData = "shaping.log"
policingData = "policing.log"

set style fill border -1
set style fill transparent pattern 4
plot recvData using 1:2 title "Received" with filledcurves y1=0  fillstyle transparent solid 0.7 fillcolor "#9400D3", \
    shapingData using 1:2 title "Shaped" with filledcurves y1=0  fillstyle transparent solid 0.7 fillcolor "#009E73"

plot recvData using 1:2  with lines linewidth 1 notitle, \
    "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 20, \
    shapingData using 1:2 with lines linewidth 1 notitle, \
    "" using 1:2 title "Shaped" with filledcurves y1=0  fill transparent pattern 21



plot recvData using 1:2  with lines linewidth 2 linecolor "#009E73" notitle, \
    "" using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4, \
    shapingData using 1:2 with lines linewidth 2 linecolor "#E69F00" notitle, \
    "" using 1:2 title "Shaped" with filledcurves y1=0  fill transparent pattern 5

plot recvData using 1:2  with lines linewidth 2 linecolor "#009E73"  notitle, \
    recvData using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4, \
    policingData using 1:2 with lines linewidth 2 linecolor "#E69F00"  notitle, \
    policingData using 1:2 title "Policed" with filledcurves y1=0  fill transparent pattern 5

plot recvData using 1:2 title "Received" with filledcurves y1=0  fill transparent pattern 4, \
    policingData using 1:2 title "Policed" with filledcurves y1=0  fill transparent pattern 5



#plot recvData using 1:2 title "Received Throughput (Mbps)" with lines linewidth 3 , \
#    "" using 1:2 title "Received" with filledcurves y1=0  fillstyle transparent solid 0.3, \
#    shapingData using 1:2 title "Shaped Throughput (Mbps)" with lines linewidth 3 , \
#    "" using 1:2 title "Shaped" with filledcurves y1=0  fillstyle transparent solid 0.3

#plot recvData using 1:2 title "Received Throughput (Mbps)" with lines linewidth 3 , \
#    "" using 1:2 title "Received" with filledcurves y1=0  fillstyle transparent solid 0.3, \
#    policingData using 1:2 title "Policed Throughput (Mbps)" with lines linewidth 3 , \
#    "" using 1:2 title "Policed" with filledcurves y1=0  fillstyle transparent solid 0.3