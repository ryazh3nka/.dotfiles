# get the class and floating status of the active window

# if the window is already floating, toggle it back to tiled
if [[ $is_floating == "1" ]]; then
    hyprctl dispatch togglefloating
    exit 0
fi

# convert active_class to lowercase
active_class_lower=$(echo "$active_class" | tr '[:upper:]' '[:lower:]')

if [[ $active_class_lower == *"foot"* || $active_class_lower == *"qutebrowser"* || $active_class_lower == *"telegram"* ]]; then
    hyprctl dispatch togglefloating
    hyprctl dispatch resizeactive 500 300
    hyprctl dispatch centerwindow
else
    hyprctl dispatch togglefloating
fi
