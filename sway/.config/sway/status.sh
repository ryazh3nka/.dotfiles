#!/bin/bash
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

json_escape() {
	jq -Rn --arg s "$1" '$s'
}

echo '{"version":1}'
echo "["

while true; do
	echo -n "["

	## CPU Usage
	cpu_raw=($(grep 'cpu ' /proc/stat))
	sleep 0.1
	cpu_raw_now=($(grep 'cpu ' /proc/stat))

	idle_before=${cpu_raw[4]}
	idle_now=${cpu_raw_now[4]}
	total_diff=0
	for i in {0..6}; do
		(( total_diff+=${cpu_raw_now[i+1]} - ${cpu_raw[i+1]} ))
	done
	idle_diff=$((idle_now - idle_before))
	cpu_usage_percent=$(awk "BEGIN {printf \"%.0f\", (100 - (($idle_diff * 100) / $total_diff))}")

	if [ "$cpu_usage_percent" -lt 60 ]; then
		cpu_color="#ffffff"
	elif [ "$cpu_usage_percent" -lt 80 ]; then
		cpu_color="#fabd2f"
	else
		cpu_color="#fb4934"
	fi
	printf '{"full_text": %s, "color": "%s"},' \
		"$(json_escape "CPU: ${cpu_usage_percent}%")" "$cpu_color"

	## RAM
	read mem_total mem_used <<< $(free -m | awk '/Mem:/ {print $2, $3}')
	ram_percent=$(( (mem_used * 100) / mem_total ))
	ram_text=$(awk -v used=$mem_used -v total=$mem_total 'BEGIN {printf "%.1fG/%.1fG (%d%%)", used/1024, total/1024, (used*100)/total}')

	if [ "$ram_percent" -lt 60 ]; then
		ram_color="#ffffff"
	elif [ "$ram_percent" -lt 80 ]; then
		ram_color="#fabd2f"
	else
		ram_color="#fb4934"
	fi
	printf '{"full_text": %s, "color": "%s"},' \
		"$(json_escape "RAM: $ram_text")" "$ram_color"

	## Disk
	disk_vals=($(df -BG --output=used,size,pcent / | tail -1))
	used=${disk_vals[0]//G/}
	size=${disk_vals[1]//G/}
	pct=${disk_vals[2]//%/}
	disk_text="Disk: ${used}G/${size}G (${pct}%)"

	if [ "$pct" -lt 60 ]; then
		disk_color="#ffffff"
	elif [ "$pct" -lt 80 ]; then
		disk_color="#fabd2f"
	else
		disk_color="#fb4934"
	fi
	printf '{"full_text": %s, "color": "%s"},' \
		"$(json_escape "$disk_text")" "$disk_color"

	## Network
	interface=$(ip route | awk '/default/ {print $5; exit}')
	net_color="#fb4934"
	if [ -n "$interface" ]; then
		ip_addr=$(ip addr show "$interface" | awk '/inet / {print $2}' | cut -d/ -f1)
		ssid=""
		if command -v iw > /dev/null && iw dev "$interface" info > /dev/null 2>&1; then
			ssid=$(iw dev "$interface" link | awk -F': ' '/SSID/ {print $2}')
		fi
		if [ -n "$ip_addr" ]; then
			net_text="$interface"
			[ -n "$ssid" ] && net_text="$net_text ($ssid)"
			net_text="$net_text $ip_addr"
			net_color="#ffffff"
		else
			net_text="$interface: Disconnected"
		fi
	else
		net_text="Disconnected"
	fi
	printf '{"full_text": %s, "color": "%s"},' \
		"$(json_escape "Net: $net_text")" "$net_color"

	## Hostname
	if [ -f /etc/hostname ]; then
		host=$(cat /etc/hostname)
		printf '{"full_text": %s, "color": "#ffffff"},' \
			"$(json_escape "Host: $host")"
	fi

	## Time
	date_str=$(date +"%a %d %b %Y %H:%M:%S")
	printf '{"full_text": %s, "color": "#ffffff"},' "$(json_escape "Time: $date_str")"

	## Battery
	if command -v acpi > /dev/null; then
		battery_raw=$(acpi -b)
		battery_percent=$(echo "$battery_raw" | grep -oP '[0-9]+(?=%)')
		charging_status=$(echo "$battery_raw" | grep -o "Charging")

		if [ "$charging_status" = "Charging" ]; then
			battery_text="Battery: Charging (${battery_percent}%)"
			battery_color="#b8bb26"
		else
			battery_text="Battery: ${battery_percent}%"
			if [ "$battery_percent" -ge 40 ]; then
				battery_color="#ffffff"
			elif [ "$battery_percent" -ge 20 ]; then
				battery_color="#fabd2f"
			else
				battery_color="#fb4934"
			fi
		fi
		printf '{"full_text": %s, "color": "%s"},' \
			"$(json_escape "$battery_text")" "$battery_color"
	fi

	echo "],"
	sleep 1
done
