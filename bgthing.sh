#/bin/sh

while : ;
do
	DOUT=$(date +%M.%S)
	MIN=$(echo $DOUT | cut -d '.' -f1)
	SEC=$(echo $DOUT | cut -d '.' -f2)
	TOSEC=$((3600-(10#$SEC + (10#$MIN * 60))))
## put stuff you want to run close to every hour on the hour below here
	FILE=$(find /home/roboman2444/wallpapers/ /mnt/thing1/home/roboman2444/wallpapers/ -type f | shuf -n1)
	feh --bg-fill "$FILE"
#	echo $FILE $MIN $SEC $TOSEC

#ABOVE HERE
	sleep $TOSEC
done

