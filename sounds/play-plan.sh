#!/bin/bash
# Plan/subagent completed → randomized "mission accomplished" sound
SOUNDS_DIR="$(cd "$(dirname "$0")" && pwd)"
SOUNDS=(
  # Borat - triumphant (plan = strategic victory)
  "borat-great-success.mp3"
  "borat-king-in-the-castle.mp3"
  "borat-very-nice.mp3"
  # Command & Conquer - intel/strategic
  "cnc-kirov-reporting.mp3"
  "cnc-incoming-transmission.mp3"
)
RANDOM_SOUND="${SOUNDS[$RANDOM % ${#SOUNDS[@]}]}"
afplay "$SOUNDS_DIR/$RANDOM_SOUND" &
