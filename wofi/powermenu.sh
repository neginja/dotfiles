#!/bin/bash

conf_file=~/.config/wofi/powermenu
style_file=~/.config/wofi/powermenu.css
options="  Shutdown\n  Reboot\n󰤄  Sleep\n󰍃  Logout"
choice=$(echo -e "$options" | wofi --dmenu --conf $conf_file --style $style_file)

confirm_exit() {
    echo -e "  Yes\n  No" | wofi --dmenu --conf $conf_file --style $style_file --height 120 --prompt "Are you sure?"
}

case "$choice" in
    *Shutdown)
        [[ $(confirm_exit) == *"Yes"* ]] && systemctl poweroff
        ;;
    *Reboot)
        [[ $(confirm_exit) == *"Yes"* ]] && systemctl reboot
        ;;
    *Sleep)
        systemctl suspend
        ;;
    *Logout)
        [[ $(confirm_exit) == *"Yes"* ]] && hyprctl dispatch "hl.dsp.exit()"
        ;;
esac