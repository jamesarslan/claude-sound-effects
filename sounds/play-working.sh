#!/bin/bash
# Notification / needs attention → randomized "working" sound from WC3, Borat, or C&C
SOUNDS_DIR="$(cd "$(dirname "$0")" && pwd)"
SOUNDS=(
  "work-work.mp3"
  "ready-to-work.mp3"
  "wc3-something-need-doing.wav"
  "wc3-more-work.wav"
  "wc3-what-is-it.wav"
  "wc3-what-you-want.wav"
  "borat-wawaweewa.mp3"
  "borat-my-wife.mp3"
  "cnc-building.mp3"
  "cnc-awaiting-orders.wav"
  "cnc-incoming-transmission.mp3"
  "cnc-comrade.wav"
)
RANDOM_SOUND="${SOUNDS[$RANDOM % ${#SOUNDS[@]}]}"
afplay "$SOUNDS_DIR/$RANDOM_SOUND" &
