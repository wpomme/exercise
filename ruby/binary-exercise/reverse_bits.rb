# frozen_string_literal: true

# ビットを逆順にする
# 例: 000110110 => 011011000 (最初の二進数について、逆から読んでいくイメージ)
# もし、ビットが32bitに満たない場合は、0でパディングする
#
# 1. n & 1 => 一番下のビットを取り出す
# 2. result << 1 => 結果を１ビット左にずらす
# 3. | => 取り出したビットの結果を一番下に追加する
# 4. これを32回繰り返す
def reverse_bits(n)
  result = 0

  32.times do
    result = (result << 1) | (n & 1)
    n >>= 1
  end

  result
end
