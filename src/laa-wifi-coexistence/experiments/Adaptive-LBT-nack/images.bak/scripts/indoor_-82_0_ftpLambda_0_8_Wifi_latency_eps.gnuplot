 
 set style line 1 pt 4 lt 1 
 set style line 2 pt 7 lt 2 
 set style increment 
 
 set pointsize 2 
 set grid
 
 set key bottom right 
 set term postscript eps enhanced   color   
 set output "images/ps/indoor_-82_0_ftpLambda_0_8_Wifi_latency.eps" 
    set xlabel "CDF"
 set ylabel "Latency [ms]"
 set title "FtpLambda=0.8, CellA=Wifi, UDP" 
  
 unset title
 
 unset title
 
 unset title
 
 unset title
 plot [0:1][0:100] "results/cdf_latency_eD_-82.0_ftpLambda_0.8_cellA_Laa_cellA_Laa_rule_all_operatorA" using ($2):($1)  with linespoints ls 1  title "NACK rule operator "  , "results/cdf_latency_eD_-82.0_ftpLambda_0.8_cellA_Laa_cellA_Laa_rule_any_operatorA" using ($2):($1)  with linespoints ls 2  title "Before rule operator "  , "results/cdf_latency_eD_-82.0_ftpLambda_0.8_cellA_Laa_cellA_Laa_rule_nacks10_operatorA" using ($2):($1)  with linespoints ls 3  title "LBT operator "  , "results/cdf_latency_eD_-82.0_ftpLambda_0.8_cellA_Laa_cellA_Laa_rule_nacks80_operatorA" using ($2):($1)  with linespoints ls 4  title "LBT fixed operator "  , "results/cdf_latency_eD_-82.0_ftpLambda_0.8_cellA_Laa_cellA_Wifi_rule_all_operatorA" using ($2):($1)  with linespoints ls 5  title "NACK rule operator "  , "results/cdf_latency_eD_-82.0_ftpLambda_0.8_cellA_Laa_cellA_Wifi_rule_any_operatorA" using ($2):($1)  with linespoints ls 6  title "Before rule operator "  , "results/cdf_latency_eD_-82.0_ftpLambda_0.8_cellA_Laa_cellA_Wifi_rule_nacks10_operatorA" using ($2):($1)  with linespoints ls 7  title "haha operator "  , "results/cdf_latency_eD_-82.0_ftpLambda_0.8_cellA_Laa_cellA_Wifi_rule_nacks80_operatorA" using ($2):($1)  with linespoints ls 8  title "haha operator "  
