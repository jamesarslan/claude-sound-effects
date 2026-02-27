#!/bin/bash
# install.sh — Install Claude Code sound effects
# Usage: ./install.sh
#
# What it does:
#   1. Copies all sounds + play scripts to ~/.claude/sounds/
#   2. Adds hook entries to ~/.claude/settings.json
#
# macOS only (uses afplay). For Linux, swap afplay → paplay/aplay in play-*.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOUNDS_SRC="$SCRIPT_DIR/sounds"
SOUNDS_DEST="$HOME/.claude/sounds"
SETTINGS="$HOME/.claude/settings.json"

echo "=== Claude Sound Effects Installer ==="
echo ""

# --- Step 1: Copy sounds ---
echo "[1/2] Copying sounds to $SOUNDS_DEST ..."
mkdir -p "$SOUNDS_DEST"
cp "$SOUNDS_SRC"/*.mp3 "$SOUNDS_DEST/" 2>/dev/null || true
cp "$SOUNDS_SRC"/*.wav "$SOUNDS_DEST/" 2>/dev/null || true
cp "$SOUNDS_SRC"/play-*.sh "$SOUNDS_DEST/"
cp "$SOUNDS_SRC"/play-sound.sh "$SOUNDS_DEST/"
chmod +x "$SOUNDS_DEST"/play-*.sh "$SOUNDS_DEST"/play-sound.sh
echo "  $(ls "$SOUNDS_DEST" | wc -l | tr -d ' ') files installed"

# --- Step 2: Merge hooks into settings.json ---
echo "[2/2] Configuring hooks in $SETTINGS ..."

# Check if jq is available
if ! command -v jq &>/dev/null; then
  echo ""
  echo "  jq not found. Install it (brew install jq) or manually add hooks."
  echo "  See hooks/hooks.json for the config to add to ~/.claude/settings.json"
  echo ""
  echo "  Sounds are installed — just need hooks config. Done (partial)."
  exit 0
fi

# Create settings.json if it doesn't exist
if [ ! -f "$SETTINGS" ]; then
  echo '{}' > "$SETTINGS"
fi

# Read desired hooks from our hooks.json
HOOKS_JSON="$SCRIPT_DIR/hooks/hooks.json"
NEW_HOOKS=$(jq '.hooks' "$HOOKS_JSON")

# Merge hooks into existing settings (preserves other settings, overwrites hook events)
EXISTING=$(cat "$SETTINGS")
MERGED=$(echo "$EXISTING" | jq --argjson new_hooks "$NEW_HOOKS" '
  .hooks = (.hooks // {}) * $new_hooks
')

echo "$MERGED" | jq '.' > "$SETTINGS"
echo "  Hooks configured for: UserPromptSubmit, Stop, PreToolUse"

echo ""
echo "=== Installation complete ==="
echo ""
echo "Restart Claude Code to activate sound effects."
echo "To uninstall: ./uninstall.sh"
