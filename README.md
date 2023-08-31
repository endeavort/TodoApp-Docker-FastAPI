# タスク管理アプリ
Docker/Python3/FastAPI/MySQL/Vueで作成

## 必須機能
#### ・CRUD処理
    -SQLAlchemyを用いてMySQLを利用する
#### ・検索機能
#### ・フロントエンド実装
    -Vueを利用
#### ・Docker、docker-composeを利用した環境構築(FastAPI用コンテナ、MySQL用コンテナなど)

## 追加機能
#### ・ログイン認証機能


## 手順
### ステップ1: DB構築
#### init.sqlの作成
DBコンテナを立ち上げた際に、テーブル作成を行うために作成

#### Dockerfileの作成
##### imageをbuild
```ターミナル
docker build -t todo-mysql:1.0.0 .
```
##### コンテナを起動
```ターミナル
docker run -d --name todo-mysql-container -p 3306:3306 todo-mysql:1.0.0
```

