# Ruby on Rails ECサイト

## 環境構築

### Dockerイメージのビルド

```shell
docker-compose build
```

### Dockerコンテナの起動

```shell
docker-compose up -d
```

### DBのマイグレーションと初期データの投入

```shell
docker-compose exec web rails db:migrate
docker-compose exec web rails db:seed
```
