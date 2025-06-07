#!/bin/bash

input="$1"

get_tabbed_direction() {
	case "$1" in
		down) echo "right" ;;
		up) echo "left" ;;
	esac
}

get_default_direction() {
	case "$1" in
		down) echo "down" ;;
		up) echo "up" ;;
	esac
}

focused_id=$(swaymsg -t get_tree | jq '.. | objects | select(.focused? == true) | .id')

layout=$(swaymsg -t get_tree | jq -r --argjson fid "$focused_id" '
.. | objects
| select(.nodes? != null and (.nodes | map(.id) | index($fid)))
| .layout' | head -n 1)

if [[ "$layout" == "tabbed" ]]; then
	dir=$(get_tabbed_direction "$input")
else
	dir=$(get_default_direction "$input")
fi

[ -n "$dir" ] && swaymsg "focus $dir"
