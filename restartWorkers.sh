#!/bin/bash 
 
# Script to restart resque workers
if [[ -z "$3" ]]
then
        echo "Usage: restartWorkers.sh <engines|paying> <environment> <home>"
        exit 1
fi
home="$3"
rails_environnement="$2"
if [[ "$1" == "paying" ]]
then
	read -p "Enter EgoPay API password " egopay_pwd
	export EGOPAY_PASS=$egopay_pwd
	serverfile="$home/launchpaying.sh"
elif [[ "$1" == "engines" ]]
then
	read -p "Enter EgoPay API password " egopay_pwd
	export EGOPAY_PASS=$egopay_pwd
	read -p "Enter Bitstamp api secret " bitstamp_sec
        export BSTP_SEC=$bitstamp_sec
	read -p "Enter M&aster BFX API secret " masterbfx_sec
	export MASTERBFX_SEC=masterbfx_sec
	#read -p "Enter LTC daemon password " ltcpp
	#export LTC_PWD=$ltcpp
	serverfile="$home/launchengine.sh"
else
	echo "Usage: restartWorkers.sh <engines|paying>"
	exit 1
fi
servercommand="$serverfile $rails_environnement $home/"
outputclockwork=$(ps -e -o pid,command | grep -e [c]lockwork | awk '{printf "%i#%i#%i\n", $1, $6, $4}')
outputresque=$(ps -e -o pid,command | grep -e [r]esque | awk '{printf "%i#%i#%i\n", $1, $6, $4}')
#now=`date +%s`

echo "Killing clockwork"
if [ -z "$outputclockwork" ] ; then
  echo "No clockwork found"
else
  echo "$outputclockwork" | while read -r line ; do
   
    pid=$(echo $line | cut -d\# -f1)
    fpid=$(echo $line | cut -d\# -f3)
 
    if ! [[ "$pid" =~ ^[0-9]+$ ]] ; then
      exec >&2; echo "Unable to find PID of clockwork"; exit 1
    fi
 
    echo "Found the clockwork!"
    kill -s SIGKILL $pid
    echo "Kill signal SIGKILL sent to clockwork $pid"
  done
  echo "Finished dealing with clockwork."
fi
echo "Waiting for 30 seconds so resque workers finish their work..."
sleep 30
echo "Killing resque workers"
if [ -z "$outputresque" ] ; then
  echo "No workers found"
else
  echo "$outputresque" | while read -r line ; do
   
    pid=$(echo $line | cut -d\# -f1)
    fpid=$(echo $line | cut -d\# -f3)
 
    if ! [[ "$pid" =~ ^[0-9]+$ ]] ; then
      exec >&2; echo "Unable to find PID of resque worker"; exit 1
    fi
 
    echo "Killing a worker!"
    kill -s SIGKILL $pid
    echo "Kill signal SIGKILL sent to worker $pid"
  done
  echo "Finished dealing with workers."
fi
echo "Restarting resque workers and clockwork..."
$servercommand

exit 0
