# 设置输出为PDF格式
#set terminal pngcairo enhanced color size 40cm,10cm
set terminal pdfcairo enhanced color size 18cm,4cm linewidth 2
#set object 1 rectangle behind from graph 0,0 to graph 1,1 fc rgb "#EEEEEE" fillstyle solid noborder
#set size ratio 0.2
set output "microburst.pdf"
unset border

# 设置图像的布局为一列三行
#set multiplot layout 3,1


set ylabel "Throughput (Mbps)"
set xrange [0:50]
set yrange [0:200]

set grid

# 绘制第一个子图，使用100ms.log的所有数据
#set multiplot layout 1,3 title "Throughput (Mbps) under different time bin"
set object 1 rectangle from 20, graph 0 to 25, graph 1 behind fillcolor rgb "#DEDEDE" fillstyle solid noborder
set multiplot layout 1,3
set xlabel "Time bin (100ms)"
plot "< tail -n 50 100ms.log" using :2 with lines linecolor rgb "#3498DB"   title "100ms range"
unset ylabel
set object 1 rectangle from 35, graph 0 to 40, graph 1 behind fillcolor rgb "#DEDEDE" fillstyle solid noborder
set xlabel "Time bin (10ms)"
plot "< tail -n 50 10ms.log" using :2 with lines linecolor rgb "#3498DB"   title "10ms range"
set xlabel "Time bin (1ms)"
unset object 1
plot "< tail -n 50 1ms.log" using :2 with lines linecolor rgb "#3498DB" title "1ms range"


