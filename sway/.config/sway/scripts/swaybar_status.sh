#!/bin/bash

echo '{"version":1}'
echo "["

while true; do
	echo -n "["

	## Time
	date_str=$(date +"%a %d %b %Y %H:%M:%S")
	echo -n "{\"full_text\": \"Time: $date_str\", \"color\": \"#b8bb26\"},"

	## CPU Usage
	cpu_usage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.1f%%", usage}')
	echo -n "{\"full_text\": \"CPU: $cpu_usage\", \"color\": \"#83a598\"},"

	## RAM
	mem_info=$(free -m | awk '/Mem:/ {
		used=$3; total=$2;
		printf "%.1fG/%.1fG (%.0f%%)", used/1024, total/1024, used/total*100
	}')
	echo -n "{\"full_text\": \"RAM: $mem_info\", \"color\": \"#d3869b\"},"

	## Disk
	disk_info=$(df -BG --output=used,size,pcent / | tail -1 | awk '{
		used=$1; total=$2; percent=$3;
		gsub("G", "", used); gsub("G", "", total); gsub("%","",percent);
		printf "Disk: %sG/%sG (%s%%)", used, total, percent
	}')
	echo -n "{\"full_text\": \"$disk_info\", \"color\": \"#fabd2f\"},"

	## Network
	interface=$(ip route | awk '/default/ {print $5; exit}')
	if [ -n "$interface" ]; then
		# Check if interface has an IP
		ip_addr=$(ip addr show "$interface" | awk '/inet / {print $2}' | cut -d/ -f1)
		ssid=""

		# Try to get SSID if it's a Wi-Fi interface
		if command -v iw > /dev/null && iw dev "$interface" info > /dev/null 2>&1; then
			ssid=$(iw dev "$interface" link | awk -F': ' '/SSID/ {print $2}')
		fi

		if [ -n "$ip_addr" ]; then
			# Connected
			net_text="$interface"
			[ -n "$ssid" ] && net_text="$net_text ($ssid)"
			net_text="$net_text $ip_addr"
		else
			# Disconnected
			net_text="$interface: Disconnected"
		fi

		echo -n "{\"full_text\": \"Net: $net_text\", \"color\": \"#8ec07c\"},"
	else
		echo -n "{\"full_text\": \"Net: Disconnected\", \"color\": \"#8ec07c\"},"
	fi


	## Hostname
	if [ -f /etc/hostname ]; then
		host=$(cat /etc/hostname)
		echo -n "{\"full_text\": \"Host: $host\", \"color\": \"#fe8019\"},"
	fi

    ## 🔋 Battery
	if command -v acpi > /dev/null; then
		battery_raw=$(acpi -b)
		battery_percent=$(echo "$battery_raw" | grep -oP '[0-9]+(?=%)')
		charging_status=$(echo "$battery_raw" | grep -o "Charging")

		if [ "$charging_status" = "Charging" ]; then
			battery_text="Battery: Charging (${battery_percent}%)"
			battery_color="#b8bb26" # always green while charging
		else
			# Not charging, apply color based on percent
			battery_text="Battery: ${battery_percent}%"
			if [ "$battery_percent" -ge 50 ]; then
				battery_color="#b8bb26"
			elif [ "$battery_percent" -ge 20 ]; then
				battery_color="#fabd2f"
			else
				battery_color="#fb4934"
			fi
		fi

		echo -n "{\"full_text\": \"$battery_text\", \"color\": \"$battery_color\"},"
	fi

	echo "],"
	sleep 1
done
