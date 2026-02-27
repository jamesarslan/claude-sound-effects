#!/bin/bash
# Shared sound player with cooldown lock — prevents double-firing
# Usage: play-sound.sh sound1.mp3 sound2.wav sound3.mp3 ...
# Picks a random sound from the arguments and plays it, unless
# another sound was played within the last 2 seconds.

SOUNDS_DIR="$(cd "$(dirname "$0")" && pwd)"
LOCK="/tmp/.claude-sound-lock"
COOLDOWN=2

# Check cooldown
if [ -f "$LOCK" ]; then
  last=$(cat "$LOCK" 2>/dev/null || echo 0)
  now=$(date +%s)
  if (( now - last < COOLDOWN )); then
    exit 0
  fi
fi

# Set lock
date +%s > "$LOCK"

# Pick random sound from arguments
SOUNDS=("$@")
RANDOM_SOUND="${SOUNDS[$RANDOM % ${#SOUNDS[@]}]}"
afplay "$SOUNDS_DIR/$RANDOM_SOUND" &
