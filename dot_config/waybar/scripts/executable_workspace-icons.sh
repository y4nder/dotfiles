#!/usr/bin/env bash
# ~/.config/waybar/scripts/workspace-icons.sh
clients=$(hyprctl clients -j)
icons=""

for ws in {1..5}; do
    # get all classes in this workspace
    classes=$(echo "$clients" | jq -r --arg ws "$ws" '.[] | select(.workspace.name == $ws) | .class')
    
    ws_icons=""
    for app in $classes; do
        icon="" # default

        case "$app" in
            *Firefox*) icon="" ;;
            *chromium*|*chrome*) icon="" ;; 
            *spotify*) icon="" ;;
            *Code*) icon="" ;;
            *Discord*) icon="ﭮ" ;;
            *Ghostty*) icon="" ;;
        esac

        ws_icons="$ws_icons$icon "
    done

    icons="$icons$ws_icons| "
done

# remove trailing separator
icons=${icons%| }

# output single JSON object
echo "{\"text\":\"$icons\"}"

