 
 set style line 1 pt 4 lt 1 
 set style line 2 pt 7 lt 2 
 set style increment 
 
 set pointsize 2 
 set grid
 
 set key bottom right 
 set term postscript eps enhanced   color   
 set output "images/ps/indoor_-82_0_ftpLambda_0_95_operatorB_throughput.eps" 
    set xlabel "Flow number CDF"
 set ylabel "throughput [mb]"
 set title "EdThresh=-82.0, FtpLambda=0.95, CellA=Wifi, UDP" 
  
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
 plot [0:1][70:140] "results/cdf_throughput_eD_-82.0_ftpLambda_0.95_cellA_Laa_rule_all_B" using ($2):($1)  with linespoints ls 1  title "NACK rule operator Laa"  , "results/cdf_throughput_eD_-82.0_ftpLambda_0.95_cellA_Laa_rule_any_B" using ($2):($1)  with linespoints ls 2  title "Before rule operator Laa"  , "results/cdf_throughput_eD_-82.0_ftpLambda_0.95_cellA_Laa_rule_nacks10_B" using ($2):($1)  with linespoints ls 3  title "LBT operator Laa"  , "results/cdf_throughput_eD_-82.0_ftpLambda_0.95_cellA_Laa_rule_nacks80_B" using ($2):($1)  with linespoints ls 4  title "LBT fixed operator Laa"  , "results/cdf_throughput_eD_-82.0_ftpLambda_0.95_cellA_Wifi_rule_nacks10_B" using ($2):($1)  with linespoints ls 5  title "haha operator A"  
