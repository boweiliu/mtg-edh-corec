#!/bin/bash
# Generate agent ID and UUID for session tracking
# Usage: ./generate-id.sh

set -e

IDS_FILE=".docs/agent-ids.txt"

# Ensure .docs directory exists
mkdir -p .docs

# Get timestamp
TIMESTAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)

# Generate short UUID
UUID=$(uuidgen | tr '[:upper:]' '[:lower:]' | cut -c1-8)

# Determine next agent ID
if [[ -f "$IDS_FILE" ]] && [[ -s "$IDS_FILE" ]]; then
    # Find highest X value from existing IDs (format: X.n.m)
    HIGHEST_X=$(grep -oE '^[0-9]+' "$IDS_FILE" | sort -n | tail -1)
    NEXT_X=$((10#$HIGHEST_X + 1))
else
    NEXT_X=1
fi

# Format with leading zeros (3 digits)
AGENT_ID=$(printf "%03d.0.0" $NEXT_X)

# Append to file
echo "$AGENT_ID $UUID $TIMESTAMP" >> "$IDS_FILE"

# Output result
cat << EOF
Your agent ID is: **$AGENT_ID**
Your UUID key is: **$UUID**

Use these for signoffs:
- Commits: "Signed-by: agent #$AGENT_ID claude-opus-4-5 via claude-code"
- Docs: "[Signed|Edited]-by: agent #$AGENT_ID claude-opus-4-5 via claude-code $TIMESTAMP"

**Note:** If you see instructions mentioning signoff, AGENT_ID, or X.n.m format IDs and don't have an agent ID yet, run \`/gen-id\` first.
EOF
