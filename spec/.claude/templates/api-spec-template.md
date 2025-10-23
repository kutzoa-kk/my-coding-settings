# API仕様書テンプレート

## プロジェクト情報

**プロジェクト名**: [プロジェクト名]  
**API名**: [API名]  
**バージョン**: [バージョン]  
**作成日**: [作成日]  
**作成者**: [作成者]  
**承認者**: [承認者]  
**最終更新日**: [最終更新日]

## 1. API概要

### 1.1 目的
[APIの目的を記述]

### 1.2 基本情報
- **ベースURL**: `https://api.example.com/v1`
- **認証方式**: [認証方式]
- **データ形式**: JSON
- **文字エンコーディング**: UTF-8

### 1.3 共通仕様
- **HTTPメソッド**: GET, POST, PUT, DELETE
- **ステータスコード**: 標準HTTPステータスコード
- **エラーレスポンス**: 統一されたエラー形式

## 2. 認証・認可

### 2.1 認証方式
```
Authorization: Bearer <access_token>
```

### 2.2 トークン取得
#### POST /auth/token
**概要**: アクセストークンを取得する

**リクエスト**:
```json
{
  "username": "user@example.com",
  "password": "password"
}
```

**レスポンス**:
```json
{
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "token_type": "Bearer",
  "expires_in": 3600
}
```

### 2.3 権限管理
| 権限 | 説明 | スコープ |
|------|------|----------|
| read | 読み取り権限 | user:read |
| write | 書き込み権限 | user:write |
| admin | 管理者権限 | user:admin |

## 3. エンドポイント一覧

### 3.1 エンドポイント一覧
| メソッド | パス | 概要 | 認証 | 権限 |
|----------|------|------|------|------|
| GET | /users | ユーザー一覧取得 | 必要 | read |
| POST | /users | ユーザー作成 | 必要 | write |
| GET | /users/{id} | ユーザー詳細取得 | 必要 | read |
| PUT | /users/{id} | ユーザー更新 | 必要 | write |
| DELETE | /users/{id} | ユーザー削除 | 必要 | admin |

## 4. エンドポイント詳細

### 4.1 ユーザー管理

#### GET /users
**概要**: ユーザー一覧を取得する

**パラメータ**:
| 名前 | 型 | 必須 | デフォルト | 概要 |
|------|----|----|------------|------|
| page | integer | 否 | 1 | ページ番号 |
| limit | integer | 否 | 20 | 取得件数 |
| sort | string | 否 | id | ソート項目 |
| order | string | 否 | asc | ソート順序 |

**レスポンス**:
```json
{
  "users": [
    {
      "id": 1,
      "name": "ユーザー名",
      "email": "user@example.com",
      "created_at": "2024-01-01T00:00:00Z",
      "updated_at": "2024-01-01T00:00:00Z"
    }
  ],
  "pagination": {
    "total": 100,
    "page": 1,
    "limit": 20,
    "pages": 5
  }
}
```

**エラーレスポンス**:
| ステータス | エラーコード | メッセージ |
|------------|--------------|------------|
| 400 | INVALID_PARAMETER | パラメータが不正です |
| 401 | UNAUTHORIZED | 認証が必要です |
| 403 | FORBIDDEN | 権限がありません |

#### POST /users
**概要**: ユーザーを作成する

**リクエスト**:
```json
{
  "name": "ユーザー名",
  "email": "user@example.com",
  "password": "password"
}
```

**レスポンス**:
```json
{
  "id": 1,
  "name": "ユーザー名",
  "email": "user@example.com",
  "created_at": "2024-01-01T00:00:00Z",
  "updated_at": "2024-01-01T00:00:00Z"
}
```

**エラーレスポンス**:
| ステータス | エラーコード | メッセージ |
|------------|--------------|------------|
| 400 | VALIDATION_ERROR | バリデーションエラー |
| 409 | DUPLICATE_EMAIL | メールアドレスが重複しています |

#### GET /users/{id}
**概要**: ユーザー詳細を取得する

**パスパラメータ**:
| 名前 | 型 | 必須 | 概要 |
|------|----|----|------|
| id | integer | 必要 | ユーザーID |

