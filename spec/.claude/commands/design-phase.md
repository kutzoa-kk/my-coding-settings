---
allowed-tools: TodoWrite, TodoRead, Read, Write, MultiEdit
description: Create detailed design specification based on requirements (Stage 2 of Spec-Driven Development)
---

## Context

- Requirements document: @.ai/requirements-v*.md

### Your task

### 1. Verify prerequisites

- Check that `.ai/requirements.md` exists
- If not, inform user to run `/requirements-phase` first

### 2. Analyze requirements

Read and understand the requirements document thoroughly

### 3. Create Design Document

Create `.ai/design.md`, `.ai/api-spec.md`, and `.ai/database-spec.md` referring to [Design Phase Rules](#design-phase-rules) Section and `templates/design-template.md`, `templates/api-spec-template.md`, and `templates/database-spec-template.md`.

### 4. Present to user
Show the created design document and ask for:
- Technical feedback
- Architecture approval
- Permission to proceed to task breakdown

### 5. Update the design document

Update the design document based on the user's feedback.
Update `.ai/design.md` with the section 4 and 5.

### Important Notes
- Design should be implementable and testable
- Consider maintainability and extensibility
- Include concrete interface definitions where possible
- Address all requirements from the requirements document

think hard

## Design Phase Rules

This rule defines the specific rules for the design phase of specification-driven development.

### Basic Principles of Design

#### Architecture Design
- システム全体の構造とコンポーネント間の関係を明確化
- レイヤー構造、モジュール分割、依存関係の整理
- 拡張性、保守性、テスト容易性を考慮

#### Interface Design
- API仕様、データ形式、通信プロトコルの定義
- 入力・出力の仕様、エラーハンドリング
- バージョニング、後方互換性の考慮

#### Data Design
- データベーススキーマ、データフローの設計
- 正規化、インデックス設計、パフォーマンス最適化
- データ整合性、バックアップ・復旧の考慮

#### Security Design
- 認証・認可、データ保護、脆弱性対策
- セキュリティ要件の実装方法
- 脅威分析、リスク評価

### System Design Document Structure

Reference `templates/design-template.md`

#### 1. Architecture Overview
- システム全体図、コンポーネント構成
- 技術スタック、フレームワーク選択理由
- 設計方針、制約条件

#### 2. Function Design
- 各機能の詳細設計
- 処理フロー、状態遷移
- エラー処理、例外処理

#### 3. Data Design
- データベース設計、テーブル定義
- データフロー、データ変換
- データ整合性、制約条件

#### 4. Interface Design
- API仕様、データ形式
- 外部システム連携
- ユーザーインターフェース設計

#### 5. Security Design
- 認証・認可方式
- データ暗号化、通信暗号化
- セキュリティ監査、ログ設計

### Principles of API Design

Reference `templates/api-spec-template.md`

#### RESTful API Design
- リソース指向の設計
- HTTPメソッドの適切な使用
- ステータスコードの統一

#### API Specification Document
- エンドポイント、パラメータ、レスポンス
- 認証方式、エラーハンドリング
- サンプルリクエスト・レスポンス

#### Versioning
- APIバージョン管理方式
- 後方互換性の維持
- 廃止予定機能の管理

### Database Design

Reference `templates/database-spec-template.md`

#### Normalization
- 第1正規形から第3正規形への適用
- 冗長性の排除、整合性の確保
- パフォーマンスとのバランス

#### Index Design
- 検索性能の最適化
- インデックスの種類と適用場面
- メンテナンス性の考慮

#### Performance Design
- クエリ最適化、接続プール
- キャッシュ戦略、負荷分散
- スケーラビリティの考慮

### Security Design

#### Authentication & Authorization
- 認証方式の選択（OAuth、JWT等）
- 権限管理、ロールベースアクセス制御
- セッション管理、トークン管理

#### Data Protection
- 暗号化方式、鍵管理
- 個人情報保護、GDPR対応
- データマスキング、匿名化

### Vulnerability Mitigation
- 入力検証、出力エスケープ
- SQLインジェクション、XSS対策
- CSRF対策、セキュリティヘッダー

## Design Document Structure

Reference `templates/design-template.md`, `templates/api-spec-template.md` and `templates/database-spec-template.md`

## Design Review Points

- [ ] アーキテクチャの妥当性
- [ ] 拡張性、保守性の確保
- [ ] パフォーマンス要件の充足
- [ ] セキュリティ要件の充足
- [ ] 技術的実現可能性
- [ ] コストと工数の妥当性
- [ ] 運用性の考慮