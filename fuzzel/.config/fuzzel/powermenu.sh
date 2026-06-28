#!/bin/bash

SELECTION="$(echo -e "󰐥 Shutdown\n󰜉 Reboot\n󰤄 Suspend\n󰈆 Logout\n󰷛 Lock" | fuzzel --dmenu --prompt='⚡ ' --lines=5 -p 20)"

case "$SELECTION" in
    *Shutdown) systemctl poweroff ;;
    *Reboot) systemctl reboot ;;
    *Suspend) systemctl suspend ;;
    *Logout) niri msg action quit ;;
    *Lock) loginctl lock-session ;;
esac
