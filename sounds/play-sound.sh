#!/bin/bash
# Shared sound player with atomic lock — prevents double-firing
# Usage: play-sound.sh sound1.mp3 sound2.wav sound3.mp3 ...
# Uses mkdir as an atomic lock: only one process wins the race.

SOUNDS_DIR="$(cd "$(dirname "$0")" && pwd)"
LOCK="/tmp/.claude-sound-lock-dir"

# Atomic lock: mkdir fails if it already exists (race-condition-proof)
if ! mkdir "$LOCK" 2>/dev/null; then
  exit 0
fi

# Auto-clean lock after 2 seconds (in background)
(sleep 2 && rmdir "$LOCK" 2>/dev/null) &

# Pick random sound from arguments
SOUNDS=("$@")
RANDOM_SOUND="${SOUNDS[$RANDOM % ${#SOUNDS[@]}]}"
afplay "$SOUNDS_DIR/$RANDOM_SOUND" &
