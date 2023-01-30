#!/bin/bash
#
eww open music_win
killall sxhkd
sxhkd -c ~/.config/sxhkd/music_win/sxhkdrc
