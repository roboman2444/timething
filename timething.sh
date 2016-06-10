#/bin/sh

while : ;
do
	DOUT=$(date +%H:%M.%S)
	HM=$(echo $DOUT | cut -d '.' -f1)
	SEC=$(echo $DOUT | cut -d '.' -f2)
	TOSEC=$((60-SEC))
## put stuff you want to run close to every minute on the minute below here
	xsetroot -name $HM
##	echo $HM $SEC $TOSEC

#ABOVE HERE
	sleep $TOSEC
done

