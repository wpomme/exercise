## scheme
- schemeの処理系を動かすためにdockerコンテナを作成する
```bash
## シェルにログイン
## これでもいい
docker run --rm -ti practicalscheme/gauche

## 起動
make

## gaucheを動かす
gosh

## -> goshにスクリプトを貼り付けながらプログラムを実行していく

## 停止
make down
```

