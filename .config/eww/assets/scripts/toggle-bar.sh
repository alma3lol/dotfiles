#!/bin/bash

current_top_padding=$(bspc config top_padding)
if [ $current_top_padding = "60" ]; then
	bspc config top_padding 5
	eww close bar
else
	bspc config top_padding 60
	eww open bar
fi
