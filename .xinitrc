#!/bin/sh

update_dwm_status() {
    mem_used=$(free -h | sed '2q;d' | cut -c25-35 | tr -d ' ')
    battery=$(cat /sys/class/power_supply/BAT0/capacity)
    datetime=$(date +"%F %R")
	disk_usage=$(df -h | sed '5q;d' | cut -c23-28 | tr -d ' ')
	#volume_tray=$(amixer sget Master | sed "5q;d" | tr -d " " | cut -c17-19)
	volume_on_off=$(amixer sget Master | awk -F'[][]' '/\[on\]/ {print "on"; exit} /\[off\]/ {print "off"; exit}')
	xsetroot -name "[volume:$volume_on_off][$battery%][$mem_used/3.7Gi]["${disk_usage}i"/228Gi][$datetime]"
}

export $(dbus-launch)

feh --bg-fill ~/pictures/dark-alley.png &

while true; do 
    update_dwm_status
    sleep 1
done &

exec dwm
