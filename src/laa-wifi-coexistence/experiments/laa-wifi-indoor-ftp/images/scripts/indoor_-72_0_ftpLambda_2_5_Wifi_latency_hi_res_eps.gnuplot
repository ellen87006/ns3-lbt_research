 
 set style line 1 pt 4 lt 1 
 set style line 2 pt 7 lt 2 
 set style increment 
 
 set pointsize 2 
 set grid
 
 set key bottom right 
 set term postscript eps enhanced   color   
 set output "images/ps/indoor_-72_0_ftpLambda_2_5_Wifi_latency_hi_res.eps" 
    set xlabel "Latency [ms]"
 set ylabel "CDF"
 set title "FtpLambda=2.5, CellA=Wifi, UDP" 
  
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 plot [0:50][0:1] "results/cdf_latency_eD_-72.0_ftpLambda_2.5_cellA_Wifi_A" using ($1):($2)  with linespoints ls 1  title "operator A (Wi-Fi)"  , "results/cdf_latency_eD_-72.0_ftpLambda_2.5_cellA_Wifi_B" using ($1):($2)  with linespoints ls 2  title "operator B (Wi-Fi)"  
