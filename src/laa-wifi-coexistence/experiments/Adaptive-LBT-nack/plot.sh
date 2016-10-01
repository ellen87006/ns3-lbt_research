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
LATENCY_CDF_RANGE="[0:1][0:500]"
HI_RES_LATENCY_CDF_RANGE="[0:1][0:50]"
THROUGHPUT_CDF_RANGE="[0:1][0:150]"

##############################################################
#  Latency CDF
##############################################################

for ftpLambda in 0.5 1.5 2.5 ; do
    for energyDetection in -62.0 -72.0 -82.0 ; do
        for cell in Wifi Laa ; do
            for rules in all any; do 
            simTag="eD_${energyDetection}_ftpLambda_${ftpLambda}_cellA_${cell}_rule_${rules}"
            # Some variants may not be present; skip those cases
            FILE_TO_TEST=results/laa_wifi_indoor_${simTag}_operatorA
            if ! [ -f $FILE_TO_TEST ] ; then
                continue
            fi 
            imgTag="indoor_"`echo "$energyDetection_${energyDetection}_ftpLambda_${ftpLambda}_${cell}_rule_${rules}" | tr '.' '_'`
            TRAFFIC=`print_traffic_model Udp`
            if [ $cell == 'Laa' ] ; then
                TITLE="EdThresh=${energyDetection}, FtpLambda=${ftpLambda}, CellA=${cell}, ${TRAFFIC}"
            else
                TITLE="FtpLambda=${ftpLambda}, CellA=${cell}, ${TRAFFIC}"
            fi
    
            for OPERATOR in A B ; do
                LATENCY_COLUMN=9
                CURRENT=results/laa_wifi_indoor_${simTag}_operator${OPERATOR}
                `../utils/cdf.sh $LATENCY_COLUMN $CURRENT > results/cdf_latency_${simTag}_${OPERATOR}`
            done
            index=0        
            for OPERATOR in A B ; do
                FILES[$index]=results/cdf_latency_${simTag}_${OPERATOR}
                YCOLS[$index]='($1)'    
                XCOLS[$index]='($2)'
                LABELS[$index]=`print_operator_${cell,,}_wifi $OPERATOR`
            
                index=`expr $index + 1`
            done
    
            PLOTTYPE="with linespoints"
            XLABEL="CDF"
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
    done
done

##############################################################
#  High resolution Latency CDF
##############################################################

for ftpLambda in 0.5 1.5 2.5 ; do
    for energyDetection in -62.0 -72.0 -82.0 ; do
        for cell in Wifi Laa ; do
             for rules in all any; do 
            simTag="eD_${energyDetection}_ftpLambda_${ftpLambda}_cellA_${cell}_rule_${rules}"
            # Some variants may not be present; skip those cases
            FILE_TO_TEST=results/laa_wifi_indoor_${simTag}_operatorA
            if ! [ -f $FILE_TO_TEST ] ; then
                continue
            fi 
            imgTag="indoor_"`echo "$energyDetection_${energyDetection}_ftpLambda_${ftpLambda}_${cell}_rule_${rules}" | tr '.' '_'`
            TRAFFIC=`print_traffic_model Udp`
            if [ $cell == 'Laa' ] ; then
                TITLE="EdThresh=${energyDetection}, FtpLambda=${ftpLambda}, CellA=${cell}, ${TRAFFIC}"
            else
                TITLE="FtpLambda=${ftpLambda}, CellA=${cell}, ${TRAFFIC}"
            fi
    
            for OPERATOR in A B ; do
                LATENCY_COLUMN=9
                CURRENT=results/laa_wifi_indoor_${simTag}_operator${OPERATOR}
                `../utils/cdf.sh $LATENCY_COLUMN $CURRENT > results/cdf_latency_${simTag}_${OPERATOR}`
            done
            index=0        
            for OPERATOR in A B ; do
                FILES[$index]=results/cdf_latency_${simTag}_${OPERATOR}
                YCOLS[$index]='($1)'    
                XCOLS[$index]='($2)'
                LABELS[$index]=`print_operator_${cell,,}_wifi $OPERATOR`
            
                index=`expr $index + 1`
            done
    
            PLOTTYPE="with linespoints"
            XLABEL="CDF"
            YLABEL="Latency [ms]"
            RANGE=$HI_RES_LATENCY_CDF_RANGE
            OPTIONS="$BASE_OPTIONS ; set key bottom right"
            IMGFILENAME="${imgTag}_latency_hi_res"
            plot
    
            unset FILES
            unset LABELS
            unset YCOLS
            unset XCOLS
        done
        done
    done
