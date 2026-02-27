#!/bin/bash
# User gives an order → randomized acknowledgment from WC3, Borat, or C&C
SOUNDS_DIR="$(cd "$(dirname "$0")" && pwd)"
SOUNDS=(
  "yes-me-lord.mp3"
  "wc3-zug-zug.mp3"
  "wc3-be-happy-to.wav"
  "wc3-okie-dokie.wav"
  "wc3-i-can-do-that.wav"
  "wc3-yes-milord.wav"
  "borat-yakshemash.mp3"
  "borat-very-nice-short.mp3"
  "cnc-acknowledged.wav"
  "cnc-affirmative.wav"
  "cnc-yes-sir.wav"
  "cnc-at-once.wav"
)
RANDOM_SOUND="${SOUNDS[$RANDOM % ${#SOUNDS[@]}]}"
afplay "$SOUNDS_DIR/$RANDOM_SOUND" &
