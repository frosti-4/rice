#!/bin/bash

THEME="$HOME/.config/rofi/powermenu.rasi"

shutdown="󰐥 Shutdown"
reboot="󰜉 Reboot"
lock="󰌾 Lock"
suspend="󰤄 Sleep"
logout="󰍃 Exit"

options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | rofi -dmenu -i -p "Power" -theme "$THEME")"

case $chosen in
$lock)
  sh ~/dots/driftwm/.config/driftwm/lock.sh
  ;;
$suspend)
  systemctl suspend
  ;;
$logout)
  loginctl terminate-user $USER
  ;;
$reboot)
  systemctl reboot
  ;;
$shutdown)
  systemctl poweroff
  ;;
esac
