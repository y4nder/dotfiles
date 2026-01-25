#!/usr/bin/env bash

# Check if Spotify is running and controllable via playerctl
if ! playerctl -l 2>/dev/null | grep -q "^spotify$"; then
  # Output empty JSON (hides the module)
  echo '{"text": "", "tooltip": "Spotify not running", "class": "hidden"}'
  exit 0
fi

PLAYER="spotify"
STATUS=$(playerctl --player="$PLAYER" status 2>/dev/null)
TITLE=$(playerctl --player="$PLAYER" metadata xesam:title 2>/dev/null)
ARTIST=$(playerctl --player="$PLAYER" metadata xesam:artist 2>/dev/null)

# Determine play state
case "$STATUS" in
  "Playing") ICON=""; CLASS="playing";;
  "Paused")  ICON=""; CLASS="paused";;
  *)         ICON=""; CLASS="stopped";;
esac

# Build text and tooltip
if [ -n "$TITLE" ] && [ -n "$ARTIST" ]; then
  TEXT="  $ARTIST → $TITLE"
  TOOLTIP="<b>$TITLE</b>\n<span foreground='#83a598'>$ARTIST</span>\n<small>Status: $STATUS</small>"
else
  TEXT="  No track"
  TOOLTIP="Spotify is open but idle"
fi

# Escape double quotes for JSON safety
TEXT_ESCAPED=$(echo "$TEXT" | sed 's/"/\\"/g')
TOOLTIP_ESCAPED=$(echo "$TOOLTIP" | sed 's/"/\\"/g')

# Output JSON for Waybar
echo "{\"text\": \"$TEXT_ESCAPED\", \"tooltip\": \"$TOOLTIP_ESCAPED\", \"class\": \"$CLASS\"}"
