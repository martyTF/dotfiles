#!/usr/bin/env bash

entries="Logout Suspend Reboot Shutdown Reload"

selected=$(printf '%s\n' $entries | wofi --conf=$HOME/.config/wofi/config_power --style=$HOME/.config/wofi/style.css | awk '{print tolower($1)}')

case $selected in
    logout)
        pkill -u $(whoami);;
    suspend)
        selected2=$(printf '' | wofi --conf=$HOME/.config/wofi/config_power --style=$HOME/.config/wofi/style.css | awk '{print tolower($1)}')
        case $selected2 in
            "")
                exec systemctl suspend;;
            *)
                exec ~/.local/bin/msleep $selected2;;
            esac;;
    reboot)
        exec systemctl reboot;;
    shutdown)
        exec systemctl poweroff -i;;
    reload)
        exec hyprctl reload
        exec sway reload;;
    esac
