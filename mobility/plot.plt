set terminal pdfcairo enhanced font "Arial,12"
set output "bar_chart.pdf"

set title "Delay of receiving the first data packet" font ",14" tc rgb "#606060"
#set xlabel "Category"
set ylabel "Delay(ms)"

# offset

# set bar format
set boxwidth 0.9
set style data histograms
set style fill solid 1.00

# y-axis number format
set tic scale 0
set grid ytics
set yrange [0 to 2000]
#set xrange [0 to 4]

# remove border
unset border

# 定义颜色列表
set linetype 1 lc rgb "#32057B"
set linetype 2 lc rgb "#7D3200"
set linetype 3 lc rgb "#005453"

# 加载数据文件并绘制柱状图
plot 'mobility-core-10-edge-50.dat'  using 2:xticlabels(1) linecolor 1 title "e2e delay 30ms", \
     'mobility-core-50-edge-50.dat' using 2  linecolor 2 title "e2e delay 50ms", \
     'mobility-core-100-edge-50.dat' using 2 linecolor 3 title "e2e delay 100ms"


