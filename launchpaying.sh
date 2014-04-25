#!/bin/bash

export BASH_ENV="$HOME/.bash_profile"

RESQUEPROC="resque"
CLOCKWORKPROC="clockwork"
RAILS_ENV="$1"
COUNT=4
workfolder="$2"
if [[ -z "$1" || -z "$2" ]]
then
	echo "Usage: launchpaying.sh <rails_environment> <workfolder>"
	exit
fi
cd "$workfolder"
if ps ax | grep -v grep | grep -v "launchpaying.sh" | grep $RESQUEPROC > /dev/null
then
	echo "Resque workers working"
else
	echo "Resque workers not running, restarting them"
	RAILS_ENV=$RAILS_ENV nohup rake resque:work QUEUE='payment' > /dev/null 2>&1 &
    RAILS_ENV=$RAILS_ENV nohup rake resque:work QUEUE='verylow' > /dev/null 2>&1 &
    RAILS_ENV=$RAILS_ENV nohup rake resque:work QUEUE='swap' > /dev/null 2>&1 &
    RAILS_ENV=$RAILS_ENV nohup rake resque:work QUEUE='slow' > /dev/null 2>&1 &
fi
if ps ax | grep -v grep | grep -v "launchpaying.sh" | grep $CLOCKWORKPROC > /dev/null
then
	echo "Clockwork running"
else
	echo "Clockork not running, restarting it"
	RAILS_ENV=$RAILS_ENV nohup bundle exec clockwork app/payingclock.rb > /dev/null 2>&1 &
	nohup bundle exec resque-web  > /dev/null 2>&1 &
fi