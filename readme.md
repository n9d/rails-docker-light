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

- ほかからrails入のやつをもらってきたときは `docker-compose up`しておく

```sh
docker-compose up
```

## 確認

- http://localhost:3000/


## マイグレーション
```sh
docker-compose exec srv rails migrate
```

## シェルの起動

```sh
docker-compose exec srv bash
```

# 本番環境へ（試験環境）

## ブラウザで確認

- http://localhost:3000/
