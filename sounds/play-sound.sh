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
# Cross-platform audio playback
if command -v mpv &>/dev/null; then
  mpv --no-terminal --volume=80 "$SOUNDS_DIR/$RANDOM_SOUND" &
elif command -v paplay &>/dev/null; then
  paplay "$SOUNDS_DIR/$RANDOM_SOUND" &
elif command -v afplay &>/dev/null; then
  afplay "$SOUNDS_DIR/$RANDOM_SOUND" &
elif command -v aplay &>/dev/null; then
  aplay "$SOUNDS_DIR/$RANDOM_SOUND" &
fi
