#!/usr/bin/env bash

cleanup() {
    pkill -P $$
    exit
}
trap cleanup SIGTERM SIGPIPE

set -u

CAVA_CONFIG="$HOME/.config/cava/config"
MAX_VALUE=40

BLOCKS=(" " "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" "█" "█" "█" "█" "█" "█" "█")

cava -p "$CAVA_CONFIG" | while read -r line; do
    line="${line%;}"
    bars=""
    IFS=';' read -ra values <<< "$line"

    # exactly 4 bars
    for i in {0..3}; do
        value="${values[$i]:-0}"
        height=$(( value * 16 / MAX_VALUE ))
        (( height > 15 )) && height=15
        (( height < 0 )) && height=0
        bars+="${BLOCKS[$height]}"
    done

    echo "{\"text\":\"$bars\"}"
done

