set terminal pdfcairo font "Arial,12" enhanced color size 8cm, 4cm linewidth 2
set output 'mobility.pdf'
set grid
unset border

# MACROS
MOBILITY_DIR="mobility/IDRouting/"

########################################################
#              Plot Figure - Mobility Test             #
########################################################
set key font ",12"
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

set label "movement" at 0.5, 1.7 center tc rgb "#555555" font "Arial, 12, bold"
set arrow from 0.7, 1.6 to 1, 1.5 lc rgb "#555555" lw 2

#plot MOBILITY_DIR . 'mobility_test_off.csv' using 1:3 with lines  lw 3 lc "#0072BB" title 'W/o ID-aware Routing', \
#     MOBILITY_DIR . 'mobility_test_on.csv' using 1:3 with lines dashtype '-' lt 2 lw 3 lc "#4CAF50" title 'W/ ID-aware Routing'

# plot with default color in one color
plot MOBILITY_DIR . 'mobility_test_off.csv' using 1:3 with lines  lw 3 title 'W/o ID-aware Routing', \
     MOBILITY_DIR . 'mobility_test_on.csv' using 1:3 with lines dashtype '-' lt 2 lw 3 title 'W/ ID-aware Routing'

set datafile separator " "
unset arrow
unset object 2
unset object 3
unset object 4
unset label
