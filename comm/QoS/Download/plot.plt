# Set the style for the plot
set terminal pdfcairo enhanced color size 8cm, 6cm  linewidth 2
set style data histograms
set style histogram cluster gap 1
set grid
unset border
set output 'throughputQoS.pdf'

# Set the x-axis label and range
set xlabel "Priority"

bar_color = "#FF5722"

# Set the y-axis label
set ylabel "Throughput (Mbps)"
set yrange [0:100]

# Give a title to the plot
set title "Throughput Comparison by Priority"
unset key
set style fill pattern 1
# Plot the data from the "throughput.log" file
plot "throughput.log" using 2:xtic(1) title "Throughput" with histogram linecolor rgb bar_color
```
