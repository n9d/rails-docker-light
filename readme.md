# rails 最小開発環境

- railsの環境を最初から作れるように git内には何も入れない
  

# railsインストール

- 最新のrailsをインストール
- rubyのバージョンを変えるときにはDockerfileの一行目を編集

```sh
docker-compose -f docker-compose.init.yml build
docker-compose -f docker-compose.init.yml run srv bundle install
docker-compose -f docker-compose.init.yml run srv rails new myapp -fG
```

## dbをsqliteにする

.env .env.example を編集する
```
DB_CONNECTION=sqlite
# DB_HOST=127.0.0.1
# DB_PORT=3306
# DB_DATABASE=homestead
# DB_USERNAME=homestead
# DB_PASSWORD=secret
```


## gitにするとき

```sh
rm -rf .git
git init
```

## コンテナ・volume・ネットワークを無かったことにする

```sh
docker-compose down --rmi all --volumes --remove-orphans
```

# サーバ起動

- ほかからlaravel入のやつをもらってきたときは `docker-compose up`しておく

```sh
docker-compose up
```

## 確認

- http://localhost:8080/


## マイグレーション
```sh
docker-compose exec app php artisan migrate
```

## シェルの起動

```sh
docker-compose exec app bash
```

# 本番環境へ（試験環境）

- 入り口nginx -(fastCGI)-> php-fpm

## ブラウザで確認

- http://localhost:8080/

## cgi-fcgiにて試験

- 予めローカルにcgi-fcgiをインストールしておく
```sh
SCRIPT_FILENAME=/src/public/index.php  REQUEST_METHOD=GET cgi-fcgi -bind -connect 127.0.0.1:9000
```
