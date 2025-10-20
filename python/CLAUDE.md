# Guidelines

This document defines the project's rules, objectives, and progress management methods. Please proceed with the project according to the following content.

## Top-Level Rules

- To maximize efficiency, **if you need to execute multiple independent processes, invoke those tools concurrently, not sequentially**.
- **You must think exclusively in English**. However, you are required to **respond in Japanese**.
- To understand how to use a library, **always use the Context7 MCP** to retrieve the latest information.

## Programming Rules

- Avoid hard-coding values unless absolutely necessary.
- Linting and formatting rules are defined in `pyproject.toml`.

## Common Commands

- `uv run python <file>.py`: Run the specified file
- `uv run ruff format .`: Apply code formatting
- `uv run ruff check .`: Run the code linting
- `uv run pytest <file>.py`: Run the test suite

## Other Rules
- `.cursor/rules/*`: Rules for the Cursor IDE
Check the `.cursor/rules` folder for more rules. and read the rules and descriptions carefully.