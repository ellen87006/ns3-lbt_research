source config

outputDir=`pwd`/results

control_c()
{
  echo "exiting"
  exit $?
}

trap control_c SIGINT

if test ! -f ../../../../waf ; then
  echo "please run this program from within the directory `dirname $0`, like this:"
  echo "cd `dirname $0`"
  echo "./`basename $0`"
  exit 1
fi

set -x
set -o errexit

# If the script is run directly, then we need to clean results directory
# Otherwise if it is run from a run-in-parallel script this is already done
if [[ $# -eq 0 ]] ; then
  outputDir=`pwd`/results
  mkdir -p "${outputDir}"
  rm -f "${outputDir}"/laa_wifi_indoor_*_operator?
  rm -f "${outputDir}"/time_stats
  rm -f "${outputDir}"/laa_wifi_indoor_*_log
else
  lbtTxopList="$1"
fi

# need this as otherwise waf won't find the executables
cd ../../../../
for ftpLambda in 0.12 0.25 0.37 0.5 0.625 ;do
  for MaxCws in 64 ; do
  # Energy detection threshold for LAA
      for MinCws in 32 ; do
        for lbtTxop in 4.0 ; do 
            for cell in Wifi Laa ; do
                # Make the simulation duration inversly proportional to ftpLambda
                duration=$(echo "$base_duration/$ftpLambda" | bc)
                simTag="eD_${energyDetection}_ftpLambda_${ftpLambda}_cellA_${cell}"
                /usr/bin/time -f '%e %U %S %K %M %x %C' -o "${outputDir}"/time_stats -a \
                ./waf --run laa-wifi-indoor --command="%s --udpRate=${udprate} --ChannelAccessManager=Lbt --ftpLambda=${ftpLambda}  --udpPacketSize=${Udpsize} --ns3::LbtAccessManager::DeferTime=${initalCCA} --ns3::LbtAccessManager::MaxCw=${MaxCws} --ns3::LbtAccessManager::MinCw=${MinCws} --cellConfigA=${cell} --cellConfigB=Wifi --lbtTxop=${lbtTxop} --logWifiRetries=1 --logWifiFailRetries=1 --logPhyArrivals=1 --transport=${transports} --duration=${duration} --cwUpdateRule=${rules} --logHarqFeedback=1 --logTxops=1 --logCwChanges=1 --logBackoffChanges=1 --laaEdThreshold=${energyDetection} --simTag=${simTag} --outputDir=${outputDir} --voiceEnabled=${voiceEnabled} --dropPackets=${dropPackets} --ns3::TcpSocket::SegmentSize=${tcpSegSize} --tcpRlcMode=${tcpRlcMode} --ns3::LteEnbRrc::DefaultTransmissionMode=${laaTxMode} --RngRun=${RngRun}"
            done
          done
      done
  done
done
