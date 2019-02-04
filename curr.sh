#!/bin/bash
ison=`ps cax | grep Google`
if [ "$ison" == '' ]; then
	echo "♪♬" 
else
	isplaying=`cat ~/.config/Google\ Play\ Music\ Desktop\ Player/json_store/playback.json | grep playing | sed 's/\"playing\"\:\ //;s/,//' | sed 's/[^a-z]*//g'`
	artist=`cat ~/.config/Google\ Play\ Music\ Desktop\ Player/json_store/playback.json | grep artist | sed 's/\"artist\":\ "//;s/\",//'`
	title=`cat ~/.config/Google\ Play\ Music\ Desktop\ Player/json_store/playback.json | grep title | sed 's/\"title\":\ "//;s/\",//'`
	current=`cat ~/.config/Google\ Play\ Music\ Desktop\ Player/json_store/playback.json | grep current | sed 's/[^0-9]*//g'` 
	total=`cat ~/.config/Google\ Play\ Music\ Desktop\ Player/json_store/playback.json | grep total | sed 's/[^0-9]*//g'`
	currminutes=$((current/1000/60))
	currminutes="$(printf %02d $currminutes)"
	currseconds=$((current/1000%60))
	currseconds="$(printf %02d $currseconds)"
	totalminutes=$((total/1000/60))
	totalminutes="$(printf %02d $totalminutes)"
	totalseconds=$((total/1000%60))
	totalseconds="$(printf %02d $totalseconds)"
	if [ "$isplaying" == 'false' ]; then
		echo  $artist '-' $title '---PAUSED---'
	else 
	echo $artist '-' $title $currminutes':'$currseconds '/' $totalminutes':'$totalseconds
	fi
fi
