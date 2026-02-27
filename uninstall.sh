#!/bin/bash
# uninstall.sh — Remove Claude Code sound effects
# Usage: ./uninstall.sh

set -euo pipefail

SOUNDS_DEST="$HOME/.claude/sounds"
SETTINGS="$HOME/.claude/settings.json"

echo "=== Claude Sound Effects Uninstaller ==="
echo ""

# --- Remove sounds ---
if [ -d "$SOUNDS_DEST" ]; then
  echo "[1/2] Removing $SOUNDS_DEST ..."
  rm -rf "$SOUNDS_DEST"
  echo "  Done"
else
  echo "[1/2] $SOUNDS_DEST not found (already removed)"
fi

# --- Remove hooks from settings ---
echo "[2/2] Removing hooks from $SETTINGS ..."
if [ -f "$SETTINGS" ] && command -v jq &>/dev/null; then
  CLEANED=$(jq 'del(.hooks.UserPromptSubmit, .hooks.Stop, .hooks.Notification, .hooks.SubagentStop, .hooks.PreToolUse) | if .hooks == {} then del(.hooks) else . end' "$SETTINGS")
  echo "$CLEANED" | jq '.' > "$SETTINGS"
  echo "  Hooks removed"
else
  echo "  Skipped (no settings file or jq not available)"
fi

echo ""
echo "=== Uninstall complete ==="
echo "Restart Claude Code to apply changes."
