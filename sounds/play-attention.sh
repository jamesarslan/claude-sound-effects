#!/bin/bash
# Claude needs permission / asks a question → randomized attention sound
SOUNDS_DIR="$(cd "$(dirname "$0")" && pwd)"
SOUNDS=(
  "yes-me-lord.mp3"
  "wc3-something-need-doing.wav"
  "wc3-what-you-want.wav"
  "wc3-me-not-that-kind-of-orc.wav"
  "borat-wawaweewa.mp3"
  "borat-not.mp3"
  "borat-you-will-never-get-this.mp3"
  "borat-i-have-a-chair.mp3"
  "cnc-comrade.wav"
  "cnc-awaiting-orders.wav"
  "cnc-very-well.wav"
)
RANDOM_SOUND="${SOUNDS[$RANDOM % ${#SOUNDS[@]}]}"
afplay "$SOUNDS_DIR/$RANDOM_SOUND" &
