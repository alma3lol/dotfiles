#!/bin/bash

wlanPid=`ls /tmp/polybar_mqueue-wlan.* | awk -F. '{print $2}'`

polybar-msg -p $wlanPid action eth module_toggle &
polybar-msg -p $wlanPid action wlan module_toggle &
