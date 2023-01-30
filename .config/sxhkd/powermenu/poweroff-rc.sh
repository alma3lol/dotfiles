#!/bin/bash

show_confirm_action() {
	eww update show_confirm_poweroff=true
	eww update show_confirm_logout=false
	eww update show_confirm_lock=false
	eww update show_confirm_reboot=false
	eww update show_confirm_suspend=false
	killall sxhkd
	sxhkd -c ~/.config/sxhkd/powermenu/poweroff &
}

confirm_action() {
	~/.config/sxhkd/powermenu/stop-rc.sh
	poweroff
}

cancel_action() {
	eww update show_confirm_poweroff=false
	killall sxhkd
	sxhkd -c ~/.config/sxhkd/powermenu/sxhkdrc &
}

if [[ "$1" == "show_confirm_action" ]]; then
	show_confirm_action
elif [ "$1" == "confirm_action" ]; then
	confirm_action
elif [ "$1" == "cancel_action" ]; then
	cancel_action
fi
