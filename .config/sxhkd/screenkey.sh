#!/bin/bash

pid=`pgrep -x screenkey`

if [[ "$pid" == "" ]]; then
	screenkey -p fixed -g '50%x10%+25%+10%' &
else
	killall screenkey
fi;
