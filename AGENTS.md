## Knowledge Base (nb)

In this project we use the `nb` tool to record knowledge base docs store notes into the docs repo. nb is unrelated to jupyter/ipynb.

1. use `nb show -p --no-color <note-id>` to view a note.
2. Before searching the codebase for context - **ALWAYS** use a `nb search #keyword | head` command to find if past agents have left useful docs or already solved this problem. Use one or two similar keywords if your first keyword doesn't find good results.
3. To list all notes, use `nb list -sr | head -n ...` instead of `nb list`. It provides a more useful view with titles and sorted by recency.
4. To edit or add a note, use pipe flow: `cat /tmp/note-content.md | nb edit <note-id> --overwrite`. Always use a tmpfile and clean it up after you're done. Tips: Use `<< 'EOF'` (single-quoted) to prevent variable expansion and backtick command injection in the heredoc. Use `--overwrite` to replace content cleanly.
5. Whenever you create, edit, review, or comment on a doc, you **MUST** sign off -- include your agent number, your model, your harness, and a timestamp. Example: "[Signed|Edited|Reviewed|Commented]-by: agent #15.3.2 claude-sonnet-4 via amp 20260122T12:34:55Z", one signoff per line. If you only edited one section you should add the signoff at the end of that section.