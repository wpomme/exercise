require 'minitest/autorun'
require_relative './my_calculator.rb'

class MyUnionTest < Minitest::Test
  def test_my_calculator_read_1
    str = "9-5+2"
    calc = MyCalculator.new
    calc.read(str)
    assert_equal ["9", "-", "5", "+", "2"], calc.read(str)
  end

  def test_my_calculator_parse_1
    str = "9-5+2"
    calc = MyCalculator.new
    calc.read(str)
    parsed = calc.parse()
    assert_equal ["9", "-", "5", "+", "2"], parsed
  end

  # def test_my_calculator_read_2
  #   str = "(1 + 2) * (3 + 4)"
  #   calc = MyCalculator.new
  #   calc.read(str)
  #   assert_equal calc.read(str), ["(", "1", "+", "2", ")", "*", "(", "3", "+", "4", ")"]
  # end

  # def test_my_calculator_read_3
  #   str = "1 + (2 * (3 + 4))"
  #   calc = MyCalculator.new
  #   calc.read(str)
  #   assert_equal calc.read(str), ["1", "+", "(", "2", "*", "(", "3", "+", "4", ")", ")"]
  # end
end
