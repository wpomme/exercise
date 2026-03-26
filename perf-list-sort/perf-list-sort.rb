# Rubyのsort関数の実行時間をbenchmarkを使って計測する
require 'benchmark'

# 1からその要素数の数値が順番に入っている配列をshuffleでランダムにしたもの
# それぞれの要素数は1000, 10000, 100000とした
shuffled_list_array = [1000, 10000, 100_000].map{ |i|
  (1..i).to_a.shuffle
}

Benchmark.bm do |x|
  shuffled_list_array.each do |lst|
    x.report("1..#{lst.size}:") { lst.sort }
  end
end
