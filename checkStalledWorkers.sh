#!/bin/bash 
 
# Simple script to kill stale resque workers
# Adam St. John [astjohn] [@] [gmail]
# 2011-06-24
 
# Timeout set to 10 minutes
TIMEOUT=300
#read -p "Enter Bitstamp password " bitstamp_pwd
#export BSTP_PWD=$bitstamp_pwd
#read -p "Enter Mtgox secret " mtgox_secret
#export MTGOX_SEC=$mtgox_secret 
# 21028 resque-1.16.1: Forked 17674 at 1308879414 
output=$(ps -e -o pid,command | grep -e [r]esque.*Forked | awk '{printf "%i#%i#%i\n", $1, $6, $4}')
now=`date +%s`
 
echo "`date` - Looking for stale workers."
# output should produce something like: 21028#1308879414#17674
if [ -z "$output" ] ; then
  echo "Stale workers were not found."
else
  echo "$output" | while read -r line ; do
   
    pid=$(echo $line | cut -d\# -f1)
    ftime=$(echo $line | cut -d\# -f2)
    fpid=$(echo $line | cut -d\# -f3)
 
    if ! [[ "$pid" =~ ^[0-9]+$ ]] ; then
      exec >&2; echo "Unable to find PID of stale resque worker"; exit 1
    fi
 
    if ! [[ "$ftime" =~ ^[0-9]+$ ]] ; then
      exec >&2; echo "Unable to find Forked time for stale resque worker"; exit 1
    fi
 
    difference=$(($now - $ftime))
    if [ "$difference" -ge "$TIMEOUT" ] ; then
      echo "Found a stale worker!"
      kill -s USR1 $pid
      echo "Kill signal USR1 sent to worker $pid so that it will shut down forked child $fpid"
      echo "Stalled resque worker killed on $HOSTNAME" | mail -s "Stalled resque worker" root
    fi 
  done
  echo "Finished dealing with stale workers."
fi
exit 0
