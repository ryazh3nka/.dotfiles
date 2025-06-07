#!/bin/bash

window_info=$(hyprctl activewindow -j)
addr=$(echo "$window_info" | jq -r '.address')
floating=$(echo "$window_info" | jq -r '.floating')

if [ -z "$addr" ] || [ "$addr" == "null" ]; then
	notify-send "Hyprland" "No active window found"
	exit 1
fi

if [ "$floating" == "false" ]; then
	# Save tiled size (approx)
	size=$(echo "$window_info" | jq -r '.size')
	width=$(echo "$size" | jq -r '.x')
	height=$(echo "$size" | jq -r '.y')

	hyprctl dispatch togglefloating
	hyprctl dispatch resizeactive exact 1000 700
	hyprctl dispatch centerwindow
else
	hyprctl dispatch togglefloating

	if [ -n "$width" ] && [ -n "$height" ]; then
		hyprctl dispatch resizeactive exact "$width" "$height"
	fi
fi
