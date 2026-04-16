require 'minitest/autorun'
require_relative './my-union.rb'

class MyUnionTest < MiniTest::Test
  def test_my_union_1
    lst1 = [1, 2, 3, 4, 5]
    lst2 = [0, 2, 4, 6, 8]
    assert_equal my_union(lst1, lst2), [2, 4]
  end

  def test_my_union_2
    # 1から10000までの配列と適当な素数の配列からunionを作成する
    lst1 = (1..10000).to_a
    lst2 = [83, 883, 4993]
    assert_equal my_union(lst1, lst2), lst2
  end
end
