#!/usr/bin/env bash

set -e

CONFIGS=("driftwm" "fastfetch" "fish" "kitty" "matugen" "rofi" "swaync" "waybar")
DOTFILES_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

echo "Installing dots"

if ! command -v stow &>/dev/null; then
  echo "Please install stow"
  exit 1
fi

mkdir -p "$HOME"

echo "Making backups"
for config in "${CONFIGS[@]}"; do
  if [ -e "$HOME/.config/$config" ] && [ ! -L "$HOME/$config" ]; then
    BACKUP_NAME="$HOME/.config/${config}.bak"
    echo "Found config for [$config]. Moved to $BACKUP_NAME"
    mv "$HOME/.config/$config" "$BACKUP_NAME"
  elif [ -L "$HOME/.config/$config" ]; then
    echo "Found old symlink [$cofig], deleting"
    rm "$HOME/.config/$config"
  fi
done

echo "Making symlinks"
cd "$DOTFILES_DIR"

for config in "${CONFIGS[@]}"; do
  if [ -d "$config" ]; then
    echo "Installing: $config"
    stow -R -t "$HOME" "$config"
  else
    echo "Skipping [$config]: author eblan"
  fi
done

echo "Installation finished"
