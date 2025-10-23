---
allowed-tools: TodoWrite, TodoRead, Read, Write, MultiEdit
description: Implement the design based on the implementation plan (Stage 4 of Spec-Driven Development)
---
## Context

- Implementation plan: @.ai/plan.md
- Task specifications: @.ai/tasks/task-spec-*.md

## Your task

## 1. Verify prerequisites

- Check that `.ai/plan.md` and `.ai/tasks/task-spec-*.md` exist
- If not, inform user to complete previous stages first

## 2. Start to run tasks

Run the tasks in the order of the plan document.
Update `.ai/plan.md` and `.ai/tasks/task-spec-*.md` as you complete each task.

## 3. Present to user

Show the implementation result and ask for:

- Confirmation of understanding
- Any issues
- Approval to proceed to next phase

## Important Notes

## Implementation Phase Rules

This rule defines the specific rules for the implementation phase of specification-driven development.

### Implementation Basic Principles

#### Specification-Driven Implementation
- 設計書、API仕様書に基づく実装
- 仕様書との整合性の確保
- 仕様書の更新と実装の同期

#### Quality-Focused Implementation
- コード品質、パフォーマンス、セキュリティの確保
- テスト容易性の考慮
- 保守性、拡張性の確保

#### Continuous Improvement
- コードレビューの実施
- リファクタリングの継続
- 技術的負債の管理

### Implementation Steps

#### 1. Environment Preparation
- 開発環境の構築
- 必要なツール、ライブラリの導入
- コーディング規約の確認

#### 2. Implementation
- 仕様書に基づく実装
- テストコードの作成
- ドキュメントの作成

#### 3. Testing
- 単体テストの実行
- 結合テストの実行
- システムテストの実行

#### 4. Review
- コードレビューの実施
- 仕様書との整合性確認
- 品質基準の確認

### Coding Guidelines

#### Naming Rules
- 変数名、関数名、クラス名の統一
- 意味のある名前の使用
- 略語の統一

#### Code Structure
- 関数、クラスの適切な分割
- 責任の明確化
- 依存関係の整理

#### Comments
- 過剰なコメントは避ける
- 複雑なロジックの説明
- 仕様書への参照
- 変更履歴の記録

### Testing Strategy

#### Unit Testing
- 各関数、メソッドのテスト
- 境界値、異常値のテスト
- モック、スタブの活用

#### Integration Testing
- コンポーネント間の連携テスト
- APIのテスト
- データベース連携のテスト

#### System Testing
- エンドツーエンドのテスト
- パフォーマンステスト
- セキュリティテスト

### Quality Management

#### Code Quality
- 静的解析ツールの活用
- コード複雑度の管理
- 重複コードの排除

#### Performance
- レスポンス時間の測定
- メモリ使用量の監視
- ボトルネックの特定

#### Security
- 脆弱性のチェック
- 入力検証の実装
- 出力エスケープの実装

### Documentation Creation

#### API Specification
- エンドポイント、パラメータ、レスポンス
- サンプルリクエスト・レスポンス
- エラーコード、エラーメッセージ

#### User Guide
- 機能の使用方法
- 画面操作手順
- トラブルシューティング

#### Technical Documentation
- アーキテクチャの説明
- 設定方法、運用方法
- トラブルシューティング

### Version Management

#### Git Operations
- ブランチ戦略の決定
- コミットメッセージの統一
- プルリクエストの活用

#### Release Management
- バージョン番号の管理
- リリースノートの作成
- ロールバック計画の準備

### Continuous Improvement

#### Code Review
- ピアレビューの実施
- ベストプラクティスの共有
- 知識の共有

#### Refactoring
- 技術的負債の解消
- コードの改善
- パフォーマンスの最適化

#### Learning & Improvement
- 新技術の学習
- プロセスの改善
- ツールの改善

### Review Points

- [ ] 仕様書との整合性
- [ ] コード品質の確保
- [ ] テストカバレッジの確保
- [ ] パフォーマンス要件の充足
- [ ] セキュリティ要件の充足
- [ ] ドキュメントの完全性
- [ ] 運用性の考慮