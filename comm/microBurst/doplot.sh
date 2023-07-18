#!/bin/bash

# This script is used to plot the data of microburst
# The data is collected from the log file of edge server

dataPath=~/CybertwinSimulation/cybertwin/system/access_net/end_host2/log/end-host-bulk-send.log
plotData=microBurst.log

echo "[+] copying data"
cp $dataPath ./$plotData

echo "[+] processing data"
awk '/100ms,/ {print $1,$6}' $plotData  > 100ms.log
awk '/10ms,/ {print $1,$6}' $plotData > 10ms.log
awk '/1ms,/ {print $1,$6}' $plotData > 1ms.log

echo "[+] plotting data"
gnuplot plot.plt

