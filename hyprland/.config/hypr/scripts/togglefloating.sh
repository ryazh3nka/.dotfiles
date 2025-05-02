# get the class and floating status of the active window
active_class=$(hyprctl activewindow | awk -F": " '/class:/ {print $2}')
is_floating=$(hyprctl activewindow | awk -F": " '/floating:/ {print $2}')

# if the window is already floating, toggle it back to tiled
if [[ $is_floating == "1" ]]; then
    hyprctl dispatch togglefloating
    exit 0
fi

# Convert active_class to lowercase
active_class_lower=$(echo "$active_class" | tr '[:upper:]' '[:lower:]')

if [[ $active_class_lower == *"foot"* || $active_class_lower == *"thunar"* ]]; then
    hyprctl dispatch togglefloating
    hyprctl dispatch resizeactive exact 50% 50%
    hyprctl dispatch centerwindow
else
    hyprctl dispatch togglefloating
fi
