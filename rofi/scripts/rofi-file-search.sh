#!/bin/bash

# Use fd if available, otherwise fallback to find
if command -v fd >/dev/null 2>&1; then
    FILE=$(fd --type f | rofi -dmenu -i -p "Find File:")
else
    FILE=$(find ~/ -type f 2>/dev/null | rofi -dmenu -i -p "Find File:")
fi

# Open the file if one is selected
[ -n "$FILE" ] && xdg-open "$FILE"
