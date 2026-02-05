# Project Hub

MTG EDH Commander deckcrafting system with LLM-powered code generation and workflow agents.

## Overview

This project enables LLM-assisted Commander deckbuilding by generating and executing code to:
- **Goldfish decks**: Simulate opening hands, draw sequences, and game states
- **Track synergy**: Analyze card interactions and rank cards by synergy density
- **Recommend plays**: Suggest fetches, mode selections, and interactions during actual games

The system provides controlled LLM assistance where you stay in charge of deckcrafting while LLMs discover and rank suggestions.

## Architecture

### Core Modules

**scryfall/** - Card data and metadata pipeline
- Fetches card data from Scryfall API
- Builds searchable database with colors, types, abilities, costs, and tags
- Enables filtering for deckbuilding workflows

**rules/** - MTG rulebook parsing and understanding
- Imports Comprehensive Rules and keyword definitions
- Enables LLMs to understand card interactions, timing, and illegal plays
- Required for accurate goldfish simulation and synergy detection

**decks/** - Deck definitions and implementations
- **decks/ulacombo/** - Ulalek infinite colorless combo deck
  - Commander: Ulalek, Fused Atrocity
  - Strategy: Stack-copying to go infinite with colorless Eldrazi spells
  - Features: Combo-resistant, interaction-heavy, soft stax elements

**agents/** - Custom Claude agents for workflow orchestration
- **plan** - Creates implementation plans before coding
- **implement** - Executes plans with methodical, scoped changes
- **review** - Verifies implementation against plans with code quality checks
- **compound** - Extracts learnings from workflow cycles

### Workflow System

The project uses a 4-step development workflow:
1. **Plan** → Create focused plans (plan.md or plan-001.md, plan-002.md, etc.)
2. **Implement** → Execute with scope control and todo tracking
3. **Review** → Quality verification with iteration (PASS/NEEDS_WORK)
4. **Compound** → Document learnings in nb knowledge base

**Features:**
- Multi-phase support for complex tasks
- Automatic iteration with safety limits (5 per phase, 10 total)
- Hands-off capable: User can approve all steps upfront

### Knowledge Base (nb)

Uses `nb` tool for developer documentation:
- **nb search #keyword** - Find past solutions before searching codebase
- **nb list -sr** - List recent notes with titles
- **nb show -p --no-color <note-id>** - View a note
- **nb edit <note-id> --overwrite** - Edit notes (use tmpfile + heredoc)
- **Always sign off** with agent number, model, harness, and timestamp

**Note Types:**
- Template notes (010-019): Hub, Guide, Decision, Reference, Debug, Worklog, Worklog Details, Compounding Learning, Agent Diary, Human Prefs
- Project hub (020): This document
- Work notes: Learnings, decisions, debugging sessions
- Always sign when creating/editing docs

## Onboarding

### Prerequisites

1. **nb installation**: Required for knowledge base
   ```bash
   brew install nb
   ```

2. **OpenCode setup**: Claude CLI with agent system
   - Agents defined in `.claude/agents/*.md`
   - Skills defined in `.claude/skills/*/SKILL.md`
   - Hooks configured in `.claude/settings.json`

3. **Project setup**: Standard files
   - `README.md` - Project overview
   - `TODO.md` - Current development priorities
   - `AGENTS.md` - Knowledge base usage guide
   - `.envrc` - Environment configuration

### Working with nb

**Before coding:**
1. Search for learnings: `nb search #keyword | head`
2. Check relevant notes from search results
3. Understand what past agents discovered

**Creating docs:**
1. Use appropriate template (note-010, 011, etc.)
2. Write content in tmpfile: `cat > /tmp/note-content.md << 'EOF' ...`
3. Edit/overwrite: `cat /tmp/note-content.md | nb edit <note-id> --overwrite`
4. Clean up: `rm /tmp/note-content.md`
5. Sign off: `Signed-by: agent #<n>.<m>.<p> <model> via <harness> <timestamp>Z`

**Key patterns:**
- Sign every doc when creating/editing/reviewing/commenting
- Use single-quoted `<< 'EOF'` to prevent variable expansion
- Check for existing learnings before solving problems

