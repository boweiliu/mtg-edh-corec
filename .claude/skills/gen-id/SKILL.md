---
name: gen-id
description: Generates a unique agent ID (X.n.m format) and UUID key for the current agent session. Use at session start for logging/signoff.
---

# Agent ID Generator

Generates a unique agent identifier for tracking and signing off work.

## Usage

Run the generator script:

```bash
.claude/skills/gen-id/generate-id.sh
```

This will output your agent ID and UUID, and record the entry in `.docs/agent-ids.txt`.

## When to run this skill

If you encounter instructions mentioning signoff, AGENT_ID, or X.n.m format IDs, and you don't already have an agent ID for this session, run `/gen-id` first to obtain one.
