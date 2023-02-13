#!/bin/bash

wlanPid=`ls /tmp/polybar_mqueue-wlan.* | awk -F. '{print $2}'`
ethPid=`ls /tmp/polybar_mqueue-eth.* | awk -F. '{print $2}'`

polybar-msg -p $ethPid cmd toggle &
polybar-msg -p $wlanPid cmd toggle &
