#/bin/sh
		NUMMONITORS=$(xrandr --query | grep ' connected' -c)
		FEHSTRING=
		for i in $(seq 1 $NUMMONITORS);
		do
			FILE=$(find /home/roboman2444/wallpapers/ /mnt/thing1/home/roboman2444/wallpapers/ -type f | shuf -n1)
			FEHSTRING=$(printf "%s --bg-fill %s" "$FEHSTRING" "$FILE")
		done
		feh $FEHSTRING
while : ;
do
	DOUT=$(date +%H:%M.%S.%M)
	HM=$(echo $DOUT | cut -d '.' -f1)
	SEC=$(echo $DOUT | cut -d '.' -f2)
	MIN=$(echo $DOUT | cut -d '.' -f3)
	TOSEC=$((60-10#$SEC))
## put stuff you want to run close to every minute on the minute below here
	LOAD=$(cat /proc/loadavg)
	POWER=$(acpi)
	TEMP=$(sensors -u | grep 'temp1_input' |cut -d ':' -f2 |cut -d ' ' -f2)
	MEEM=$(free | grep Mem | awk '{printf "%.1f", $3/$2 * 100.0}')
	xsetroot -name "P`echo $POWER | cut -d ' ' -f4 | cut -d ',' -f1` L`echo $LOAD | cut -d ' ' -f1` T$TEMP M$MEEM $HM"
	if [ $MIN -eq 0 ]; then
	## and hour here
		NUMMONITORS=$(xrandr --query | grep ' connected' -c)
		FEHSTRING=
		for i in $(seq 1 $NUMMONITORS);
		do
			FILE=$(find /home/roboman2444/wallpapers/ /mnt/thing1/home/roboman2444/wallpapers/ -type f | shuf -n1)
			FEHSTRING=$(printf "%s --bg-fill %s" "$FEHSTRING" "$FILE")
		done
		feh $FEHSTRING
	## ABOVE HERE
	fi;

##	echo $HM $SEC $TOSEC $MIN

#ABOVE HERE
	sleep $TOSEC
done
