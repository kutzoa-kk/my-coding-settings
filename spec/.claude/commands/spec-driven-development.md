---
allowed-tools: TodoWrite, TodoRead, Read, Write, MultiEdit, Bash(mkdir:*), TodoWrite, TodoRead, Read, Write, MultiEdit
description: "Spec Driven Development Rules"
---

# Spec Driven Development Rules

This rule defines the basic rules for specification-driven development.

## Basic Principles

### Understanding of LLM's Nature
- LLM is a "statistical pattern recognition system" and cannot understand or create like humans
- It is based on statistical patterns learned from vast text data and predicts the most likely next string.
- "Vibes" instructions will fail, so you need to provide a clear and specific specification document.

### Human and AI Role Separation
- **AI**: Create specification documents, design documents, and implementation plan documents
- **Human**: Review, make decisions, ensure quality, and approve the final result

## Phase-Specific Rules

### 1. Requirements Definition Phase
- `/requirements-phase`を実施し、要件定義を行う
- 機能要件、非機能要件、制約条件の詳細な仕様書を作成
- 曖昧な表現を避け、具体的で測定可能な要件を記述
- 受け入れ条件を明確に定義
- .ai/requirements.mdを作成

### 2. Design Phase
- `/design-phase`を実施し、設計を行う
- システム設計書、API設計書、データベース設計書、アーキテクチャ図を作成
- アーキテクチャ、インターフェース、データ設計、セキュリティを網羅
- 拡張性、保守性を考慮した設計
- .ai/design.mdを作成

### 3. Implementation Plan Phase
- `/implementation-plan-phase`を実施し、実装計画を行う
- タスク分解、実装順序、依存関係の整理
- 工数見積もり、リスク評価、優先順位の調整
- 実装計画書、タスクリスト、マイルストーンの作成
- .ai/plan.mdと.ai/tasks/task-spec-*.mdを作成

### 4. Implementation Phase
- `/implementation-phase`を実施し、実装を行う
- 具体的なコード実装
- テストコード、ドキュメントの作成
- コード品質、パフォーマンス、セキュリティの検証
- .ai/plan.mdと.ai/tasks/task-spec-*.mdに合わせて実装を行い更新する

### Workflow Commands

- `/spec-driven-development.mdc` - Start the complete specification-driven development workflow
- `/requirements-phase.mdc` - Execute Stage 1: Requirements only
- `/design-phase.mdc` - Execute Stage 2: Design only (requires requirements)
- `/implementation-plan-phase.mdc` - Execute Stage 3: Task breakdown only (requires design)
- `/implementation-phase.mdc` - Execute Stage 4: Implementation only (requires tasks)

## Quality Management

### Requirements Document Quality Criteria
- **Clarity**: Descriptions that can be understood by anyone
- **Completeness**: All necessary information is included
- **Consistency**: Uniformity of terms, descriptions, and logical structure
- **Verifiability**: The implementation result can be verified against the requirements

### Review Checklist
- [ ] 要件の完全性と一貫性
- [ ] 技術的実現可能性
- [ ] セキュリティ要件の充足
- [ ] パフォーマンス要件の充足
- [ ] 保守性と拡張性
- [ ] コストと工数の妥当性

## Tool Utilization

### Utilization of Context7 MCP
- ライブラリの最新情報を取得する際は必ず使用
- 技術仕様の確認と検証
- ベストプラクティスの調査

### Utilization of Memory Bank
`@memory-bank`を実施し、メモリバンクを使用してください。

### Utilization of Parallel Processing
- 複数の独立したタスクは並行実行
- 仕様書作成とレビューの並行化
- 複数コンポーネントの同時設計

## Important Notes

- Each stage depends on the deliverables of the previous stage
- Please obtain user confirmation before proceeding to the next stage
- Always use this workflow for complex tasks or new feature development
- Simple fixes or clear bug fixes can be implemented directly

1. **Clear Specification Document**: Provide a clear and specific specification document instead of vague "Vibes"
2. **Stage-by-Stage Verification**: Review the results of each phase early to find problems
3. **Human Judgment**: Do not blindly trust AI proposals, use human knowledge and experience to make the final decision
4. **Continuous Improvement**: Update and improve the specification document according to the progress of the project
