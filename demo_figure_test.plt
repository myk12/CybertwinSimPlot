# 设置输出终端为 PNG
set terminal pngcairo size 800,600 enhanced font 'Arial,12'
set output 'runtime_plot.png'

# 设置标题
set title "Runtime vs Number of Nodes" font ",14"

# 设置 x 轴和 y 轴标签
set xlabel "Number of Nodes" font ",12"
set ylabel "Runtime (seconds)" font ",12"

# 旋转 x 轴刻度标签
set xtics rotate by -45

# 设置柱状图样式
set style data histograms
set style histogram gap 5  # 增加柱子之间的间隔
set style fill solid 1.00 border -1

# 绘制柱状图，第二列为 y 值，第一列为 x 轴的标签
plot 'scalability/runtime.dat' using 2:xtic(1) title 'Runtime' with histograms
