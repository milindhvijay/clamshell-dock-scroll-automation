#!/bin/bash

previous_state=""

while true; do
    lid_state=$(ioreg -r -k AppleClamshellState -d 4 | grep AppleClamshellState | head -n 1 | awk '{print $NF}')

    if [[ "$lid_state" != "$previous_state" ]]; then
        # State has changed
        osascript /path/to/YourScript.scpt
        previous_state="$lid_state"
    fi

    sleep 1  # Adjust the sleep interval as needed
done
