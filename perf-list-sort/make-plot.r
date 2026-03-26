library(ggplot2)

# 数値を10進数で表示する
options(scipen=999)

# PNGファイルとして保存する
png("output.png")

# CSVファイルを読み込む
df <- read.csv("perf-list-sort-result.csv", header = TRUE)

# グラフを描画する
ggplot(data = df, aes(x = 要素数, y = 実行時間)) +
  geom_line(color = "steelblue") +
  geom_point(size = 3, color = "steelblue") +
  # X軸を対数スケールにする
  scale_x_log10() +
  labs(
    title = "要素数と実行時間の関係",
    x = "要素数",
    y = "実行時間（秒）"
  ) +
  theme_minimal()

# PNGファイルへの書き込みを確定する
dev.off()
