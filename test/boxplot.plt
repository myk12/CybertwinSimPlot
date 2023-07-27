# 设置输出文件类型和名称
set term png
set output 'throughput_boxplot.png'

# 设置图表样式
set title "Throughput Boxplot"
set xlabel "Credit Score"
set ylabel "Throughput (Mbps)"
set grid

# 定义文件名列表
file_list = "score10.log score20.log score30.log score40.log score50.log score60.log score70.log score80.log score90.log score100.log"

# 设置箱线图的外观
set style fill solid 0.5
set boxwidth 10
set style data boxplot

# 设置x轴刻度
set xtics ("10" 1, "20" 2, "30" 3, "40" 4, "50" 5, "60" 6, "70" 7, "80" 8, "90" 9, "100" 10)

# 绘制箱线图
plot for [i=1:words(file_list)] word(file_list, i) using 1:4 with boxplot lc i notitle
