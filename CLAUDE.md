# Claude Sound Effects

This repository is a shareable audio feedback package for Claude Code. It plays randomized sound effects from **Warcraft 3**, **Borat**, and **Command & Conquer** during coding sessions.

## What This Package Does

When installed, Claude Code will play sound effects on these events:

| Event | Trigger | Sound Theme |
|-------|---------|-------------|
| **UserPromptSubmit** | User sends a message | "Yes milord", "Zug zug", "Acknowledged" |
| **Stop** | Task completes | "Jobs done", "Great success!", "Construction complete" |
| **Notification** | Claude needs attention | "Work work", "More work?", "Incoming transmission" |
| **SubagentStop** (Plan) | Plan agent finishes | "Great success!", "Kirov reporting" |
| **PreToolUse** (Ask/Plan) | Permission request | "Something need doing?", "Wawaweewa" |

## Installation

If the user asks to install, set up, or use these sound effects, run:

```bash
./install.sh
```

This copies sounds to `~/.claude/sounds/` and merges hooks into `~/.claude/settings.json`. Requires `jq` (`brew install jq` if missing).

## Uninstallation

```bash
./uninstall.sh
```

## Requirements

- **macOS** (uses `afplay` for audio playback)
- For **Linux**: edit the play-*.sh scripts to replace `afplay` with `paplay` (PulseAudio) or `aplay` (ALSA)

## Sound Inventory (40 audio files)

### Warcraft 3 (13 sounds)
- yes-me-lord, zug-zug, be-happy-to, okie-dokie, i-can-do-that, yes-milord
- something-need-doing, what-you-want, what-is-it, more-work, me-not-that-kind-of-orc
- right-o, off-i-go

### Borat (10 sounds)
- great-success, very-nice, very-nice-short, wawaweewa, yakshemash
- king-in-the-castle, my-wife, not, you-will-never-get-this, i-have-a-chair

### Command & Conquer (13 sounds)
- acknowledged, affirmative, yes-sir, at-once, very-well, comrade
- awaiting-orders, building, construction-complete, unit-ready
- reinforcement-ready, incoming-transmission, kirov-reporting

### Misc (4 sounds)
- jobs-done, work-complete, work-work, ready-to-work
