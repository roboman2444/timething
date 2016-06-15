#/bin/sh

while : ;
do
	DOUT=$(date +%H:%M.%S)
	HM=$(echo $DOUT | cut -d '.' -f1)
	SEC=$(echo $DOUT | cut -d '.' -f2)
	TOSEC=$((60-SEC))
## put stuff you want to run close to every minute on the minute below here
	LOAD=$(cat /proc/loadavg)
	POWER=$(acpi)
	xsetroot -name "`echo $POWER | cut -d ' ' -f4 | cut -d ',' -f1` `echo $LOAD | cut -d ' ' -f1` `echo $LOAD | cut -d ' ' -f4` $HM"
##	echo $HM $SEC $TOSEC

#ABOVE HERE
	sleep $TOSEC
done

