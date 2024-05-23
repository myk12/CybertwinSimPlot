############# STEP [4] #############
# plot using gnuplot
echo "******* 4 - Plot the results *******\n"
#!/bin/bash

# 直接嵌入gnuplot脚本
gnuplot << EOF
# plot_script.gp

# 设置绘图样式
set terminal pdfcairo enhanced color size 8cm, 4cm font 'Arial, 10, bold' 
#set object 1 rectangle from graph 0,0 to graph 1,1 behind fillcolor rgb '#EEEEEE' fillstyle solid noborder
set output 'plot.pdf'
unset border

set datafile separator ","

set yrange [0:2]
set xrange [0:4]

# 设置轴标签
set xlabel 'Time (s)'
set ylabel 'Data rate (Mbps)'
set grid

# set bold line

# 绘制折线图
# plot a line in black
set object 2 rect from 1, 0 to 1.1, 2 fc rgb "#9E9E9E" fs solid border lw 1
set object 3 rect from 2, 0 to 2.1, 2 fc rgb "#9E9E9E" fs solid border lw 1
set object 4 rect from 3, 0 to 3.1, 2 fc rgb "#9E9E9E" fs solid border lw 1

set label "movement" at 0.5, 1.7 center tc rgb "#555555" font "Arial, 10, bold"
set arrow from 0.7, 1.6 to 1, 1.5 lc rgb "#555555" lw 2

plot 'mobility_test_off.csv' using 1:3 with lines  lw 3 lc "#0072BB" title 'W/o ID-aware Routing', \
     'mobility_test_on.csv' using 1:3 with lines dashtype '-' lt 2 lw 3 lc "#4CAF50" title 'W/ ID-aware Routing'
EOF

