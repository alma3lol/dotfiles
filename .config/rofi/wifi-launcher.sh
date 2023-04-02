#!/usr/bin/env bash

notify-send "Getting list of available Wi-Fi networks..."
# Get a list of available wifi connections and morph it into a nice-looking list
wifi_list=$(nmcli --fields "SECURITY,SSID,IN-USE" d w list --rescan yes | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d" | sed 's/\* $/(CONNECTED)/g')

# Use rofi to select wifi network
chosen_network=$(echo -e "直  Configure Wi-Fi\n$wifi_list" | uniq -u | rofi -dmenu -i -p "Wi-Fi SSID: " )
# Get name of connection
chosen_id=$(echo "${chosen_network:3}" | sed 's/ (CONNECTED)//g' | xargs)

if [ "$chosen_network" = "" ]; then
	exit
elif [ "$chosen_network" = "直  Configure Wi-Fi" ]; then
	connected=$(nmcli -fields WIFI g)
	if [[ "$connected" =~ "enabled" ]]; then
		toggle="睊  Disable Wi-Fi"
	elif [[ "$connected" =~ "disabled" ]]; then
		toggle="直  Enable Wi-Fi"
	fi

	chosen_config=$(echo -e "直  Reboot Wi-Fi\n󱛄  Rescan\n$toggle" | uniq -u | rofi -dmenu -i -p "Wi-Fi Config: " )
	if [ "$chosen_config" = "" ]; then
		exit
	elif [ "$chosen_config" = "直  Reboot Wi-Fi" ]; then
		nmcli radio wifi off
		nmcli radio wifi on
	elif [ "$chosen_config" = "直  Enable Wi-Fi" ]; then
		nmcli radio wifi on
	elif [ "$chosen_config" = "睊  Disable Wi-Fi" ]; then
		nmcli radio wifi off
	elif [ "$chosen_config" = "󱛄  Rescan" ]; then
		$0
	fi
else
	# Message to show when connection is activated successfully
	success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."
	# Get saved connections
	saved_connections=$(nmcli -g NAME connection)
	if [[ $(echo "$saved_connections" | grep -w "$chosen_id") = "$chosen_id" ]]; then
		nmcli connection up id "$chosen_id" | grep "successfully" && notify-send "Connection Established" "$success_message"
	else
		if [[ "$chosen_network" =~ "" ]]; then
			wifi_password=$(rofi -dmenu -p "Password: " )
		fi
		nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully" && notify-send "Connection Established" "$success_message"
	fi
fi
