#!/bin/bash

source ../utils/shot
source ../utils/common

IMGDIR=images
THUMBNAILS=true
NOX11=true


BASE_OPTIONS=""
BASE_OPTIONS="${BASE_OPTIONS} ; set style line 1 pt 4 lt 1"
BASE_OPTIONS="${BASE_OPTIONS} ; set style line 2 pt 7 lt 2"
BASE_OPTIONS="${BASE_OPTIONS} ; set style increment ;"

BASE_OPTIONS="${BASE_OPTIONS} ; set pointsize 2 ; set grid;"

set -o errexit

# below value is used for thumbnail page
lbtTxop=14

# Adjust the scale of the plots here
LATENCY_CDF_RANGE="[0:1][0:200]"
HI_RES_LATENCY_CDF_RANGE="[0:1][0:50]"
THROUGHPUT_CDF_RANGE="[0:1][70:140]"
##############################################################
#  Latency CDF
##############################################################

for ftpLambda in 0.35 0.5 0.65 0.8 0.95 ;do
    for energyDetection in -82.0 ; do
        
            simTag="eD_${energyDetection}_ftpLambda_${ftpLambda}"
            # Some variants may not be present; skip those cases
            FILE_TO_TEST=results/laa_wifi_indoor_${simTag}_rule_any_operatorA
           # if ! [ -f $FILE_TO_TEST ] ; then
                
            #    continue

        #    fi 
            imgTag="indoor_"`echo "$energyDetection_${energyDetection}_ftpLambda_${ftpLambda}_operatorA" | tr '.' '_'`
            TRAFFIC=`print_traffic_model Udp`
            #if [ $cell == 'Laa' ] ; then
                TITLE=" FtpLambda=${ftpLambda}, CellA=${cell}"
           # else
             #   TITLE="FtpLambda=${ftpLambda}, CellA=${cell}, ${TRAFFIC}"
           # fi
            OPERATOR=A
            for cell in Laa   ; do 
                for rules in  nacks10 nacks80 all any; do 
                LATENCY_COLUMN=9
                #echo 'XDD'
                CURRENT=results/laa_wifi_indoor_${simTag}_cellA_${cell}_rule_${rules}_operatorA
                `../utils/cdf.sh $LATENCY_COLUMN $CURRENT > results/cdf_latency_${simTag}_cellA_${cell}_rule_${rules}_A`
            done
            done


            
            for cell in Wifi  ; do 
                for rules in  nacks10   ; do 
                LATENCY_COLUMN=9
                #echo 'XDD'
                CURRENT=results/laa_wifi_indoor_${simTag}_cellA_${cell}_rule_${rules}_operatorA
                `../utils/cdf.sh $LATENCY_COLUMN $CURRENT > results/cdf_latency_${simTag}_cellA_${cell}_rule_${rules}_A`
            done
            done
            
            index=0        
                for cell in  Laa ; do 
                for rules in all any nacks10 nacks80; do 
                FILES[$index]=results/cdf_latency_${simTag}_cellA_${cell}_rule_${rules}_A
                YCOLS[$index]='($1)'    
                XCOLS[$index]='($2)'
                LABELS[$index]=`print_operator_${cell,,}_wifi $cell`
            
                index=`expr $index + 1`
            
                done
            done
                for cell in Wifi  ; do 
                for rules in  nacks10 ; do 
                FILES[$index]=results/cdf_latency_${simTag}_cellA_${cell}_rule_${rules}_A
                YCOLS[$index]='($1)'    
                XCOLS[$index]='($2)'
                LABELS[$index]=`print_operator_${cell,,}_wifi $cell`
            
                index=`expr $index + 1`
            
                done
            done
            PLOTTYPE="with linespoints"
            XLABEL="Flow number CDF"
            YLABEL="Latency [ms]"
            RANGE=$LATENCY_CDF_RANGE
            OPTIONS="$BASE_OPTIONS ; set key bottom right"
            IMGFILENAME="${imgTag}_latency"
            plot
    
            unset FILES
            unset LABELS
            unset YCOLS
            unset XCOLS
        
        
    done
done


##############################################################
#  Throughput CDF
##############################################################