done

##############################################################
#  Throughput CDF
##############################################################


for ftpLambda in 0.5 1.5 2.5 ; do
    for energyDetection in -62.0 -72.0 -82.0 ; do
        for cell in Wifi Laa ; do
             for rules in all any; do 
            simTag="eD_${energyDetection}_ftpLambda_${ftpLambda}_cellA_${cell}_rule_${rules}"
            # Some variants may not be present; skip those cases
            FILE_TO_TEST=results/laa_wifi_indoor_${simTag}_operatorA
            if ! [ -f $FILE_TO_TEST ] ; then
                continue
            fi 
            imgTag="indoor_"`echo "$energyDetection_${energyDetection}_ftpLambda_${ftpLambda}_${cell}_rule_${rules}" | tr '.' '_'`
            TRAFFIC=`print_traffic_model Udp`
            if [ $cell == 'Laa' ] ; then
                TITLE="EdThresh=${energyDetection}, FtpLambda=${ftpLambda}, CellA=${cell}, ${TRAFFIC}"
            else
                TITLE="FtpLambda=${ftpLambda}, CellA=${cell}, ${TRAFFIC}"
            fi
            for OPERATOR in A B ; do
                THROUGHPUT_COLUMN=8
                CURRENT=results/laa_wifi_indoor_${simTag}_operator${OPERATOR}
                `../utils/cdf.sh $THROUGHPUT_COLUMN $CURRENT > results/cdf_throughput_${simTag}_${OPERATOR}`
            done
            index=0        
            for OPERATOR in A B ; do
                FILES[$index]=results/cdf_throughput_${simTag}_${OPERATOR}
                YCOLS[$index]='($1)'    
                XCOLS[$index]='($2)'
                LABELS[$index]=`print_operator_${cell,,}_wifi $OPERATOR`
        
                index=`expr $index + 1`
            done

            PLOTTYPE="with linespoints"
            XLABEL="CDF"
            YLABEL="Throughput [Mbps]"
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
    done
done

##############################################################
#  Voice CDF
##############################################################

for ftpLambda in 0.5 1.5 2.5 ; do
    for energyDetection in -62.0 -72.0 -82.0 ; do
        for cell in Wifi Laa ; do
             for rules in all any; do 
            simTag="eD_${energyDetection}_ftpLambda_${ftpLambda}_cellA_${cell}_rule_${rules}"
            # Some variants may not be present; skip those cases
            FILE_TO_TEST=results/laa_wifi_indoor_${simTag}_operatorB_voice_log
            if ! [ -f $FILE_TO_TEST ] ; then
                continue
            fi 
            imgTag="indoor_"`echo "$energyDetection_${energyDetection}_ftpLambda_${ftpLambda}_${cell}_rule_${rules}" | tr '.' '_'`
            TRAFFIC=`print_traffic_model Udp`
            if [ $cell == 'Laa' ] ; then
                TITLE="EdThresh=${energyDetection}, FtpLambda=${ftpLambda}, CellA=${cell}, ${TRAFFIC}"
            else
                TITLE="FtpLambda=${ftpLambda}, CellA=${cell}, ${TRAFFIC}"
            fi
    
            for OPERATOR in B ; do
                LATENCY_COLUMN=4
                CURRENT=results/laa_wifi_indoor_${simTag}_operator${OPERATOR}_voice_log
                `../utils/cdf.sh $LATENCY_COLUMN $CURRENT > results/cdf_voice_latency_${simTag}_${OPERATOR}`
            done
            index=0        
            for OPERATOR in B ; do
                FILES[$index]=results/cdf_voice_latency_${simTag}_${OPERATOR}
                YCOLS[$index]='($1)'    
                XCOLS[$index]='($2)'
                LABELS[$index]=`print_operator_${cell,,}_wifi $OPERATOR`
            
                index=`expr $index + 1`
            done
    
            PLOTTYPES[0]="with linespoints ls 2"
            XLABEL="CDF"
            YLABEL="Voice Latency [ms]"
            RANGE=$HI_RES_LATENCY_CDF_RANGE
            OPTIONS="$BASE_OPTIONS ; set key bottom right"
            IMGFILENAME="${imgTag}_voice_latency"
            plot
    
            unset FILES
            unset LABELS
            unset YCOLS
            unset XCOLS
        done
        done
    done
done

#../utils/shot_thumbnails.sh $IMGDIR/thumbnails "laa-wifi-indoor-ftp Laa txop=${lbtTxop} results"

