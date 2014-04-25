#!/bin/bash

export BASH_ENV="$HOME/.bash_profile"

RESQUEPROC="resque"
CLOCKWORKPROC="clockwork"
RAILS_ENV="$1"
COUNT=4
workfolder="$2"
if [[ -z "$1" || -z "$2" ]]
then
	echo "Usage: launchengine.sh <rails_environment> <workfolder>"
	exit
fi
cd "$workfolder"
if ps ax | grep -v grep | grep -v "launchengine.sh" | grep $RESQUEPROC > /dev/null
then
	echo "Resque workers working"
else
	echo "Resque workers not running, restarting them"
	RAILS_ENV=$RAILS_ENV nohup rake resque:work QUEUE='critical' > /dev/null 2>&1 &
	RAILS_ENV=$RAILS_ENV nohup rake resque:work QUEUE='ticking' > /dev/null 2>&1 &
	RAILS_ENV=$RAILS_ENV nohup rake resque:work QUEUE='externalticking' > /dev/null 2>&1 &
	RAILS_ENV=$RAILS_ENV nohup rake resque:work QUEUE='marketmaking' > /dev/null 2>&1 &
	RAILS_ENV=$RAILS_ENV nohup rake resque:work QUEUE='externalbalancing' > /dev/null 2>&1 &
	RAILS_ENV=$RAILS_ENV nohup rake resque:work QUEUE='trading' > /dev/null 2>&1 &
	RAILS_ENV=$RAILS_ENV nohup rake resque:work QUEUE='placing' > /dev/null 2>&1 &
	RAILS_ENV=$RAILS_ENV nohup rake resque:work QUEUE='lendingmatch' > /dev/null 2>&1 &
	RAILS_ENV=$RAILS_ENV nohup rake resque:work QUEUE='lending' > /dev/null 2>&1 &
	RAILS_ENV=$RAILS_ENV nohup rake resque:work QUEUE='low' > /dev/null 2>&1 &
	RAILS_ENV=$RAILS_ENV nohup rake resque:work QUEUE='monitor' > /dev/null 2>&1 &
fi
if ps ax | grep -v grep | grep -v "launchengine.sh" | grep $CLOCKWORKPROC > /dev/null
then
	echo "Clockwork running"
else
	echo "Clockork not running, restarting it"
	RAILS_ENV=$RAILS_ENV nohup bundle exec clockwork app/clock.rb > /dev/null 2>&1 &
	nohup bundle exec resque-web  > /dev/null 2>&1 &
fi
