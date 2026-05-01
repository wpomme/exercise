require 'minitest/autorun'
require_relative '../lib/my_calculator'

class MyUnionTest < Minitest::Test
  def setup
    str = "9-5+2"
    @calc = MyCalculator.new
    @calc.read(str)
    @calc.parse
  end

  def test_my_calculator_preorder
    @calc.preorder
    preorder_values = @calc.preorder_values
    # Rootのvalue = nilを除外する
    actual = preorder_values.filter { |i| i }
    assert_equal(["9", "-", "5", "+", "2"], actual)
  end

  def test_my_calculator_inorder
    @calc.inorder
    inorder_values = @calc.inorder_values
    # Rootのvalue = nilを除外する
    actual = inorder_values.filter { |i| i }
    # 逆ポーランド記法になる
    assert_equal(["9", "5", "-", "2", "+"], actual)
  end

  def test_my_calculator_postorder
    @calc.postorder
    postorder_values = @calc.postorder_values
    # Rootのvalue = nilを除外する
    actual = postorder_values.filter { |i| i }
    assert_equal(["9", "5", "2", "+", "-"], actual)
  end

  def teardown
    @calc = nil
  end
end
