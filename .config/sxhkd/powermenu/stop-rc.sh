#!/bin/bash

eww update show_confirm_poweroff=false
eww update show_confirm_reboot=false
eww update show_confirm_logout=false
eww update show_confirm_lock=false
eww close powermenu
killall sxhkd
sxhkd &
