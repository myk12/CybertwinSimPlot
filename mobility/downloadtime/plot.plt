# 设置绘图属性
set terminal pdfcairo enhanced color size 8cm,6cm  linewidth 2
#set object 1 rectangle behind from graph 0,0 to graph 1,1 fc rgb "#EFEFEF" fillstyle solid noborder
set output "mobility.pdf"
set title "10MB file Download Time of Different Protocols"
set xlabel "Offline Time (100ms)"
set ylabel "Download Time (s)"
set grid

# 定义数据文件
datafile = "offlineDownload.log"
set datafile separator " "

set yrange [0.8:1.4]
set ytics 0.8, 0.2, 1.4
set xrange [0:5]

set style line 1 lc rgb '#0060ad' lt 1 lw 2 pt 7 pi -1 ps 1
set pointintervalbox 3

plot datafile using 0:1 with linespoints pt 9 lw 2  title "Cybertwin", \
     datafile using 0:($1+$2) with linespoints pt 13 lw 2 title "end-to-end"

