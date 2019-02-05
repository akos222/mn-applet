#!/bin/bash
songPlaying(){
	isplaying=`cat ~/.config/Google\ Play\ Music\ Desktop\ Player/json_store/playback.json | grep playing | sed 's/\"playing\"\:\ //;s/,//' | sed 's/[^a-z]*//g'`
	artist=`cat ~/.config/Google\ Play\ Music\ Desktop\ Player/json_store/playback.json | grep artist | sed 's/\"artist\":\ "//;s/\",//'`
	title=`cat ~/.config/Google\ Play\ Music\ Desktop\ Player/json_store/playback.json | grep title | sed 's/\"title\":\ "//;s/\",//'`
}

nextSong(){
	sleep 3
	newTitle=`cat ~/.config/Google\ Play\ Music\ Desktop\ Player/json_store/playback.json | grep title | sed 's/\"title\":\ "//;s/\",//;s/^	*//g'`
	newArtist=`cat ~/.config/Google\ Play\ Music\ Desktop\ Player/json_store/playback.json | grep artist | sed 's/\"artist\":\ "//;s/\",//;s/^ *//g'`
	icon=`cat ~/.config/Google\ Play\ Music\ Desktop\ Player/json_store/playback.json | grep albumArt | sed 's/\"albumArt\":\ "//;s/\"//'`
}

echoer(){
	echo $artist '-' $title 

}


ison=`ps cax | grep Google`
	if [ "$ison" == '' ]; then
		echo "♪♪♪"
	else
		songPlaying
		echoer
		nextSong
				echo $newTitle $title
			if [ "$newTitle" != "$title" ]; then
				curl $icon > ~/.tmppic
				notify-send -a "Currently Playing" -i ~/.tmppic "$newArtist" "$newTitle"
			fi
		fi		

