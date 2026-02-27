# Claude Sound Effects

Audio feedback hooks for Claude Code — randomized sound effects from **Warcraft 3**, **Borat**, and **Command & Conquer** that play during your coding sessions.

https://github.com/user-attachments/assets/placeholder

## What happens

| When | You hear |
|------|----------|
| You send a message | *"Yes milord"*, *"Zug zug"*, *"Acknowledged, sir"* |
| Task completes | *"Jobs done!"*, *"Great success!"*, *"Construction complete"* |
| Claude needs attention | *"Work work"*, *"Something need doing?"*, *"Incoming transmission"* |
| Permission request | *"Wawaweewa!"*, *"Awaiting orders"*, *"Me not that kind of orc"* |
| Plan finishes | *"Great success!"*, *"Kirov reporting"* |

40 sound files, 5 hook events, all randomized.

## Install

### Option 1: One-liner (recommended)

```bash
git clone https://github.com/jamesarslan/claude-sound-effects.git /tmp/claude-sound-effects \
  && /tmp/claude-sound-effects/install.sh
```

### Option 2: Clone and ask Claude

```bash
git clone https://github.com/jamesarslan/claude-sound-effects.git
cd claude-sound-effects
claude
# Then just say: "install this"
```

Claude reads the CLAUDE.md and knows what to do.

### Option 3: Plugin install

```bash
claude plugin install https://github.com/jamesarslan/claude-sound-effects
```

## Uninstall

```bash
# From the cloned repo:
./uninstall.sh

# Or manually:
rm -rf ~/.claude/sounds
# Then remove the hooks entries from ~/.claude/settings.json
```

## Requirements

- **macOS** (uses `afplay`)
- **jq** for the installer (`brew install jq`)
- For Linux: swap `afplay` → `paplay` in the play-*.sh scripts

## Sound collection

| Pack | Sounds | Vibe |
|------|--------|------|
| Warcraft 3 | 13 | Peasant/peon work responses |
| Borat | 10 | Chaotic energy |
| Command & Conquer | 13 | Red Alert military comms |
| General | 4 | WC3 work sounds |

## Customization

Edit the `sounds/play-*.sh` scripts to change which sounds play on which events, or add your own audio files to `~/.claude/sounds/`.

## License

Sound effects are property of their respective owners (Blizzard, 20th Century Fox, EA). This package is for personal/educational use.