for ftpLambda in 0.35 0.5 0.65 0.8 0.95 ;do
    for energyDetection in -82.0 ; do
        
            simTag="eD_${energyDetection}_ftpLambda_${ftpLambda}"
            # Some variants may not be present; skip those cases
            FILE_TO_TEST=results/laa_wifi_indoor_${simTag}_rule_any_operatorA
           # if ! [ -f $FILE_TO_TEST ] ; then
                
            #    continue

        #    fi 
            imgTag="indoor_"`echo "$energyDetection_${energyDetection}_ftpLambda_${ftpLambda}_operatorA" | tr '.' '_'`
            TRAFFIC=`print_traffic_model Udp`
            #if [ $cell == 'Laa' ] ; then
                TITLE="FtpLambda=${ftpLambda}, CellA=${cell}"
           # else
             #   TITLE="FtpLambda=${ftpLambda}, CellA=${cell}, ${TRAFFIC}"
           # fi
    
            for cell in Laa   ; do 
                for rules in  nacks10 nacks80 all any; do 
                LATENCY_COLUMN=8
                #echo 'XDD'
                CURRENT=results/laa_wifi_indoor_${simTag}_cellA_${cell}_rule_${rules}_operatorA
                `../utils/cdf.sh $LATENCY_COLUMN $CURRENT > results/cdf_throughput_${simTag}_cellA_${cell}_rule_${rules}_A`
            done
            done


            
            for cell in Wifi  ; do 
                for rules in  nacks10   ; do 
                LATENCY_COLUMN=8
                #echo 'XDD'
                CURRENT=results/laa_wifi_indoor_${simTag}_cellA_${cell}_rule_${rules}_operatorA
                `../utils/cdf.sh $LATENCY_COLUMN $CURRENT > results/cdf_throughput_${simTag}_cellA_${cell}_rule_${rules}_A`
            done
            done
            
            index=0        
                for cell in  Laa ; do 
                for rules in all any nacks10 nacks80; do 
                FILES[$index]=results/cdf_throughput_${simTag}_cellA_${cell}_rule_${rules}_A
                YCOLS[$index]='($1)'    
                XCOLS[$index]='($2)'
                LABELS[$index]=`print_operator_${cell,,}_wifi $OPERATOR`
            
                index=`expr $index + 1`
            
                done
            done
                for cell in Wifi  ; do 
                for rules in  nacks10 ; do 
                FILES[$index]=results/cdf_throughput_${simTag}_cellA_${cell}_rule_${rules}_A
                YCOLS[$index]='($1)'    
                XCOLS[$index]='($2)'
                LABELS[$index]=`print_operator_${cell,,}_wifi $OPERATOR`
            
                index=`expr $index + 1`
            
                done
            done
            PLOTTYPE="with linespoints"
            XLABEL="Flow number CDF"
            YLABEL="throughput [Mbps]"
            RANGE=$THROUGHPUT_CDF_RANGE
            OPTIONS="$BASE_OPTIONS ; set key bottom right"
            IMGFILENAME="${imgTag}_throughput"
            plot
    
            unset FILES
            unset LABELS
            unset YCOLS
            unset XCOLS
        
        
    done
done

for ftpLambda in 0.35 0.5 0.65 0.8 0.95 ;do
    for energyDetection in -82.0 ; do
        
            simTag="eD_${energyDetection}_ftpLambda_${ftpLambda}"
            # Some variants may not be present; skip those cases
            FILE_TO_TEST=results/laa_wifi_indoor_${simTag}_rule_any_operatorB
           # if ! [ -f $FILE_TO_TEST ] ; then
                
            #    continue

        #    fi 
            imgTag="indoor_"`echo "$energyDetection_${energyDetection}_ftpLambda_${ftpLambda}_operatorB" | tr '.' '_'`
            TRAFFIC=`print_traffic_model Udp`
            #if [ $cell == 'Laa' ] ; then
                TITLE="FtpLambda=${ftpLambda}, CellA=${cell}"
           # else
             #   TITLE="FtpLambda=${ftpLambda}, CellA=${cell}, ${TRAFFIC}"
           # fi
    
            for cell in Laa   ; do 
                for rules in  nacks10 nacks80 all any; do 
                LATENCY_COLUMN=9
                #echo 'XDD'
                CURRENT=results/laa_wifi_indoor_${simTag}_cellA_${cell}_rule_${rules}_operatorB
                `../utils/cdf.sh $LATENCY_COLUMN $CURRENT > results/cdf_latency_${simTag}_cellA_${cell}_rule_${rules}_B`
            done
            done


            
            for cell in Wifi  ; do 
                for rules in  nacks10   ; do 
                LATENCY_COLUMN=9
                #echo 'XDD'
                CURRENT=results/laa_wifi_indoor_${simTag}_cellA_${cell}_rule_${rules}_operatorB
                `../utils/cdf.sh $LATENCY_COLUMN $CURRENT > results/cdf_latency_${simTag}_cellA_${cell}_rule_${rules}_B`
            done
            done
            
            index=0        
                for cell in  Laa ; do 
                for rules in all any nacks10 nacks80; do 
                FILES[$index]=results/cdf_latency_${simTag}_cellA_${cell}_rule_${rules}_B
                YCOLS[$index]='($1)'    
                XCOLS[$index]='($2)'
                LABELS[$index]=`print_operator_${cell,,}_wifi $cell`
            
                index=`expr $index + 1`
            
                done
            done
                for cell in Wifi  ; do 
                for rules in  nacks10 ; do 
                FILES[$index]=results/cdf_latency_${simTag}_cellA_${cell}_rule_${rules}_B
                YCOLS[$index]='($1)'    
                XCOLS[$index]='($2)'
                LABELS[$index]=`print_operator_${cell,,}_wifi $cell`
            
                index=`expr $index + 1`
            
                done
            done
            PLOTTYPE="with linespoints"
            XLABEL="Flow number CDF"
            YLABEL="Latency [ms]"
            RANGE=$LATENCY_CDF_RANGE
            OPTIONS="$BASE_OPTIONS ; set key bottom right"
            IMGFILENAME="${imgTag}_latency"
            plot
    
            unset FILES
            unset LABELS
            unset YCOLS
            unset XCOLS
        
        
    done
