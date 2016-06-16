#/bin/sh

FILE=$(find /home/roboman2444/wallpapers/ /mnt/thing1/home/roboman2444/wallpapers/ -type f | shuf -n1)
feh --bg-fill "$FILE"
while : ;
do
	DOUT=$(date +%H:%M.%S.%M)
	HM=$(echo $DOUT | cut -d '.' -f1)
	SEC=$(echo $DOUT | cut -d '.' -f2)
	MIN=$(echo $DOUT | cut -d '.' -f3)
	TOSEC=$((60-SEC))
## put stuff you want to run close to every minute on the minute below here
	LOAD=$(cat /proc/loadavg)
	POWER=$(acpi)
	xsetroot -name "`echo $POWER | cut -d ' ' -f4 | cut -d ',' -f1` `echo $LOAD | cut -d ' ' -f1` `echo $LOAD | cut -d ' ' -f4` $HM"
	if [ $MIN -eq 0 ]; then
	## and hour here
		FILE=$(find /home/roboman2444/wallpapers/ /mnt/thing1/home/roboman2444/wallpapers/ -type f | shuf -n1)
		feh --bg-fill "$FILE"
	## ABOVE HERE
	fi;

##	echo $HM $SEC $TOSEC $MIN

#ABOVE HERE
	sleep $TOSEC
done
