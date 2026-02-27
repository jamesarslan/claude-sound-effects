#!/bin/bash
# Notification → randomized "working" sound
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
exec "$SCRIPT_DIR/play-sound.sh" \
  "work-work.mp3" \
  "ready-to-work.mp3" \
  "wc3-something-need-doing.wav" \
  "wc3-more-work.wav" \
  "wc3-what-is-it.wav" \
  "wc3-what-you-want.wav" \
  "borat-wawaweewa.mp3" \
  "borat-my-wife.mp3" \
  "cnc-building.mp3" \
  "cnc-awaiting-orders.wav" \
  "cnc-incoming-transmission.mp3" \
  "cnc-comrade.wav"
