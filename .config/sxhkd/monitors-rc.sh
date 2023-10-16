#!/bin/bash

if [[ "$1" == "close" ]]; then
	eww close monitors
	killall sxhkd
	sxhkd &
elif [[ "$1" == "open" ]]; then
	eww open monitors
	killall sxhkd
	sxhkd -c ~/.config/sxhkd/monitors.rc &
fi
