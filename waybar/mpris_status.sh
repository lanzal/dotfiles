#!/bin/bash
# Get the exact playback status using playerctl
status=$(playerctl status 2>/dev/null)

if [ "$status" == "Playing" ]; then
    echo "󰏤" # Pause Icon
else
    echo "󰐊" # Play Icon
fi
