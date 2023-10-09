#!/bin/bash

current_desktop=`bspc query -D -d .focused --names`
current_monitor=0
case "$current_desktop" in
	XI | XII | XIII | XIV | XV | XVI | XVII | XVIII | XIX | XX) current_monitor=1;;
	XXI | XXII | XXIII | XXIV | XXV | XXVI | XXVII | XXVIII | XXIX | XXX) current_monitor=2;;
esac
workspaces_arr=(I II III IV V VI VII VIII IX X)
if [[ $current_monitor == 1 ]]; then
	workspaces_arr=(XI XII XIII XIV XV XVI XVII XVIII XIX XX)
fi
if [[ $current_monitor == 2 ]]; then
	workspaces_arr=(XXI XXII XXIII XXIV XXV XXVI XXVII XXVIII XXIX XXX)
fi

workspace=${workspaces_arr[0]}
case "$2" in
	"2") workspace=${workspaces_arr[1]};;
	"3") workspace=${workspaces_arr[2]};;
	"4") workspace=${workspaces_arr[3]};;
	"5") workspace=${workspaces_arr[4]};;
	"6") workspace=${workspaces_arr[5]};;
	"7") workspace=${workspaces_arr[6]};;
	"8") workspace=${workspaces_arr[7]};;
	"9") workspace=${workspaces_arr[8]};;
	"10") workspace=${workspaces_arr[9]};;
esac

if [[ "$1" == "f" ]]; then
	bspc desktop -f "$workspace"
else
	bspc node -d "$workspace" 
fi
