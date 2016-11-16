 
 set style line 1 pt 4 lt 1 
 set style line 2 pt 7 lt 2 
 set style increment 
 
 set pointsize 2 
 set grid
 
 set key bottom right 
 set term postscript eps enhanced   color   
 set output "images/ps/indoor_-82_0_ftpLambda_0_8_Laa_throughput.eps" 
    set xlabel "Throughput [Mbps]"
 set ylabel "CDF"
 set title "EdThresh=-82.0, FtpLambda=0.8, CellA=Laa, UDP" 
  
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
 plot [0:150][0:1] "results/cdf_throughput_eD_-82.0_ftpLambda_0.8_cellA_Laa_A" using ($1):($2)  with linespoints ls 1  title "operator A (LAA)"  , "results/cdf_throughput_eD_-82.0_ftpLambda_0.8_cellA_Laa_B" using ($1):($2)  with linespoints ls 2  title "operator B (Wi-Fi)"  