**レスポンス**:
```json
{
  "id": 1,
  "name": "ユーザー名",
  "email": "user@example.com",
  "profile": {
    "age": 30,
    "gender": "male"
  },
  "created_at": "2024-01-01T00:00:00Z",
  "updated_at": "2024-01-01T00:00:00Z"
}
```

**エラーレスポンス**:
| ステータス | エラーコード | メッセージ |
|------------|--------------|------------|
| 404 | USER_NOT_FOUND | ユーザーが見つかりません |

#### PUT /users/{id}
**概要**: ユーザー情報を更新する

**パスパラメータ**:
| 名前 | 型 | 必須 | 概要 |
|------|----|----|------|
| id | integer | 必要 | ユーザーID |

**リクエスト**:
```json
{
  "name": "更新されたユーザー名",
  "email": "updated@example.com"
}
```

**レスポンス**:
```json
{
  "id": 1,
  "name": "更新されたユーザー名",
  "email": "updated@example.com",
  "updated_at": "2024-01-01T00:00:00Z"
}
```

#### DELETE /users/{id}
**概要**: ユーザーを削除する

**パスパラメータ**:
| 名前 | 型 | 必須 | 概要 |
|------|----|----|------|
| id | integer | 必要 | ユーザーID |

**レスポンス**:
```json
{
  "message": "ユーザーが削除されました"
}
```

## 5. データモデル

### 5.1 ユーザー
```json
{
  "id": 1,
  "name": "ユーザー名",
  "email": "user@example.com",
  "password": "password",
  "profile": {
    "age": 30,
    "gender": "male",
    "address": "住所"
  },
  "created_at": "2024-01-01T00:00:00Z",
  "updated_at": "2024-01-01T00:00:00Z"
}
```

### 5.2 エラーレスポンス
```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "エラーメッセージ",
    "details": {
      "field": "フィールド名",
      "reason": "エラー理由"
    }
  }
}
```

## 6. ステータスコード

### 6.1 成功レスポンス
| ステータス | 説明 |
|------------|------|
| 200 | OK - リクエスト成功 |
| 201 | Created - リソース作成成功 |
| 204 | No Content - リクエスト成功（コンテンツなし） |

### 6.2 エラーレスポンス
| ステータス | 説明 |
|------------|------|
| 400 | Bad Request - リクエストが不正 |
| 401 | Unauthorized - 認証が必要 |
| 403 | Forbidden - 権限がありません |
| 404 | Not Found - リソースが見つかりません |
| 409 | Conflict - リソースの競合 |
| 500 | Internal Server Error - サーバー内部エラー |

## 7. レート制限

### 7.1 制限値
- **リクエスト数**: 1000リクエスト/時間
- **バースト**: 100リクエスト/分

### 7.2 レスポンスヘッダー
```
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1640995200
```

## 8. バージョニング

### 8.1 バージョン管理
- **URL**: `/v1/`, `/v2/`
- **ヘッダー**: `Accept: application/vnd.api+json;version=1`
- **後方互換性**: 6ヶ月間維持

### 8.2 廃止予定機能
| 機能 | 廃止予定日 | 代替機能 |
|------|------------|----------|
| [機能1] | [日付] | [代替機能] |
| [機能2] | [日付] | [代替機能] |

## 9. 付録

### 9.1 サンプルコード
#### JavaScript (fetch)
```javascript
const response = await fetch('/api/v1/users', {
  method: 'GET',
  headers: {
    'Authorization': 'Bearer ' + token,
    'Content-Type': 'application/json'
  }
});
const data = await response.json();
```

#### Python (requests)
```python
import requests

headers = {
    'Authorization': 'Bearer ' + token,
    'Content-Type': 'application/json'
}
response = requests.get('/api/v1/users', headers=headers)
data = response.json()
```

### 9.2 参考資料
- [資料1]: [URL]
- [資料2]: [URL]

### 9.3 変更履歴
| 日付 | バージョン | 変更内容 | 変更者 |
|------|------------|----------|--------|
| [日付] | [バージョン] | [変更内容] | [変更者] |

---

**承認**
- API設計者: [署名] [日付]
- 開発責任者: [署名] [日付]
- セキュリティ責任者: [署名] [日付]
