#!/bin/bash
# Counts pending Arch Linux updates
updates=$(checkupdates 2>/dev/null | wc -l)
if [ -n "$updates" ] && [ "$updates" -gt 0 ]; then
    echo "$updates"
else
    echo "0"
fi
