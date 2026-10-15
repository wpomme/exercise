# frozen_string_literal: true

# 二進数の文字列を足して、二進数の文字列で返す
def add_binary(a, b)
  i = a.to_i(2) + b.to_i(2)
  i.to_s(2)
end

# 二進数で表現された文字列を10進数の整数にして返す
# => str.to_s(2)で全く同じことが出来る。しかも速い
def str_binary_to_int(a)
  iter_range = a.size - 1
  result = 0

  (0..iter_range).each do |index|
    result += (2**(iter_range - index)) if a[index] == '1'
  end
  result
end

p add_binary('11', '1')
# => '100'
p add_binary('1010', '1011')
# => "10101"
