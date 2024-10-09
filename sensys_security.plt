set term pdfcairo enhanced color size 8cm, 4cm
set output 'security.pdf'
set grid
unset border

# MACROS
SECURITYPATH_DIR="security/boxplot/"

########################################################
#              Plot Figure - Security Test              #
########################################################
set xlabel "Credit Score"
set ylabel "Bandwidth (Mbps)"
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
# plot for [file in file_list_nonshape] SECURITYPATH_DIR . file using 1:4 with boxplot linetype 1 notitle
# plot with purple color
plot for [file in file_list_nonshape] SECURITYPATH_DIR . file using 1:4 with boxplot linetype 1 linecolor rgb "#442288" notitle




