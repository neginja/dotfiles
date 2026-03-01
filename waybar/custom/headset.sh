#!/bin/bash

data=$(headsetcontrol -b -o JSON 2>/dev/null)

device_count=$(echo "$data" | jq '.device_count')

if [ "$device_count" -eq 0 ] || [ -z "$device_count" ]; then
    exit 0
fi

level=$(echo "$data" | jq '.devices[0].battery.level')
status=$(echo "$data" | jq -r '.devices[0].battery.status')
device=$(echo "$data" | jq -r '.devices[0].product')

# hide if battery is unavailable or level is -1
if [ "$level" -eq -1 ] || [ "$status" == "BATTERY_UNAVAILABLE" ]; then
    exit 0
fi

icon="󰋋"
if [ "$status" == "BATTERY_CHARGING" ]; then
    icon="󰋋 󰂄"
fi

echo "{\"text\": \"$icon  $level%\", \"class\": \"connected\", \"tooltip\": \"$device\"}"