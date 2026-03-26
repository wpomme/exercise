# perf list sort
## 目的
ある関数の実行時間を計測し、計測結果から計算量を推測できるようにする

### 技術スタック
言語: Ruby
計測する関数: Array#sort

### perf-list-sort.rb
sort関数の実行時間をbenchmarkを使って計測する

- 実行方法

```ruby
ruby perf-list-sort.rb
```

### perf-list-sort-result.txt
perf-list-sort.rbの実行結果を保存したもの

### perf-list-sort-result.csv
perf-list-sort.rbの実行結果をCSVに整形したもの

### make-plot.r
perf-list-sort-result.csvを使ってグラフを作成しようとしたもの
未完成
ファイル名も変えたい

### calc-time-complexity.py
計算量をperf-list-sort.rbの実行結果から求めたもの
約1.09のため、O(nlogn)と推定できる

### r-script.command.txt
Rscriptのシェルモードで使用していたコマンド

## R言語をはじめる
- 対話モードにする
```bash
R
```

- スクリプトを実行する
```bash
Rscript example.r
```

- ggplot2 をインストールする
```bash
# Rscript のシェルを開く
R

# Rの対話モードで次のコマンドを実行する
install.packages("ggplot2")
```
