#!/bin/bash

# Default starting directory
HOME_DIR=/home/yander/Documents

# Absolute paths to commands
FD_CMD=/usr/bin/fd
FIND_CMD=/usr/bin/find
ROFI_CMD=/usr/bin/rofi
XDGOPEN_CMD=/usr/bin/xdg-open
NOTIFY_CMD=/usr/bin/notify-send

# Directories to exclude
EXCLUDE_DIRS=("node_modules" ".git" "dist" "build" "__pycache__")

# Build fd exclude flags
FD_IGNORE=()
for dir in "${EXCLUDE_DIRS[@]}"; do
    FD_IGNORE+=(--exclude "$dir")
done

# Build find exclude expression
FIND_IGNORE=""
for dir in "${EXCLUDE_DIRS[@]}"; do
    FIND_IGNORE+=" -path $HOME_DIR/$dir/* -prune -o"
done

# Use fd if available, otherwise fallback to find
if [ -x "$FD_CMD" ]; then
    FILE=$($FD_CMD --type f "$HOME_DIR" "${FD_IGNORE[@]}" | $ROFI_CMD -dmenu -i -p "Find File:")
elif [ -x "$FIND_CMD" ]; then
    FILE=$(eval "$FIND_CMD $HOME_DIR $FIND_IGNORE -type f -print" | $ROFI_CMD -dmenu -i -p "Find File:")
else
    "$NOTIFY_CMD" "File search failed" "Neither fd nor find command found."
    exit 1
fi

# Open the file if one is selected, else notify
if [ -n "$FILE" ]; then
    "$XDGOPEN_CMD" "$FILE"
else
    "$NOTIFY_CMD" "No file selected" "File search cancelled."
fi
