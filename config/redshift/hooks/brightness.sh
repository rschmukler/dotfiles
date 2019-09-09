#!/bin/sh

# Set brightness via xbrightness when redshift status changes

# Set brightness values for each status.
# Range from 1 to 100 is valid
brightness_day=90
brightness_transition=50
brightness_night=10
# Set fade time for changes to one minute
fade_time=60000

if [ "$1" = period-changed ]; then
	case $3 in
		night)
			ddcutil --display=1 setvcp 10 $brightness_night
			ddcutil --display=2 setvcp 10 $brightness_night
			;;
		transition)
			ddcutil --display=1 setvcp 10 $brightness_transition
			ddcutil --display=2 setvcp 10 $brightness_transition
			;;
		daytime)
			ddcutil --display=1 setvcp 10 $brightness_day
			ddcutil --display=2 setvcp 10 $brightness_day
			;;
	esac
fi
