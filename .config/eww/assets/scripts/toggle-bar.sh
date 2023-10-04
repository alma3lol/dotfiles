#!/bin/bash

monitors_count=`bspc query -M | wc -l`
current_top_padding=$(bspc config top_padding)
if [ $current_top_padding = "60" ]; then
	bspc config top_padding 5
	eww close bar0
	if [[ $monitors_count -gt 1 ]]; then eww close bar1; fi
	if [[ $monitors_count -gt 2 ]]; then eww close bar2; fi
else
	bspc config top_padding 60
	eww open bar0
	if [[ $monitors_count -gt 1 ]]; then eww open bar1; fi
	if [[ $monitors_count -gt 2 ]]; then eww open bar2; fi
fi
