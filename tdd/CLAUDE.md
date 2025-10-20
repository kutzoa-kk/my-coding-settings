# Guidelines

This document defines the project's rules, objectives, and progress management methods. Please proceed with the project according to the following content.

## Top-Level Rules

- To maximize efficiency, **if you need to execute multiple independent processes, invoke those tools concurrently, not sequentially**.
- **You must think exclusively in English**. However, you are required to **respond in Japanese**.
- To understand how to use a library, **always use the Context7 MCP** to retrieve the latest information.

## Programming Rules

- Avoid hard-coding values unless absolutely necessary.
- Follow Test-Driven Development (TDD) methodology strictly.

## TDD Rules

### Red-Green-Refactor Cycle
1. **Red**: Write a failing test first
   - Write the smallest possible test that defines a desired behavior
   - Ensure the test fails for the expected reason
   - Never write production code without a failing test

2. **Green**: Make the test pass with minimal code
   - Write the minimum code necessary to make the test pass
   - Don't worry about code quality at this stage
   - Focus on making the test green as quickly as possible

3. **Refactor**: Improve the code while keeping tests green
   - Improve code quality, readability, and structure
   - Ensure all tests continue to pass
   - Remove duplication and improve design

### Test Writing Principles
- Write tests before implementation code
- Follow the AAA pattern: Arrange, Act, Assert
- Make tests descriptive and readable
- Each test should verify one specific behavior
- Use meaningful test and method names
- Tests should be independent and isolated
- Write tests for edge cases and error conditions

### Code Quality Standards
- Keep test code as clean as production code
- Refactor frequently to maintain clean code
- Write self-documenting code through clear naming
- Keep functions small and focused
- Prefer composition over inheritance

### Testing Strategy
- Unit tests for individual components
- Integration tests for component interactions
- Focus on behavior-driven testing
- Maintain high test coverage (aim for 90%+)
- Run tests frequently during development

## Common Commands

- Language-specific test commands should be defined here based on the technology stack:
  - Python: `uv run pytest <file>.py`: Run the test suite
  - Swift: `swift test`: Run Swift tests
  - JavaScript: `npm test`: Run Node.js tests
  - Java: `mvn test`: Run Maven tests

## Other Rules
- `.cursor/rules/*`: Rules for the Cursor IDE
Check the `.cursor/rules` folder for more rules. and read the rules and descriptions carefully.