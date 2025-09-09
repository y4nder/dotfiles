#!/bin/bash

# ==============================
# Dotfiles Linking Script
# ==============================
# Edit the FILES_TO_LINK list below to specify what files/folders to symlink

DOTFILES_DIR="$HOME/dotfiles"  # Your dotfiles directory

FILES_TO_LINK=(
  # Shell config
  "$DOTFILES_DIR/zshrc:$HOME/.zshrc"

  # Config directories
  "$DOTFILES_DIR/rofi:$HOME/.config/rofi"
  "$DOTFILES_DIR/spicetify:$HOME/.config/spicetify"
  "$DOTFILES_DIR/neofetch:$HOME/.config/neofetch"
  "$DOTFILES_DIR/themes:$HOME/.themes"

  # Rofi Script mapping
  "$DOTFILES_DIR/rofi/scripts/config/rofi-gpaste.conf:$HOME/.config/rofi-gpaste.conf"
)

# ==============================
# Script Logic
# ==============================

echo "🔹 Starting dotfiles linking..."

for entry in "${FILES_TO_LINK[@]}"; do
  SRC="${entry%%:*}"
  DEST="${entry##*:}"

  # Make sure the source exists
  if [ ! -e "$SRC" ]; then
    echo "⚠️ Source not found, skipping: $SRC"
    continue
  fi

  # Make sure parent directory exists
  mkdir -p "$(dirname "$DEST")"

  # Backup existing file/folder if it exists and is not a symlink
  if [ -e "$DEST" ] && [ ! -L "$DEST" ]; then
    echo "⚠️ Backing up existing: $DEST → $DEST.backup"
    mv "$DEST" "$DEST.backup"
  fi

  # Remove existing symlink if present
  if [ -L "$DEST" ]; then
    rm "$DEST"
  fi

  # Create the symlink
  echo "🔗 Linking $SRC → $DEST"
  ln -s "$SRC" "$DEST"
done

echo "✅ Dotfiles linking complete!"
