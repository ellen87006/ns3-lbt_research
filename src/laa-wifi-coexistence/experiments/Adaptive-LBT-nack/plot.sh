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
LATENCY_CDF_RANGE="[0:1][0:100]"
HI_RES_LATENCY_CDF_RANGE="[0:1][0:50]"
THROUGHPUT_CDF_RANGE="[0:1][70:140]"
##############################################################
#  Latency CDF
##############################################################

for ftpLambda in 0.35 0.5 0.65 0.8 0.95 1 1.5 2 2.5;do
    for energyDetection in -62.0 -72.0 -82.0 ; do
        for cell in Wifi Laa ; do 
            simTag="eD_${energyDetection}_ftpLambda_${ftpLambda}_cellA_${cell}"
            # Some variants may not be present; skip those cases
            FILE_TO_TEST=results/laa_wifi_indoor_${simTag}_rule_any_operatorA
            if ! [ -f $FILE_TO_TEST ] ; then
                continue
            fi 
            imgTag="indoor_"`echo "$energyDetection_${energyDetection}_ftpLambda_${ftpLambda}_${cell}" | tr '.' '_'`
            TRAFFIC=`print_traffic_model Udp`
            if [ $cell == 'Laa' ] ; then
                TITLE="EdThresh=${energyDetection}, FtpLambda=${ftpLambda}, CellA=${cell}, ${TRAFFIC}"
            else
                TITLE="FtpLambda=${ftpLambda}, CellA=${cell}, ${TRAFFIC}"
            fi
    
            for OPERATOR in A B ; do
                for rules in any all ;do
                LATENCY_COLUMN=9
                CURRENT=results/laa_wifi_indoor_${simTag}_rule_${rules}_operator${OPERATOR}
                `../utils/cdf.sh $LATENCY_COLUMN $CURRENT > results/cdf_latency_${simTag}_rule_${rules}_${OPERATOR}`
            done
            done
            index=0        
            for OPERATOR in A B ; do
                for rules in any all ;do 
                FILES[$index]=results/cdf_latency_${simTag}_rule_${rules}_${OPERATOR}
                YCOLS[$index]='($1)'    
                XCOLS[$index]='($2)'
                LABELS[$index]=`print_operator_${cell,,}_wifi $OPERATOR`
            
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
done

##############################################################
#  High resolution Latency CDF
##############################################################

for ftpLambda in 0.35 0.5 0.65 0.8 0.95 1 1.5 2 2.5;do
    for energyDetection in -62.0 -72.0 -82.0 ; do
        for cell in Wifi Laa ; do
            simTag="eD_${energyDetection}_ftpLambda_${ftpLambda}_cellA_${cell}"
            # Some variants may not be present; skip those cases
            FILE_TO_TEST=results/laa_wifi_indoor_${simTag}_rule_any_operatorA
            if ! [ -f $FILE_TO_TEST ] ; then
                continue
            fi 
            imgTag="indoor_"`echo "$energyDetection_${energyDetection}_ftpLambda_${ftpLambda}_${cell}" | tr '.' '_'`
            TRAFFIC=`print_traffic_model Udp`
            if [ $cell == 'Laa' ] ; then
                TITLE="EdThresh=${energyDetection}, FtpLambda=${ftpLambda}, CellA=${cell}, ${TRAFFIC}"
            else
                TITLE="FtpLambda=${ftpLambda}, CellA=${cell}, ${TRAFFIC}"
            fi
    
            for OPERATOR in A B ; do
                for rules in any all; do 
                LATENCY_COLUMN=9
                CURRENT=results/laa_wifi_indoor_${simTag}_rule_${rules}_operator${OPERATOR}
                `../utils/cdf.sh $LATENCY_COLUMN $CURRENT > results/cdf_latency_${simTag}_rule_${rules}_${OPERATOR}`
            done
            done
            index=0        
            for OPERATOR in A B ; do
                for rules in any all; do 
                FILES[$index]=results/cdf_latency_${simTag}_rule_${rules}_${OPERATOR}
                YCOLS[$index]='($1)'
                XCOLS[$index]='($2)'
                LABELS[$index]=`print_operator_${cell,,}_wifi $OPERATOR`   
                index=`expr $index + 1`
            done
            done
    
            PLOTTYPE="with linespoints"
            XLABEL="Flow number CDF"
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

##############################################################
#  Throughput CDF
##############################################################


for ftpLambda in 0.35 0.5 0.65 0.8 0.95 1 1.5 2 2.5;do
    for energyDetection in -62.0 -72.0 -82.0 ; do
        for cell in Wifi Laa ; do
            simTag="eD_${energyDetection}_ftpLambda_${ftpLambda}_cellA_${cell}"
            # Some variants may not be present; skip those cases
            FILE_TO_TEST=results/laa_wifi_indoor_${simTag}_rule_any_operatorA
            if ! [ -f $FILE_TO_TEST ] ; then
                continue
            fi 
            imgTag="indoor_"`echo "$energyDetection_${energyDetection}_ftpLambda_${ftpLambda}_${cell}" | tr '.' '_'`
            TRAFFIC=`print_traffic_model Udp`
            if [ $cell == 'Laa' ] ; then
                TITLE="EdThresh=${energyDetection}, FtpLambda=${ftpLambda}, CellA=${cell}, ${TRAFFIC}"
            else
                TITLE="FtpLambda=${ftpLambda}, CellA=${cell}, ${TRAFFIC}"
            fi
            for OPERATOR in A B ; do
                for rules in any all; do 
                THROUGHPUT_COLUMN=8
                CURRENT=results/laa_wifi_indoor_${simTag}_rule_${rules}_operator${OPERATOR}
                `../utils/cdf.sh $THROUGHPUT_COLUMN $CURRENT > results/cdf_throughput_${simTag}_rule_${rules}_${OPERATOR}`
            done
            done
            index=0        
            for OPERATOR in A B ; do
                for rules in any all; do
                FILES[$index]=results/cdf_throughput_${simTag}_rule_${rules}_${OPERATOR}
                YCOLS[$index]='($1)'    
                XCOLS[$index]='($2)'
                LABELS[$index]=`print_operator_${cell,,}_wifi $OPERATOR`
        
                index=`expr $index + 1`
            done
            done

            PLOTTYPE="with linespoints"
            XLABEL="Flow number  CDF"
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
#

#../utils/shot_thumbnails.sh $IMGDIR/thumbnails "laa-wifi-indoor-ftp Laa txop=${lbtTxop} results"

