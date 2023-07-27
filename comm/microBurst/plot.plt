# 设置输出为PDF格式
#set terminal pdfcairo enhanced color size 20cm,5cm
#set object 1 rectangle behind from graph 0,0 to graph 1,1 fc rgb "#EEEEEE" fillstyle solid noborder
set terminal pngcairo enhanced color size 40cm,10cm
#set size ratio 0.2
set output "output.png"
#unset border

# 设置图像的布局为一列三行
#set multiplot layout 3,1


set ylabel "Throughput (Mbps)"
set xlabel "Time bin"
set xrange [0:50]
set yrange [0:200]

set grid

# 绘制第一个子图，使用100ms.log的所有数据
set multiplot layout 1,3 title "Throughput (Mbps) under different time bin"
plot "< tail -n 50 100ms.log" using :2 with lines linewidth 3 title "100ms range"
plot "< tail -n 50 10ms.log" using :2 with lines linewidth 3  title "10ms range"
plot "< tail -n 50 1ms.log" using :2 with lines linewidth 3 title "1ms range"


