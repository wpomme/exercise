# frozen_string_literal: true

## 研鑽Rubyプログラミング、p16~
## インメモリデータベースの実装

# 例として、アルバム名、曲番号、アーティスト名からなる配列を作成する
album_infos = 100.times.flat_map do |i|
  10.times.map do |j|
    # アルバム名、曲番号、アーティスト名
    ["Album #{i}", j, "Artist #{j}"]
  end
end

# 1. 二つのハッシュを作成して、その中にデータを入れる
# Pros: 検索は簡単。ハッシュにキーを代入するだけ
# Cons; データ量に応じてメモリ量が大幅に増大する
# COns: ハッシュデータを作成するのに時間がかかる

# キー: アルバム名
album_artists = {}
# キー: アルバム名と曲番号の配列
album_track_artists = {}

album_infos.each do |album, track, artist|
  (album_artists[album] ||= []) << artist
  (album_track_artists[[album, track]] ||= []) << artist
end

# 2. ハッシュをネストする
# Cons: 検索が複雑になる
# Pros: 1よりはメモリ量が少ない
# データベースの作成イメージ
# (album_artists[album] ||= {}[track ||= []]) << artist

# トラックが1から99までの整数だと分かっていれば、次のようにデータベースを実装できる
# 3. ハッシュの値を「配列の配列」とする。曲を表す配列の0番目に、そのアルバムに関係する全アーティスト名を入れておく
# 1. と同じくらいの単純さで検索可能、速度も同じくらい。また、2. と同じくらいのメモリ量で実装可能
# => 1, 2より3が最適
albums = {}
album_infos.each do |album, track, artist|
  album_array = albums[album] ||= [[]]
  album_array[0] << artist
  (album_array[track] ||= []) << artist
end

## ここで新機能が追加されたとする。ユーザーがアーティスト名の配列を渡すと、そのアーティストに関連するアルバム
# album_artists = {}
#
### 下のrubocopをdisableにするには、rubocop/disableの/を:に変えること
### rubocop/disable Style/CombinableLoops
# album_infos.each do |_, _, artist|
#   album_artists[artist] ||= true
# end

## 集合を使ってデータベースを実装することもできる。その場合は、検索ロジックも単純になる。
## 検索ロジックは集合の関演算を使う。
album_artists = Set.new(album_infos.flat_map(&:last))
pp album_artists
