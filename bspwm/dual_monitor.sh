#!/bin/bash


primary_monitor="eDP-1"
secondary_monitor="DP-1"


devices=$(xrandr -q | grep -w connected | awk '{print $1}' | wc -l )

if [ $devices == 2 ]; then	
	bspc monitor $primary_monitor -d 1 2 3 4 5 
	bspc monitor $secondary_monitor -d 6 7 8 9 0
else
	bspc monitor $primary_monitor -d 1 2 3 4 5 6 7 8 9 0
fi
