#!/bin/bash

if pgrep -f "systemd-inhibit.*sleep infinity" >/dev/null; then
  pkill -f "sleep infinity"
  notify-send "Caffeine" "Caffeine disabled" -i notifications-applet
else
  systemd-inhibit --what=idle --who="SwayNC" --why="Manual toggle" --mode=block sleep infinity &
  notify-send "Caffeine" "Caffeine (PC stays awake)" -i nightly
fi
