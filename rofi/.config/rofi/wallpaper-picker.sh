#!/bin/bash
DIR="$HOME/Pictures/Wallpapers/"
THEME="$HOME/.config/rofi/wallpaper-picker.rasi"
mapfile -t FILES < <(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \))

CHOICE=$(for file in "${FILES[@]}"; do
    PREVIEW="/tmp/wallpaper_preview_$(basename "$file" | md5sum | cut -d' ' -f1).png"

    if [[ ! -f "$PREVIEW" ]]; then
        convert "$file" -resize 120x68 -background black -gravity center -extent 120x68 "$PREVIEW" 2>/dev/null
    fi    

#    if [[ ! -f "$PREVIEW" || "$file" -nt "$PREVIEW" ]]; then
#        convert "$file" -resize 100x100 -gravity center -extent 100x100 "$PREVIEW" 2>/dev/null || \
#        ffmpeg -i "$file" -vf "scale=100:100:force_original_aspect_ratio=0,crop=100:100" "$PREVIEW" -y 2>/dev/null
#    fi
    
    printf "%s\x00icon\x1f%s\n" "$(basename "$file")" "$PREVIEW"
done | rofi -dmenu -i -p "󰸉 " -theme-str 'element-icon { size: 100px; }' -show-iconso -theme "$THEME" )

if [ -n "$CHOICE" ]; then
    SELECTED_FILE=$(printf "%s\n" "${FILES[@]}" | grep -F "$CHOICE")
    
    awww img "$SELECTED_FILE" --transition-type grow --transition-pos 0.85,0.97 --transition-duration 2
    
    matugen image "$SELECTED_FILE" --source-color-index 1
    
    pkill -USR2 waybar
    swaync-client -Rs
fi
