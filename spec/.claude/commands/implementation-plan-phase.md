---
allowed-tools: TodoWrite, TodoRead, Read, Write, MultiEdit
description: Break down design into implementable tasks (Stage 3 of Spec-Driven Development)
---

## Context

- Requirements: @.ai/requirements.md
- Design document: @.ai/design.md, @.ai/api-spec.md, @.ai/database-spec.md

## Your task

### 1. Verify prerequisites

- Check that both `.ai/requirements.md`, `.ai/design.md`, `.ai/api-spec.md`, and `.ai/database-spec.md` exist
- If not, inform user to complete previous stages first

### 2. Analyze design document

Read and understand the design thoroughly to identify all implementation tasks

### 3. Create Task List Document

Create `.ai/plan.md` and `.ai/tasks/task-spec-*.md` referring to [Implementation Plan Phase Rules](#implementation-plan-phase-rules) Section and `templates/implementation-plan-template.md`.

plan.md:
List of Implementation Tasks

task-spec-*.md:
Specification of each task

### 4. Present to user

Show the task breakdown and ask for:

- Confirmation of understanding
- Any missing tasks
- Approval to proceed to implementation

### 5. Update the task list document

Update the task list document based on the user's feedback.
Update `.ai/plan.md` and `.ai/tasks/task-spec-*.md` with the section 4 and 5.

## Important Notes

## Implementation Plan Phase Rules

This rule defines the specific rules for the implementation plan phase of specification-driven development.

### Implementation Plan Basic Principles

#### Task Decomposition
- 機能単位での細分化
- 依存関係の明確化
- 工数見積もりの精度向上

#### Implementation Order
- 依存関係に基づく順序決定
- リスクの高いタスクの早期実装
- 並行実装可能なタスクの特定

#### Risk Management
- 技術的リスクの特定と対策
- スケジュールリスクの評価
- 代替案の準備

### Task Decomposition Methods
- Tasks should be commit-sized (completable in 1-4 hours)
- Include clear completion criteria for each task
- Consider parallel execution opportunities
- Include testing tasks throughout, not just at the end

#### Functional Decomposition
- 各機能を独立したタスクに分解
- 入力・処理・出力の観点で分解
- フロントエンド・バックエンド・DBの観点で分解

#### Technical Decomposition
- インフラ構築、DB設計、API開発、UI開発
- 各技術領域の専門性を考慮
- 並行作業可能な領域の特定

#### Priority Decomposition
- 必須機能、重要機能、オプション機能
- ビジネス価値の高い機能を優先
- 技術的リスクの高い機能を優先

### Dependency Management

#### Technical Dependencies
- データベース設計 → API開発 → UI開発
- 認証基盤 → 各機能の認証実装
- 共通ライブラリ → 各機能の実装

#### Business Dependencies
- ユーザー登録 → ログイン機能
- 商品管理 → 注文機能
- 決済機能 → 注文完了

#### Resource Dependencies
- 開発者の専門性
- 外部システムの連携
- テスト環境の準備

### Estimation Techniques

#### Estimation Techniques
- 過去の実績データを基にした見積もり
- 三点見積もり（楽観的・現実的・悲観的）
- 機能ポイント法、ストーリーポイント法

#### Estimation Elements
- 設計時間、実装時間、テスト時間
- レビュー時間、修正時間
- 学習時間、調査時間

#### Buffer Setting
- 技術的不確実性への対応
- 仕様変更への対応
- 品質確保のための時間

### Risk Management

#### Technical Risks
- 新技術の採用リスク
- パフォーマンス要件の達成リスク
- セキュリティ要件の達成リスク

#### Schedule Risks
- 工数見積もりの誤差
- 仕様変更の影響
- リソース不足の影響

#### Countermeasures Preparation
- 代替技術の検討
- 機能の優先順位変更
- 追加リソースの確保

### Implementation Plan Document Structure

#### 1. Project Overview
- 目的、スコープ、制約条件
- チーム構成、役割分担
- マイルストーン、納期

#### 2. Task List
- タスク名、説明、成果物
- 工数見積もり、担当者
- 依存関係、前提条件

#### 3. Schedule
- ガントチャート、マイルストーン
- クリティカルパス
- リスク要因、対策

#### 4. Resource Planning
- 人員配置、スキル要件
- 開発環境、ツール
- 外部リソース、委託先

#### 5. Quality Management
- テスト計画、レビュー計画
- 品質基準、受け入れ条件
- 不具合管理、変更管理

### Progress Management

#### Progress Visualization
- タスクの完了状況
- 工数の消化状況
- 品質指標の推移

#### Early Problem Detection
- 遅延リスクの特定
- 品質問題の早期発見
- リソース不足の早期発見

### Plan Revision
- スケジュールの調整
- リソースの再配置
- スコープの調整

## Implementation Plan Document Structure

Reference `templates/implementation-plan-template.md` and `templates/task-spec-template.md`.

## レビューポイント

- [ ] タスク分解の適切性
- [ ] 依存関係の正確性
- [ ] 工数見積もりの妥当性
- [ ] リスク評価の適切性
- [ ] スケジュールの実現可能性
- [ ] リソース計画の妥当性