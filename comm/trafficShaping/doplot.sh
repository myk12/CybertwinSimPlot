#!/bin/bash

# This script is used to plot the data of traffic shaping
# The data is collected from the log file of edge server

dataPath=~/CybertwinSimulation/cybertwin/system/edge_cloud/edge_server1/log/
plotData=ts.log

echo "[+] copying data"
cp $dataPath/cybertwin.log ./$plotData

echo "[+] processing data"
awk '/throughput =/ {print $3,$7}' $plotData  > recv.log
awk '/traffic shaping/ {print $3,$9}' $plotData > shaping.log

echo "[+] plotting data"
gnuplot plot.plt
