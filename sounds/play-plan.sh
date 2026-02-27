#!/bin/bash
# Plan/subagent completed → randomized strategic victory sound
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
exec "$SCRIPT_DIR/play-sound.sh" \
  "borat-great-success.mp3" \
  "borat-king-in-the-castle.mp3" \
  "borat-very-nice.mp3" \
  "cnc-kirov-reporting.mp3" \
  "cnc-incoming-transmission.mp3"
