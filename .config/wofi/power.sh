#!/usr/bin/env bash

entries="Logout Suspend Reboot Shutdown Reload"

selected=$(printf '%s\n' $entries | wofi --conf=$HOME/.config/wofi/config_power --style=$HOME/.config/wofi/style.css | awk '{print tolower($1)}')

case $selected in
    logout)
        pkill -u $(whoami);;
    suspend)
        entries2=$(cat ~/.cache/mtfiles/msleep_times)
        selected2=$(printf '%s\n' $entries2 | wofi --conf=$HOME/.config/wofi/config_power --style=$HOME/.config/wofi/style.css | awk '{print tolower($1)}')
        case $selected2 in
            "")
                exec systemctl suspend;;
            *)
                grep $selected2 ~/.cache/mtfiles/msleep_times || echo $selected2 >> ~/.cache/mtfiles/msleep_times
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
