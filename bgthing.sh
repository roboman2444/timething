#!/bin/bash

while : ;
do
	DOUT=$(date +%M.%S)
	MIN=$(echo $DOUT | cut -d '.' -f1)
	SEC=$(echo $DOUT | cut -d '.' -f2)
	TOSEC=$((3600-(10#$SEC + (10#$MIN * 60))))
## put stuff you want to run close to every hour on the hour below here
	NUMMONITORS=$(xrandr --query | grep ' connected' -c)
	SHUFSTRING=$(find /home/roboman2444/wallpapers/ /mnt/thing1/home/roboman2444/wallpapers/ -type f | shuf -n $NUMMONITORS)
	FEHSTRING=
##	for i in $(seq 1 $NUMMONITORS);
	for FILE in "${SHUFSTRING[@]}";
	do
##		FILE=$(find /home/roboman2444/wallpapers/ /mnt/thing1/home/roboman2444/wallpapers/ -type f | shuf -n1)
		FEHSTRING=$(printf "%s --bg-fill %s" "$FEHSTRING" "$FILE")
	done
	echo $FEHSTRING
	feh $FEHSTRING
#	echo $FILE $MIN $SEC $TOSEC

#ABOVE HERE
	sleep $TOSEC
done

