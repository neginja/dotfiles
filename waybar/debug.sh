#!/bin/bash
CONFIG_FILES="$HOME/.config/waybar/config.jsonc $HOME/.config/waybar/style.css"

while true; do
    waybar &
    inotifywait -e modify $CONFIG_FILES
    killall waybar
    sleep 1
done