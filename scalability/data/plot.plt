set terminal pngcairo enhanced font 'Verdana,12'
set output 'plot.png'

# 设置标题和标签
set title "Memory Usage by Node Count"
set xlabel "Node Count"
set ylabel "Value"

# 设置柱状图参数
set style data histograms
set style fill solid
set xtic rotate by -45 scale 0 font ",8"

# 绘制第一个柱状图（第一列数据）
plot for [file in "1036.csv 1184.csv 148.csv 296.csv 37.csv 444.csv 592.csv 740.csv 888.csv"] file u 1:2:xtic(1) title file with histograms

# 绘制第二个柱状图（第二列数据）
plot for [file in "1036.csv 1184.csv 148.csv 296.csv 37.csv 444.csv 592.csv 740.csv 888.csv"] file u 1:3:xtic(1) title file with histograms

