#!/bin/bash
# Task finished → randomized completion sound from WC3, Borat, or C&C
SOUNDS_DIR="$(cd "$(dirname "$0")" && pwd)"
SOUNDS=(
  # Warcraft 3 - work complete
  "jobs-done.mp3"
  "work-complete.mp3"
  "wc3-right-o.wav"
  "wc3-off-i-go.wav"
  # Command & Conquer - construction/unit done
  "cnc-construction-complete.mp3"
  "cnc-unit-ready.mp3"
  "cnc-reinforcement-ready.mp3"
)
RANDOM_SOUND="${SOUNDS[$RANDOM % ${#SOUNDS[@]}]}"
afplay "$SOUNDS_DIR/$RANDOM_SOUND" &
