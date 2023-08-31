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
#### コンテナを確認
 ```ターミナル
docker ps -f "name=todo-mysql-container"
```
#### コンテナに入る
 ```ターミナル
docker exec -it $(docker ps -q -f "name=todo-mysql-container") /bin/bash
```
##### exec
Dockerコンテナ内でコマンドを実行するためのコマンド
##### -it
インタラクティブなモードでコンテナ内でコマンドを実行するためのオプション。  
このオプションを指定することで、コンテナ内のコマンドプロンプトと対話的にやり取りすることができる。
##### $(docker ps -q -f "name=sample-mysql-container")
docker ps コマンドを使用して実行中のコンテナの一覧を表示し、その中から名前が "todo-mysql-container" という条件に一致するコンテナの ID を取得。  
このコンテナの ID が後続のコマンドに渡される。
##### /bin/bash
コンテナ内で実行するコマンドを指定。ここでは、Bash シェルを起動するために /bin/bash を指定。
#### dbに接続
mysql todo_db -h localhost -u sample_user -p sample_password