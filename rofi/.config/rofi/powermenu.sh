#!/bin/bash

THEME="$HOME/.config/rofi/powermenu.rasi"

lock="󰌾 Заблокировать"
suspend="󰤄 Сон"
logout="󰍃 Выйти"
reboot="󰜉 Перезагрузить"
shutdown="󰐥 Выключить"

options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | rofi -dmenu -i -p "Power" -theme "$THEME")"

case $chosen in
    $lock)
        swaylock --screenshots --clock --indicator --effect-blur 7x5 || loginctl lock-session
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        niri msg action quit || loginctl terminate-user $USER
        ;;
    $reboot)
        systemctl reboot
        ;;
    $shutdown)
        systemctl poweroff
        ;;
esac
