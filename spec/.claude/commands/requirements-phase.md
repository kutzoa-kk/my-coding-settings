---
allowed-tools: TodoWrite, TodoRead, Read, Write, MultiEdit, Bash(mkdir:*)
description: Create requirements specification for the given task (Stage 1 of Spec-Driven Development)
---

## Context

- Task description: $ARGUMENTS

## Your task

### 1. Analyze the user's request

Carefully analyze the provided task description and extract:

- The core problem to be solved
- Implicit requirements not explicitly stated
- Potential edge cases and constraints
- Success criteria

### 2. Create Requirements Document

Create `.ai/requirements.md` file referring to [Requirements Phase Rules](#requirements-phase-rules) Section and `templates/requirements-template.md`.

### 3. Present to user

Show the created requirements document and ask for:

- Confirmation of understanding
- Any missing requirements
- Approval to proceed to design phase

### 4. Update the requirements document

Update the requirements document based on the user's feedback.
Update `.ai/requirements.md` with the section 3 and 4.

## Requirements Phase Rules

This rule defines the specific rules for the requirements phase of specification-driven development.

### Basic Principles of Requirements

#### Clarity
- 曖昧な表現を避け、具体的で測定可能な要件を記述
- 「できるだけ早く」「使いやすい」などの主観的表現を避ける
- 数値や具体的な条件で表現する

#### Completeness
- 機能要件と非機能要件の両方を網羅
- 制約条件、前提条件を明確に記述
- 例外処理、エラーケースも含める

#### Consistency
- 用語の統一、記述形式の統一
- 同じ概念は同じ用語で表現
- 記述レベルを統一

#### Verifiability
- 受け入れ条件を明確に定義
- テスト可能な要件を記述
- 実装結果が要件を満たしているか検証可能

### Function Requirements

#### User Story Format
```
As a [ユーザーの種類]
I want [機能・行動]
So that [目的・価値]
```

#### Acceptance Criteria
- Given: 前提条件
- When: アクション
- Then: 期待結果

#### Detailed Requirements
- 入力: データ形式、制約、バリデーション
- 処理: ビジネスロジック、計算式
- 出力: データ形式、表示形式、エラーメッセージ

### Non-Functional Requirements

#### Performance Requirements
- レスポンス時間: 平均値、最大値
- スループット: 同時接続数、処理件数
- リソース使用量: CPU、メモリ、ディスク

#### Security Requirements
- 認証・認可: ログイン方式、権限管理
- データ保護: 暗号化、アクセス制御
- 脆弱性対策: 入力検証、出力エスケープ

#### Availability Requirements
- 稼働率: 99.9%など
- 障害対応: 復旧時間、バックアップ
- メンテナンス: 停止時間、更新手順

#### Extensibility Requirements
- ユーザー数増加への対応
- データ量増加への対応
- 機能追加への対応

### Constraints

#### Technical Constraints
- 使用技術、フレームワーク
- ハードウェア制約
- 既存システムとの連携

#### Business Constraints
- 予算、スケジュール
- 法的要件、コンプライアンス
- 組織体制、リソース

#### Operational Constraints
- 運用時間、メンテナンス時間
- バックアップ、監視
- サポート体制

### Requirements Document Structure

templates/requirements-template.mdを参照してください

### Review Points

- [ ] 要件の完全性と一貫性
- [ ] 技術的実現可能性
- [ ] ビジネス要件との整合性
- [ ] ステークホルダーの合意
- [ ] 受け入れ条件の明確性

## Important Notes

- Be thorough in identifying implicit requirements
- Consider both current needs and future extensibility
- Use clear, unambiguous language
- Include measurable success criteria

think hard and carefully.