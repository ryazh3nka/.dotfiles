#!/bin/bash

BTOP_WORKSPACE="10"
STATE_FILE="/tmp/btop_toggle_state"
FOOT_TITLE="btop_monitor"

get_current_workspace() {
    hyprctl activeworkspace -j | jq -r '.id'
}

is_btop_running_elsewhere() {
    pgrep -f "foot.*btop" | while read -r pid; do
        wid=$(ps -o pid= -o args= | grep "$pid" | grep -oP '\d+(?=\.foot)')
        if [ -n "$wid" ]; then
            if [ ! -f "$STATE_FILE" ]; then
                return 0
            fi
        fi
    done
    return 1
}

launch_btop() {
    hyprctl dispatch workspace "$BTOP_WORKSPACE"
    sleep 0.1
    hyprctl dispatch exec "foot --title '$FOOT_TITLE' -e btop"
    echo "$CURRENT_WS" > "$STATE_FILE"
}

close_btop() {
    pkill -f "foot.*--title $FOOT_TITLE.*btop"
}

if ! command -v hyprctl &> /dev/null || ! command -v jq &> /dev/null || ! command -v foot &> /dev/null || ! command -v btop &> /dev/null; then
    echo "Required tools missing: hyprctl, jq, foot, or btop not found."
    exit 1
fi

if [ -f "$STATE_FILE" ]; then
    PREV_WS=$(cat "$STATE_FILE")
    close_btop
    sleep 0.2
    hyprctl dispatch workspace "$PREV_WS"
    rm "$STATE_FILE"
    exit 0
fi

if is_btop_running_elsewhere; then
    echo "btop is already running elsewhere. Toggle aborted."
    exit 1
fi

CURRENT_WS=$(get_current_workspace)
launch_btop
exit 0
