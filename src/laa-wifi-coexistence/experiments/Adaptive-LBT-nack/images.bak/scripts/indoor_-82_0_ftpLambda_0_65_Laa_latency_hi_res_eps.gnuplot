 
 set style line 1 pt 4 lt 1 
 set style line 2 pt 7 lt 2 
 set style increment 
 
 set pointsize 2 
 set grid
 
 set key bottom right 
 set term postscript eps enhanced   color   
 set output "images/ps/indoor_-82_0_ftpLambda_0_65_Laa_latency_hi_res.eps" 
    set xlabel "Flow number CDF"
 set ylabel "Latency [ms]"
 set title "EdThresh=-82.0, FtpLambda=0.65, CellA=Laa, UDP" 
  
 unset title
 
 unset title
 
 unset title
 plot [0:1][0:50] "results/cdf_latency_eD_-82.0_ftpLambda_0.65_cellA_Laa_rule_any_A" using ($2):($1)  with linespoints ls 1  title "Before rule operator Laa"  , "results/cdf_latency_eD_-82.0_ftpLambda_0.65_cellA_Laa_rule_all_A" using ($2):($1)  with linespoints ls 2  title "NACK rule operator Laa"  , "results/cdf_latency_eD_-82.0_ftpLambda_0.65_cellA_Laa_rule_any_B" using ($2):($1)  with linespoints ls 3  title "Before rule operator Laa"  , "results/cdf_latency_eD_-82.0_ftpLambda_0.65_cellA_Laa_rule_all_B" using ($2):($1)  with linespoints ls 4  title "NACK rule operator Laa"  