### Using Workflow

**Interactive mode** (default):
```bash
1. /workflow
2. Describe task
3. Approve/reject each step (Plan → Implement → Review → Compound)
```

**Autonomous mode**:
```bash
1. /workflow
2. "Run full workflow, iterate until done"
3. System auto-iterates Implement → Review until PASS
```

**Partial workflow**:
- Start at any step: "Implement plan.md" or "Review this"
- Workflow preserves clean context via subagents

## References

### Documentation
- `AGENTS.md` - nb usage guide and signing requirements
- `README.md` - Project description and organization
- `TODO.md` - High and medium priority development tasks

### Agent Definitions
- `.claude/agents/plan.md` - Planning agent specs
- `.claude/agents/implement.md` - Implementation agent specs
- `.claude/agents/review.md` - Review agent specs
- `.claude/agents/compound.md` - Learning extraction specs

### Skills
- `.claude/skills/workflow/SKILL.md` - Workflow orchestration manual
- `.claude/skills/search-learnings/SKILL.md` - Find relevant learnings
- `.claude/skills/consulting-nb-knowledge-local/SKILL.md` - Check institutional memory
- `.claude/skills/retro/SKILL.md` - Analyze worklogs for improvements
- `.claude/skills/docgen/SKILL.md` - Generate docs from worklogs
- `.claude/skills/write-from-retro/SKILL.md` - Write learning from retro
- `.claude/skills/gen-id/SKILL.md` - Generate unique agent IDs

### Scripts and Hooks
- `.docs/skill-from-retro.sh` - Post-write/edit hook for learning extraction
- `.claude/settings.json` - Hook configuration

### Templates (nb)
- 010-template-hub.md
- 011-template-guide.md
- 012-template-decision.md
- 013-template-reference.md
- 014-template-debug.md
- 015-template-worklog.md
- 016-template-worklog-details.md
- 017-template-compounding-learning.md
- 018-template-agent-diary.md
- 019-template-human-prefs.md

## Worklogs

### Recent Worklogs

**2026-02-05**: OpenCode Subagent Investigation
- `worklog__2026-02-05_subagent_investigation.md` - Summary
- `worklog_details__subagent_testing_2026-02-05.md` - Details
- `agent_diary__subagent_session_2026-02-05.md` - Agent reflection

**Key Finding**: Custom subagents (@mytest type) can only be invoked via @mention in TUI, not through Task tool. Task tool only accepts built-in agent types "general" and "explore".

### Finding Worklogs

Use `nb list -sr` to list all notes sorted by recency, or `nb search #worklog` to find worklog entries.

## Development Priorities

### High Priority
1. **Scryfall module** - Card data fetching and database with tags
2. **Rules module** - Import and parse MTG rulebook with keyword understanding
3. **LLM workflow system** - Generate and execute code for deckcrafting
4. **Project structure setup** - Python/TS with dependency management

### Medium Priority
1. **Goldfish simulation engine** - Simulate deck opening and game states
2. **Synergy tracking** - Analyze card interactions and synergy stats
3. **Ulacombo deck implementation** - Build Ulalek infinite combo deck
4. **Recommendation system** - Suggest fetches and mode selections

## Developer Notes

### Signing Off Documents

Required format:
```
Signed-by: agent #<major>.<minor>.<patch> <model> via <harness> <iso_timestamp_Z>
```

Examples:
- `Signed-by: agent #15.3.2 claude-sonnet-4 via amp 20260122T12:34:55Z`
- `Edited-by: agent current session glm-4.7 via opencode 2026-02-05T15:00Z`

One signoff per line. Only add to edited sections if partial edits.

### nb Quirks

- Use `nb list -sr | head -n ...` instead of `nb list` (better view)
- Use `cat /tmp/note.md | nb edit <id> --overwrite` to avoid issues
- Always use `<< 'EOF'` (single-quoted) for heredocs
- Check nb installation before workflow: `nb --version`

---

Created-by: agent current session glm-4.7 via opencode 2026-02-05T15:15Z
Updated-by: agent current session glm-4.7 via opencode 2026-02-05T15:15Z
