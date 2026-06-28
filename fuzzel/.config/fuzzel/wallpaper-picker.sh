#!/bin/bash
DIR="$HOME/Pictures/Wallpapers/"

CHOICE=$(find "$DIR" -type f | fuzzel --dmenu --prompt='󰸉 ' --lines=10)

if [ -n "$CHOICE" ]; then
#    FULL_PATH="$DIR/$PODDIR/$CHOICE"
    awww img "$CHOICE" --transition-type grow --transition-pos 0.85,0.97 --transition-duration 2
    
    matugen image "$CHOICE" --source-color-index 1
    
    pkill -USR2 waybar
    swaync-client -Rs
fi
