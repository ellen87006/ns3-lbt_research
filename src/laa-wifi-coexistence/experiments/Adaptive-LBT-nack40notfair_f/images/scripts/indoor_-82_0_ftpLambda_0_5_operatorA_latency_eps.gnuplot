 
 set style line 1 pt 4 lt 1 
 set style line 2 pt 7 lt 2 
 set style increment 
 
 set pointsize 2 
 set grid
 
 set key bottom right 
 set term postscript eps enhanced   color   
 set output "images/ps/indoor_-82_0_ftpLambda_0_5_operatorA_latency.eps" 
   set xlabel "Flow number CDF"
 set ylabel "Latency [ms]"
  
 unset title
 
 unset title
 plot [0:1][0:200] "results/cdf_latency_eD_-82.0_ftpLambda_0.5_cellA_Laa_rule_all_fair_A" using ($2):($1)  with linespoints ls 1  title "Scenario 6"  , "results/cdf_latency_eD_-82.0_ftpLambda_0.5_cellA_Laa_rule_all_A" using ($2):($1)  with linespoints ls 2  title "Scenario 5"  , "results/cdf_latency_eD_-82.0_ftpLambda_0.5_cellA_Laa_rule_any_A" using ($2):($1)  with linespoints ls 3  title "Scenario 4"  , "results/cdf_latency_eD_-82.0_ftpLambda_0.5_cellA_Laa_rule_nacks10_A" using ($2):($1)  with linespoints ls 4  title "Scenario 3"  , "results/cdf_latency_eD_-82.0_ftpLambda_0.5_cellA_Laa_rule_nacks80_A" using ($2):($1)  with linespoints ls 5  title "Scenario 2"  , "results/cdf_latency_eD_-82.0_ftpLambda_0.5_cellA_Wifi_rule_nacks10_A" using ($2):($1)  with linespoints ls 6  title "Scenario 1 "  
