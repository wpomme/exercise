require 'minitest/autorun'
require_relative './reverse_polish_notation.rb'

class MyUnionTest < MiniTest::Test
  def test_reverse_polish_notation_read_1
    # (3 + 4) * (1 - 2)
    str = "3 4 + 1 2 - *"
    rpn = ReversePolishNotation.new
    rpn.read(str)
    assert_equal rpn.read(str), ["3", "4", "+", "1", "2", "-", "*"]
  end

  def test_reverse_polish_notation_calc_1
    # (3 + 4) * (1 - 2) = 7 * -1 = -7
    str = "3 4 + 1 2 - *"
    rpn = ReversePolishNotation.new
    rpn.read(str)
    expected = rpn.calc()
    assert_equal expected, -7
  end

  def test_reverse_polish_notation_read_2
    # (1234 + 5678) * (9012 - 3456)
    str = "1234 5678 + 9012 3456 - *"
    rpn = ReversePolishNotation.new
    rpn.read(str)
    assert_equal rpn.read(str), ["1234", "5678", "+", "9012", "3456", "-", "*"]
  end

  def test_reverse_polish_notation_calc_2
    # (1234 + 5678) * (9012 - 3456) = 38403072 
    str = "1234 5678 + 9012 3456 - *"
    rpn = ReversePolishNotation.new
    rpn.read(str)
    expected = rpn.calc()
    assert_equal expected, 38403072
  end
end
