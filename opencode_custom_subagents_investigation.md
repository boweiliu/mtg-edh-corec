# OpenCode Custom Subagents Investigation

# OpenCode Custom Subagents Investigation

## Session Overview
Date: 2026-02-05
Topic: Testing OpenCode custom subagents and understanding their behavior

## Key Findings

### Built-in Subagents
OpenCode provides two built-in subagents that work with the Task tool:
- **@explore**: Fast, read-only agent for exploring codebases
  - Cannot modify files
  - Useful for finding patterns, searching code, answering questions
  
- **@general**: General-purpose agent for multi-step tasks
  - Full tool access (except todo)
  - Can make file changes when needed
  - Good for parallel work execution

### Custom Subagent Limitations
Custom subagents created via configuration files (`.md` or `.json`) **cannot** be invoked through the Task tool using their agent name.

**This is important**: The Task tool only accepts the built-in subagent types: `general` and `explore`.

### How Custom Subagents Work
Custom subagents are still useful but work differently:
1. **Manual invocation**: Users can `@mention` them in TUI messages like `@mytest hello`
2. **Autocomplete**: They appear in the @ autocomplete menu in the TUI
3. **Agent orchestration**: Other agents can use them via `permission.task` configuration

### Configuration Methods
Custom agents can be created via:

**JSON (opencode.json)**:
```json
{
  "agent": {
    "mytest": {
      "description": "Test agent",
      "mode": "subagent",
      "tools": {
        "bash": false,
        "write": false
      }
    }
  }
}
```

**Markdown file** (~/.config/opencode/agents/mytest.md):
```markdown
---
description: Test agent
mode: subagent
tools:
  bash: false
---

Custom prompt here
```

### Agent Locations
- Global: `~/.config/opencode/agents/`
- Project-specific: `.opencode/agents/`

## Testing Results

### Explore Agent Test
- Task: Find Rust files in `/Users/bowei/code/mtg-edh-corec`
- Result: Found no Rust files, project is MTG EDH deck builder with Python/JS files

### General Agent Test  
- Task: Create `/tmp/test-subagent.txt` and verify
- Result: Successfully created and verified file

### Custom Agent Test
- Task: Invoke custom `mytest` agent via Task tool
- Result: Error - "Unknown agent type: test is not a valid agent type"

## Recommendations

1. Use built-in `@explore` for code exploration without making changes
2. Use built-in `@general` for tasks requiring file modifications
3. Create custom agents for specialized workflows, but use them via `@mention` in TUI
4. Custom agents are for **human interactive use** and **agent orchestration**, not Task tool invocation

## Resources
- OpenCode Agent Docs: https://opencode.ai/docs/agents
- TUI usage: Press `Tab` to switch primary agents, `@agentname` for subagents
