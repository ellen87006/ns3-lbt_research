 
 set style line 1 pt 4 lt 1 
 set style line 2 pt 7 lt 2 
 set style increment 
 
 set pointsize 2 
 set grid
 
 set key bottom right 
 set term postscript eps enhanced   color   
 set output "images/ps/indoor_-82_0_ftpLambda_2_5_Wifi_rule_any_throughput.eps" 
    set xlabel "CDF"
 set ylabel "Throughput [Mbps]"
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
 plot [0:1][0:150] "results/cdf_throughput_eD_-82.0_ftpLambda_2.5_cellA_Wifi_rule_any_A" using ($2):($1)  with linespoints ls 1  title "operator A (Wi-Fi)"  , "results/cdf_throughput_eD_-82.0_ftpLambda_2.5_cellA_Wifi_rule_any_B" using ($2):($1)  with linespoints ls 2  title "operator B (Wi-Fi)"  