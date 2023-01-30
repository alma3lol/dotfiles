#!/bin/bash
#
eww open powermenu
killall sxhkd
sxhkd -c ~/.config/sxhkd/powermenu/sxhkdrc
