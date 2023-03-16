#!/bin/bash

result=$(printf "Static\nBreathing\nRainbow\nRandom\nWave\nMusic\nOff" | rofi -dmenu -i -p "Choose mode: ")

choose_color() {
	echo $(rofi -dmenu -i -p "Hex color (without '#'): ")
}

case $result in
	"Static")
		color=$(choose_color)
		openrgb -d 0 -m $result -c "$color">/dev/null;;
	"Breathing")
		color=$(choose_color)
		openrgb -d 0 -m $result -c "$color">/dev/null;;
	"Rainbow")
		openrgb -d 0 -m $result>/dev/null;;
	"Random")
		openrgb -d 0 -m $result>/dev/null;;
	"Wave")
		openrgb -d 0 -m $result>/dev/null;;
	"Music")
		openrgb -d 0 -m $result>/dev/null;;
	"Off")
		openrgb -d 0 -m $result>/dev/null;;
esac
