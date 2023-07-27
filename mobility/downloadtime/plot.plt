# 设置绘图属性
set terminal pngcairo enhanced color size 16cm,12cm font 'Times,12' linewidth 2
set output "output.png"
set title "Offline Download Time"
set xlabel "Data Point"
set ylabel "Download Time"
set grid
unset border

# 定义数据文件
datafile = "offlineDownload.log"
set datafile separator " "

set yrange [0.8:1.4]
set ytics 0.8, 0.2, 1.4
set xrange [0:5]

set style line 1 lc rgb '#0060ad' lt 1 lw 2 pt 7 pi -1 ps 1.5
set pointintervalbox 3

plot datafile using 0:1 with linespoints pt 5 lw 2  title "Column 1", \
     datafile using 0:($1+$2) with linespoints pt 5 lw 2 title "Column 1 + Column 2"

