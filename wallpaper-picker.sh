OBOE=$1

if [ -f "$OBOE" ]; then
    awww img "$OBOE" --transition-type grow --transition-duration 1.5

    matugen image "$OBOE" --source-color-index 1 -m dark -q

    pkill -USR2 waybar
    swaync-client -rs
    
    echo "Wallpaper" "Стиль обновлен: $OBOE"
else
    echo "Ошибка" "Файл не найден или это папка"
fi
