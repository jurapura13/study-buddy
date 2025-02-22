#!/bin/bash

# Capture the start time
start_time=$(date +%s)
first_run=1

while true; do
    # Open Firefox with your check-in chat URL
    firefox "https://chatgpt.com/c/[your-new-check-in-chat-link]" &
    
    # Give Firefox time to load
    sleep 5

    # Bring Firefox window into focus
    window_id=$(xdotool search --sync --onlyvisible --class "Firefox" | tail -n 1)
    xdotool windowactivate "$window_id"
    sleep 1

    # Prepare metadata: current timestamp and elapsed time
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    elapsed=$((($(date +%s) - start_time) / 60))

    if [ $first_run -eq 1 ]; then
        # First iteration: Studying started prompt
        xdotool type "[Study session started; Time: $timestamp; Instruction: Ask the user for a detailed rundown of what they'll be studying.]"
        first_run=0
    else
        # Subsequent iterations: Check-in prompt
        xdotool type "[Check in request; Time: $timestamp; Elapsed: ${elapsed} min; Instruction: Ask how the user's study session is going. Ask for a detailed update on their progress.]"
    fi
    xdotool key Return

    # Wait 30 minutes before the next prompt
    sleep 1800
done

