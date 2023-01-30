#!/bin/bash

show_confirm_action() {
	eww update show_confirm_logout=true
	eww update show_confirm_lock=false
	eww update show_confirm_poweroff=false
	eww update show_confirm_reboot=false
	eww update show_confirm_suspend=false
	killall sxhkd
	sxhkd -c ~/.config/sxhkd/powermenu/logout &
}

confirm_action() {
	~/.config/sxhkd/powermenu/stop-rc.sh
	loginctl kill-session self
}

cancel_action() {
	eww update show_confirm_logout=false
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
