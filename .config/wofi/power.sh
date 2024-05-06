#!/usr/bin/env bash

entries="Suspend Logout Shutdown Reload"

selected=$(printf '%s\n' $entries | wofi --conf=$HOME/.config/wofi/config_power --style=$HOME/.config/wofi/style.css | awk '{print tolower($1)}')

case $selected in
    logout)
        entries2="LY-DM TTY"
        selected2=$(printf '%s\n' $entries2 | wofi --conf=$HOME/.config/wofi/config_power --style=$HOME/.config/wofi/style.css | awk '{print tolower($1)}')
        case $selected2 in
            ly-dm)
                pkill -u $(whoami);;
            tty)
                chvt 5
                pkill -u $(whoami);;
            esac;;
    suspend)
        entries2=$(cat ~/.cache/mtfiles/msleep_times | sort)
        selected2=$(printf '%s\n' $entries2 | wofi --conf=$HOME/.config/wofi/config_power --style=$HOME/.config/wofi/style.css | awk '{print tolower($1)}')
        case $selected2 in
            "")
                exec systemctl suspend;;
            [0-2][0-9]:[0-5][0-9])
                grep $selected2 ~/.cache/mtfiles/msleep_times || echo $selected2 >> ~/.cache/mtfiles/msleep_times
                exec ~/.local/bin/msleep $selected2;;
            *)
                exit;;
            esac;;
    shutdown)
        entries2="Shutdown Reboot"
        selected2=$(printf '%s\n' $entries2 | wofi --conf=$HOME/.config/wofi/config_power --style=$HOME/.config/wofi/style.css | awk '{print tolower($1)}')
        case $selected2 in
            reboot)
                exec systemctl reboot;;
            shutdown)
                exec systemctl poweroff -i;;
            esac;;
    reload)
        exec hyprctl reload
        exec sway reload;;
    esac
