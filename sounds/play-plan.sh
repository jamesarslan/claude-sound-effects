#!/bin/bash
# Plan/subagent completed → randomized "mission accomplished" sound
SOUNDS_DIR="$(cd "$(dirname "$0")" && pwd)"
SOUNDS=(
  "work-complete.mp3"
  "wc3-right-o.wav"
  "borat-great-success.mp3"
  "borat-very-nice.mp3"
  "borat-king-in-the-castle.mp3"
  "cnc-unit-ready.mp3"
  "cnc-construction-complete.mp3"
  "cnc-kirov-reporting.mp3"
)
RANDOM_SOUND="${SOUNDS[$RANDOM % ${#SOUNDS[@]}]}"
afplay "$SOUNDS_DIR/$RANDOM_SOUND" &
