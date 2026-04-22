require 'minitest/autorun'
require_relative '../lib/fizz_buzz'

class FizzBuzzTest < Minitest::Test
  def setup
    # 適当な素数のリストを作成する
    @test_prime_nums = [83, 883, 4993]
  end

  def test_fizz_buzz_with_prime_number
    # fizz_buzzに与えた数値が3の倍数でも5の倍数でもなければ、そのまま数値を返す
    assert_equal(@test_prime_nums.map(&:to_s), @test_prime_nums.map { |i| fizz_buzz(i) })
  end

  def test_fizz_buzz_with_a_multiple_of_three
    # fizz_buzzに与えた数値が3の倍数なら、'Fizz'を返す
    assert_equal((1..3).map { "Fizz" }, @test_prime_nums.map { |i| fizz_buzz(i * 3) })
  end

  def test_fizz_buzz_with_a_multiple_of_five
    # fizz_buzzに与えた数値が5の倍数なら、'Buzz'を返す
    assert_equal((1..3).map { "Buzz" }, @test_prime_nums.map { |i| fizz_buzz(i * 5) })
  end

  def test_fizz_buzz_with_a_multiple_of_fifteen
    # fizz_buzzに与えた数値が15の倍数なら、'Fizz Buzz'を返す
    assert_equal((1..3).map { "Fizz Buzz" }, @test_prime_nums.map { |i| fizz_buzz(i * 15) })
  end
end
