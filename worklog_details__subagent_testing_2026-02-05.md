# Worklog Details: Subagent Testing 2026-02-05

# Worklog Details: OpenCode Subagent Testing 2026-02-05

## Context
Goal: Investigate OpenCode's subagent system, test built-in subagents, and understand custom agent creation.

## Timeline

### 14:55 - Started: Query about subagents
User asked about available skills, then requested testing of hello-world skill, then asked about subagent configuration.

### 14:56 - Documentation research
Executed webfetch to read OpenCode documentation:
- Read main opencode.ai homepage
- Read intro documentation 
- Read full agents documentation
- Discovered two types: primary agents (Build, Plan) and subagents (General, Explore)

### 14:57 - Subagent testing attempts
Attempted to check for existing opencode.json and agents directories:
- No opencode.json found in project root
- No global agents directory existed
- No project agents directory existed

### 14:58 - Test built-in subagents
Executed Task tool tests:
- Tested @explore subagent to search for Rust files (found none, project is MTG deck builder)
- Tested @general subagent to create /tmp/test-subagent.txt (successful)
- Verifed and cleaned up test file

### 14:59 - Custom agent creation
Attempted to create custom subagent to test:
- Created ~/.config/opencode/agents/mytest.md with test subagent config
- Attempted invocation via Task tool - FAILED with "Unknown agent type" error
- Cleaned up failed test agent
- Discovered limitation: Task tool only accepts built-in types "general" and "explore"

### 15:00 - Documentation creation
Created comprehensive documentation note (#17):
- Titled "OpenCode Custom Subagents Investigation"
- Covered findings, limitations, configuration methods
- Explained how custom agents work vs built-in agents
- Added to knowledge base

### 15:00 - File cleanup
Removed temporary files:
- /tmp/test-subagent.txt
- Cleaned up test agent file

### 15:00 - Custom agent for TUI testing
Created new agent ~/.config/opencode/agents/mytest.md for user to test after restart:
- Simple test agent to verify custom subagent functionality
- Configured with no file write/bash tools
- Ready for @mention testing in TUI

### 15:01 - Documentation writing
Created 4 required files for session:
- Agent diary entry (#18)
- Worklog entry (#19)  
- Worklog details entry (this file)
- Human preferences file

## Key Findings
- Built-in @explore works for read-only code exploration
- Built-in @general works for tasks requiring file modifications
- Custom subagents created via config cannot be invoked via Task tool
- Custom subagents can only be invoked via @mention in TUI
- Agent locations: ~/.config/opencode/agents/ (global) and .opencode/agents/ (project)

## Files Changed
- `/tmp/test-subagent.txt` - Created then removed
- `~/.config/opencode/agents/mytest.md` - Created custom subagent config
- Knowledge base notes: #17 (subagent investigation), #18 (diary), #19 (worklog)

## Open Questions
- None - custom subagent limitation fully understood and documented

---
Signed-by: agent glm-4.7 via opencode 2026-02-05T15:01Z
