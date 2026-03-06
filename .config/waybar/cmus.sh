#!/bin/bash
if ! pgrep -x cmus > /dev/null; then echo ""; exit 0; fi

while read -r key subkey value; do
    if [[ "$key" == "status" ]]; then state="$subkey"
    elif [[ "$key" == "duration" ]]; then duration="$subkey"
    elif [[ "$key" == "position" ]]; then position="$subkey"
    elif [[ "$key" == "tag" ]]; then
        if [[ "$subkey" == "artist" ]]; then artist="$value"
        elif [[ "$subkey" == "title" ]]; then title="$value"
        fi
    fi
done < <(cmus-remote -Q 2>/dev/null)

if [[ -n "$position" && -n "$duration" ]]; then
    printf -v pos_str "%02d:%02d" $((position/60)) $((position%60))
    printf -v dur_str "%02d:%02d" $((duration/60)) $((duration%60))
    time_str="[$pos_str / $dur_str]"
else
    time_str=""
fi

if [[ "$state" == "playing" ]]; then echo "  $time_str $artist - $title"
elif [[ "$state" == "paused" ]]; then echo "  <i>$time_str $artist - $title</i>"
else echo "  Stopped"; fi
