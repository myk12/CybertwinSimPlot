# 设置输出文件类型和名称
set terminal pdfcairo enhanced color size 6cm, 4cm linewidth 1
set output 'throughput_boxplot.pdf'
#set object 1 rectangle behind from graph 0,0 to graph 1,1 fc rgb "#EFEFEF" fillstyle solid noborder
unset border

# 设置图表样式
#set title "Throughput vs. Credit Score (Non-Shaped)"
set xlabel "Credit Score"
set ylabel "Throughput (Mbps)"
set grid

# 定义文件名列表
file_list_nonshape = "nonshape/score10.log nonshape/score20.log nonshape/score30.log nonshape/score40.log nonshape/score50.log nonshape/score60.log nonshape/score70.log nonshape/score80.log nonshape/score90.log"

# 设置箱线图的外观
set boxwidth 6
#set border 2 front lt black linewidth 1.000 dashtype solid
set style fill solid 0.50 border lt -1
set style data boxplot
set style boxplot nooutliers
set style fill solid 0.5 noborder        # 设置填充颜色的透明度为0.5，noborder表示不绘制边框
set yrange [0:100]
set xrange [0:100]
# 绘制箱线图
#plot for [i=1:words(file_list_nonshape)] word(file_list_nonshape, i) using 1:(column(4)) with boxplot lc i notitle
#plot for [i=1:words(file_list_shaped)] word(file_list_shaped, i) using 1:(column(4)) with boxplot lc i notitle

# 定义绘制函数
plot for [file in file_list_nonshape] file using 1:4 with boxplot linetype 1 linecolor rgb "#0072BB" notitle
