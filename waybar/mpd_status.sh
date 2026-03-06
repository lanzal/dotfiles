#!/bin/bash
# Get the exact state without overwhelming the system
state=$(mpc status 2>/dev/null | grep -o "\[playing\]")

if [ "$state" == "[playing]" ]; then
    echo "󰏤" # Pause Icon
else
    echo "󰐊" # Play Icon
fi
