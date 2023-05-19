#!/bin/bash

if [[ "$1" == "close" ]]; then
	eww close openmenu
	killall sxhkd
	sxhkd &
elif [[ "$1" == "open" ]]; then
	eww open openmenu
	killall sxhkd
	sxhkd -c ~/.config/sxhkd/openmenu.rc &
elif [[ "$1" == "brave" ]]; then
	brave &
	~/.config/sxhkd/openmenu-rc.sh close
elif [[ "$1" == "screenkey" ]]; then
	~/.config/sxhkd/screenkey.sh
	~/.config/sxhkd/openmenu-rc.sh close
elif [[ "$1" == "microsoft-edge-stable" ]]; then
	microsoft-edge-stable &
	~/.config/sxhkd/openmenu-rc.sh close
elif [[ "$1" == "obsidian" ]]; then
	obsidian &
	~/.config/sxhkd/openmenu-rc.sh close
elif [[ "$1" == "obs" ]]; then
	obs &
	~/.config/sxhkd/openmenu-rc.sh close
elif [[ "$1" == "kitty" ]]; then
	kitty &
	~/.config/sxhkd/openmenu-rc.sh close
elif [[ "$1" == "pulseaudio" ]]; then
	pulseaudio -k
	pulseaudio --start
	~/.config/sxhkd/openmenu-rc.sh close
fi
