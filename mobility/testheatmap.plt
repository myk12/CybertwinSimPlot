# Set plot parameters
set terminal pngcairo size 800,600
set output 'heatmap.png'

# Import matrix data
datafile = 'local.mat'
matrixdata = system(sprintf("tail -n +2 %s", datafile))

# Extract x-axis labels
xlabels = system(sprintf("head -n 1 %s", datafile))
xlabels = strstrt(xlabels, ",") + 1
set xtics 1
set xtics nomirror rotate by -45
set xtics scale 0
set xtics offset -0.5, 0
set xtics (strpart(xlabels, 1, xlabels[2]-1))
unset key

# Extract y-axis labels
ylabels = system(sprintf("cut -d ',' -f 1 %s | tail -n +2", datafile))
set ytics 1
set ytics nomirror
set ytics scale 0
set ytics offset -1, 0
set ytics (ylabels) format ''

plot matrixdata matrix with image

