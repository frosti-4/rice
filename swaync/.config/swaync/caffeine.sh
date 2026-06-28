#!/bin/bash

# Проверяем, запущен ли уже процесс ингибитора
if pgrep -f "systemd-inhibit.*sleep infinity" > /dev/null; then
    # Если запущен - убиваем его (разрешаем сон)
    pkill -f "sleep infinity"
    notify-send "Caffeine" "Caffeine disabled" -i notifications-applet
else
    # Если не запущен - блокируем переход в состояние idle
    systemd-inhibit --what=idle --who="SwayNC" --why="Manual toggle" --mode=block sleep infinity &
    notify-send "Caffeine" "Caffeine (PC stays awake)" -i nightly
fi
