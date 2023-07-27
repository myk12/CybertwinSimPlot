# 设置输出文件类型和名称
set terminal pdfcairo enhanced color size 14cm, 5cm font 'Times,12' linewidth 1
set output 'throughput_boxplot.pdf'
set border linewidth 1.5

# 设置图表样式
set title "Throughput Boxplot"
set xlabel "Credit Score"
set ylabel "Throughput (Mbps)"
set grid

# 定义文件名列表
file_list_nonshape = "nonshape/score10.log nonshape/score20.log nonshape/score30.log nonshape/score40.log nonshape/score50.log nonshape/score60.log nonshape/score70.log nonshape/score80.log nonshape/score90.log"
file_list_shaped = "shaped/10.log shaped/20.log shaped/30.log shaped/40.log shaped/50.log shaped/60.log shaped/70.log shaped/80.log shaped/90.log"

# 设置箱线图的外观
set style fill solid 0.5
set boxwidth 4
set style data boxplot
set style boxplot nooutliers
#set xtics (0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100)

set yrange [0:100]
set xrange [0:100]
# 绘制箱线图
#plot for [i=1:words(file_list_nonshape)] word(file_list_nonshape, i) using 1:(column(4)) with boxplot lc i notitle
#plot for [i=1:words(file_list_shaped)] word(file_list_shaped, i) using 1:(column(4)) with boxplot lc i notitle

# 定义绘制函数
set multiplot layout 1,2
plot for [file in file_list_nonshape] file using 1:4 with boxplot notitle

plot for [file in file_list_shaped] file using 1:5 with boxplot notitle
