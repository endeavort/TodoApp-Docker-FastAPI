# Dockerイメージを指定
# 最新版のmysqlイメージ
FROM mysql:latest 

# 環境変数の設定
ENV MYSQL_DATABASE todo_db
ENV MYSQL_USER user
ENV MYSQL_PASSWORD password
ENV TZ "Asia/Tokyo"
ENV MYSQL_ROOT_PASSWORD p@assw0rd

# コンテナにコピー
COPY ./init.sql /docker-entrypoint-initdb.d/init.sql