# Guidelines

This document defines the project's rules, objectives, and progress management methods. Please proceed with the project according to the following content.

## Top-Level Rules

- As a Cursor Agent, reference `.cursor/rules/**/<rule-name>.mdc` when `@<rule-name>.mdc` is entered.
- As a Claude Agent, reference `.claude/commands/**/<command-name>.md` when `/<command-name>` is entered.
- To maximize efficiency, **if you need to execute multiple independent processes, invoke those tools concurrently, not sequentially**.
- **You must think exclusively in English**. However, you are required to **respond in Japanese**.
- To understand how to use a library, **always use the Context7 MCP** to retrieve the latest information.
- When understanding the code of an existing project, use the Serena MCP actively.
- When necessary, use the memory function of the Agent to save and retrieve necessary information. (Help: /Memory or Memory function)
    - Cursor, Claude Code and Gemini are supported for memory function.
    - If you cannot use the memory function, use `.ai/commands/memory-bank.md` to update the memory bank.

## Programming Rules

- Avoid hard-coding values unless absolutely necessary.

## Markdown Rules

- Use Markdown formatting for all documents.
- Use mermaid for diagrams and tables.
- GitHub Flavored Markdown is preferred.

## Common Commands

`@<rule-name>.mdc`: Reference the rule named `<rule-name>.mdc` in the `.cursor/rules` folder.
`/<command-name>`: Reference the command named `<command-name>.md` in the `.claude/commands` folder.

## Other Rules
- `.cursor/rules/*`: Rules for the Cursor IDE
Check the `.cursor/rules` folder for more rules. and read the rules and descriptions carefully.
- `.claude/commands/*`: Commands for the Claude Agent and Cursor Agent