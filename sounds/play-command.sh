#!/bin/bash
# User gives an order → randomized acknowledgment
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
exec "$SCRIPT_DIR/play-sound.sh" \
  "yes-me-lord.mp3" \
  "wc3-zug-zug.mp3" \
  "wc3-be-happy-to.wav" \
  "wc3-okie-dokie.wav" \
  "wc3-i-can-do-that.wav" \
  "wc3-yes-milord.wav" \
  "borat-yakshemash.mp3" \
  "borat-very-nice-short.mp3" \
  "cnc-acknowledged.wav" \
  "cnc-affirmative.wav" \
  "cnc-yes-sir.wav" \
  "cnc-at-once.wav"
