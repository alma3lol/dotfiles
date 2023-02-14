#!/usr/bin/env bash

# Terminate already running bar instances
killall polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
rm /tmp/polybar_mqueue*

# Launch polybar
polybar time -c $HOME/.config/polybar/ocean/config.ini &
ln -s /tmp/polybar_mqueue.$! /tmp/polybar_mqueue-time.$!
polybar wlan -c $HOME/.config/polybar/ocean/config.ini &
ln -s /tmp/polybar_mqueue.$! /tmp/polybar_mqueue-wlan.$!
polybar extras -c $HOME/.config/polybar/ocean/config.ini &
ln -s /tmp/polybar_mqueue.$! /tmp/polybar_mqueue-extras.$!
polybar weather -c $HOME/.config/polybar/ocean/config.ini &
ln -s /tmp/polybar_mqueue.$! /tmp/polybar_mqueue-weather.$!
polybar power -c $HOME/.config/polybar/ocean/config.ini &
ln -s /tmp/polybar_mqueue.$! /tmp/polybar_mqueue-power.$!
polybar workspaces -c $HOME/.config/polybar/ocean/config.ini &
ln -s /tmp/polybar_mqueue.$! /tmp/polybar_mqueue-workspaces.$!

if [[ $(xrandr -q | grep 'HDMI1 connected') ]]; then
	polybar external -c $(dirname $0)/config.ini &
fi
