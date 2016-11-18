 
 set style line 1 pt 4 lt 1 
 set style line 2 pt 7 lt 2 
 set style increment 
 
 set pointsize 2 
 set grid
 
 set key bottom right 
 set term postscript eps enhanced   color   
 set output "images/ps/indoor_-82_0_ftpLambda_0_8_operatorA_throughput.eps" 
    set xlabel "Flow number CDF"
 set ylabel "throughput [Mbps]"
 set title "FtpLambda=0.8, CellA=Wifi" 
  
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 
 unset title
 plot [0:1][70:140] "results/cdf_throughput_eD_-82.0_ftpLambda_0.8_cellA_Laa_rule_all_A" using ($2):($1)  with linespoints ls 1  title "NACK rule Operator Laa"  , "results/cdf_throughput_eD_-82.0_ftpLambda_0.8_cellA_Laa_rule_any_A" using ($2):($1)  with linespoints ls 2  title "Adaptive rule Operator Laa"  , "results/cdf_throughput_eD_-82.0_ftpLambda_0.8_cellA_Laa_rule_nacks10_A" using ($2):($1)  with linespoints ls 3  title "LBT Cat 4 Operator Laa"  , "results/cdf_throughput_eD_-82.0_ftpLambda_0.8_cellA_Laa_rule_nacks80_A" using ($2):($1)  with linespoints ls 4  title "Fixed LBT Cat 4  Operator Laa"  , "results/cdf_throughput_eD_-82.0_ftpLambda_0.8_cellA_Wifi_rule_nacks10_A" using ($2):($1)  with linespoints ls 5  title "Operator Wifi"  