done


##############################################################
#  Throughput CDF
##############################################################


for ftpLambda in 0.35 0.5 0.65 0.8 0.95 ;do
    for energyDetection in -82.0 ; do
        
            simTag="eD_${energyDetection}_ftpLambda_${ftpLambda}"
            # Some variants may not be present; skip those cases
            FILE_TO_TEST=results/laa_wifi_indoor_${simTag}_rule_any_operatorB
           # if ! [ -f $FILE_TO_TEST ] ; then
                
            #    continue

        #    fi 
            imgTag="indoor_"`echo "$energyDetection_${energyDetection}_ftpLambda_${ftpLambda}_operatorB" | tr '.' '_'`
            TRAFFIC=`print_traffic_model Udp`
            #if [ $cell == 'Laa' ] ; then
                TITLE="FtpLambda=${ftpLambda}, CellA=${cell}"
           # else
             #   TITLE="FtpLambda=${ftpLambda}, CellA=${cell}, ${TRAFFIC}"
           # fi
    
            for cell in Laa   ; do 
                for rules in  nacks10 nacks80 all any; do 
                LATENCY_COLUMN=8
                #echo 'XDD'
                CURRENT=results/laa_wifi_indoor_${simTag}_cellA_${cell}_rule_${rules}_operatorB
                `../utils/cdf.sh $LATENCY_COLUMN $CURRENT > results/cdf_throughput_${simTag}_cellA_${cell}_rule_${rules}_B`
            done
            done


            
            for cell in Wifi  ; do 
                for rules in  nacks10   ; do 
                LATENCY_COLUMN=8
                #echo 'XDD'
                CURRENT=results/laa_wifi_indoor_${simTag}_cellA_${cell}_rule_${rules}_operatorB
                `../utils/cdf.sh $LATENCY_COLUMN $CURRENT > results/cdf_throughput_${simTag}_cellA_${cell}_rule_${rules}_B`
            done
            done
            
            index=0        
                for cell in  Laa ; do 
                for rules in all any nacks10 nacks80; do 
                FILES[$index]=results/cdf_throughput_${simTag}_cellA_${cell}_rule_${rules}_B
                YCOLS[$index]='($1)'    
                XCOLS[$index]='($2)'
                LABELS[$index]=`print_operator_${cell,,}_wifi $OPERATOR`
            
                index=`expr $index + 1`
            
                done
            done
                for cell in Wifi  ; do 
                for rules in  nacks10 ; do 
                FILES[$index]=results/cdf_throughput_${simTag}_cellA_${cell}_rule_${rules}_B
                YCOLS[$index]='($1)'    
                XCOLS[$index]='($2)'
                LABELS[$index]=`print_operator_${cell,,}_wifi $OPERATOR`
            
                index=`expr $index + 1`
            
                done
            done
            PLOTTYPE="with linespoints"
            XLABEL="Flow number CDF"
            YLABEL="throughput [Mbps]"
            RANGE=$THROUGHPUT_CDF_RANGE
            OPTIONS="$BASE_OPTIONS ; set key bottom right"
            IMGFILENAME="${imgTag}_throughput"
            plot
    
            unset FILES
            unset LABELS
            unset YCOLS
            unset XCOLS
        
        
    done
done

#

#../utils/shot_thumbnails.sh $IMGDIR/thumbnails "laa-wifi-indoor-ftp Laa txop=${lbtTxop} results"
