 
 set style line 1 pt 4 lt 1 
 set style line 2 pt 7 lt 2 
 set style increment 
 
 set pointsize 2 
 set grid
 
 set key bottom right 
 set term postscript eps enhanced   color   
 set output "images/ps/indoor_-82_0_ftpLambda_0_95_Wifi_latency.eps" 
    set xlabel "Latency [ms]"
 set ylabel "CDF"
 set title "FtpLambda=0.95, CellA=Wifi, UDP" 
  
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 plot [0:500][0:1] "results/cdf_latency_eD_-82.0_ftpLambda_0.95_cellA_Wifi_A" using ($1):($2)  with linespoints ls 1  title "operator A (Wi-Fi)"  , "results/cdf_latency_eD_-82.0_ftpLambda_0.95_cellA_Wifi_B" using ($1):($2)  with linespoints ls 2  title "operator B (Wi-Fi)"  
