#!/bin/bash

# Get the battery percentage (you may need to adjust this command based on your system)
battery_status=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | grep -o "[0-9]*")
notification_url="https://ntfy.avila-miguel.com/ServerBattery"

# Check if the battery percentage is less than 50%
if [ "$battery_status" -lt 50 ]; then
   curl \
    -H "Tags: rotating_light, rotating_light, Low Battery, skull, warning" \
    -H "Title: Laptop Battery Low: $battery_status" \
    -d "Plug Charger or check charger light." \
    $notification_url
fi
