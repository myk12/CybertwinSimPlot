set term pdfcairo enhanced color size 8cm, 4cm
set output 'scalability.pdf'
set grid
unset border

########################################################
#              Scalability Test                        #
########################################################
set grid
# 设置标题

# 设置X轴
set xlabel "Number of Nodes" font ",12"
set xtics rotate by -45
set xtics nomirror

# 设置Y轴 (左边，运行时间)
set ylabel "Runtime (seconds)" font ",12"
set ytics nomirror

# 设置第二个Y轴 (右边，内存占用)
set y2label "Memory Usage (MB)" font ",12"
set y2tics
set format y2 "%.0f"  # 格式化右边的Y轴刻度

set yrange [0:300]
set y2range [0:300]

# 设置柱子样式
set style data histograms
set style histogram cluster gap 1
set style fill solid 1.00 border -1
set boxwidth 0.75

# 读取数据并绘制图形
plot 'scalability/runtime.dat' every ::1 using 2:xtic(1) title 'Runtime' with histograms axes x1y1, \
     'scalability/runtime.dat' every ::1 using ($3/1024):xtic(1) title 'Memory Usage' with histograms axes x1y2


