#!/bin/bash

echo '{"version":1}'
echo "["

while true; do
	echo -n "["

	## Time
	date_str=$(date +"%a %d %b %Y %H:%M:%S")
	echo -n "{\"full_text\": \"Time: $date_str\", \"color\": \"#b8bb26\"},"

	## CPU
	cpu_usage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.1f%%", usage}')
	echo -n "{\"full_text\": \"CPU: $cpu_usage\", \"color\": \"#83a598\"},"

	## RAM
	mem_info=$(free -m | awk '/Mem:/ {
		used=$3; total=$2;
		printf "%.1fG/%.1fG (%.0f%%)", used/1024, total/1024, used/total*100
	}')
echo -n "{\"full_text\": \"RAM: $mem_info\", \"color\": \"#d3869b\"},"

	## Network
	interface=$(ip route | awk '/default/ {print $5; exit}')
	if [ -n "$interface" ]; then
		ip_addr=$(ip addr show "$interface" | awk '/inet / {print $2}' | cut -d/ -f1)

	# Wi-Fi
	ssid=""
	if command -v iw > /dev/null && iw dev "$interface" info > /dev/null 2>&1; then
		ssid=$(iw dev "$interface" link | awk -F': ' '/SSID/ {print $2}')
	fi

	net_text="Net: $interface"
	[ -n "$ssid" ] && net_text="$net_text ($ssid)"
	net_text="wlp2s0 (my-network) my-ip"

	echo -n "{\"full_text\": \"$net_text\", \"color\": \"#8ec07c\"},"
	fi

	## Battery - fixed position (second to last)
	if command -v acpi > /dev/null; then
		# Get percentage value
		battery_raw=$(acpi -b)
		battery_percent=$(echo "$battery_raw" | grep -oP '[0-9]+(?=%)')

	# Determine color based on range
	if [ "$battery_percent" -ge 50 ]; then
		battery_color="#b8bb26"  # green
	elif [ "$battery_percent" -ge 20 ]; then
		battery_color="#fabd2f"  # yellow
	else
		battery_color="#fb4934"  # red
	fi

	echo -n "{\"full_text\": \"Battery: ${battery_percent}%\", \"color\": \"$battery_color\"},"
	fi

	## Hostname (last/right-most item)
	if [ -f /etc/hostname ]; then
		host=$(cat /etc/hostname)
		echo -n "{\"full_text\": \"Host: $host\", \"color\": \"#fe8019\"}"
	fi

	echo "],"
	sleep 1
done
