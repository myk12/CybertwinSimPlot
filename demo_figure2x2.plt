set term pdfcairo enhanced color size 20cm, 12cm
set output 'demo_evaluation.pdf'
set grid
unset border

# MACROS
MOBILITY_DIR="mobility/IDRouting/"
MULTIPATH_DIR="multipath/"
SECURITYPATH_DIR="security/boxplot/"

set multiplot layout 2,2

########################################################
#              Plot Figure - Mobility Test             #
########################################################

set origin 0,0.51
set key font ",15"
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

plot MOBILITY_DIR . 'mobility_test_off.csv' using 1:3 with lines  lw 3 lc "#0072BB" title 'W/o ID-aware Routing', \
     MOBILITY_DIR . 'mobility_test_on.csv' using 1:3 with lines dashtype '-' lt 2 lw 3 lc "#4CAF50" title 'W/ ID-aware Routing'

set datafile separator " "
unset arrow
unset object 2
unset object 3
unset object 4
unset label

########################################################
#              Plot Figure - Multipath Test            #
########################################################
set origin 0.5,0.51
set xlabel "Time (s)"
set ylabel "Throughput (Mbps)"
set yrange [0:250]
set xrange [0:7]

plot  MULTIPATH_DIR . "data/MultiPath_100_100.dat" using 1:2 title  "L1 100Mbps, L2 100Mbps" with lines linecolor rgb "#0072BB", \
      MULTIPATH_DIR . "data/MultiPath_100_50.dat" using 1:2 title   "L1 100Mbps, L2  50Mbps" with lines linecolor rgb "#4CAF50", \
      MULTIPATH_DIR . "data/MultiPath_50_50.dat" using 1:2 title    "L1  50Mbps, L2  50Mbps" with lines linecolor rgb "#FF5722"

########################################################
#              Plot Figure - Security Test              #
########################################################
set origin 0,0.01
set xlabel "Credit Score"
set ylabel "Throughput (Mbps)"
set grid

# define the file list
file_list_nonshape = "nonshape/score10.log nonshape/score20.log nonshape/score30.log nonshape/score40.log nonshape/score50.log nonshape/score60.log nonshape/score70.log nonshape/score80.log nonshape/score90.log"

# set the box width
set boxwidth 6

# set the style of the box
set style fill solid 0.5 border lt -1
set style data boxplot
set style boxplot nooutliers
set style fill solid 0.5 noborder
set yrange [0:120]
set xrange [0:100]

# define the plot function
plot for [file in file_list_nonshape] SECURITYPATH_DIR . file using 1:4 with boxplot linetype 1 linecolor rgb "#0072BB" notitle

########################################################
#              Scalability Test                        #
########################################################
set origin 0.5,0.01
set size 0.5, 0.5
set grid

# plot the figure as a histogram
# data file: scalability/runtime.dat
set xlabel "Node Count"
set ylabel "Runtime (s)"

set style data histograms
set style fill solid
set boxwidth 0.5

plot 'scalability/runtime.dat' using 2:xtic(1) title 'Runtime' with histograms

unset multiplot

