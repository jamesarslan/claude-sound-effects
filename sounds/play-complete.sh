#!/bin/bash
# Task finished → randomized completion sound
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
exec "$SCRIPT_DIR/play-sound.sh" \
  "jobs-done.mp3" \
  "work-complete.mp3" \
  "wc3-right-o.wav" \
  "wc3-off-i-go.wav" \
  "cnc-construction-complete.mp3" \
  "cnc-unit-ready.mp3" \
  "cnc-reinforcement-ready.mp3"
