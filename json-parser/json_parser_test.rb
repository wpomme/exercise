require 'minitest/autorun'
require_relative './json_parser.rb'

class JsonParserTest < Minitest::Test
  def test_match_number_integer_and_fraction
    jp = JsonParser.new

    ## ["sign", "integer", "fraction", "exponent"]
    assert_equal [nil, "123", nil, nil], jp.match_number("123").captures
    assert_equal [nil, "456", "789", nil], jp.match_number("456.789").captures
    assert_equal ["-", "123", nil, nil], jp.match_number("-123").captures
    assert_equal ["-", "123", "456", nil], jp.match_number("-123.456").captures
    assert_equal [nil, "0", "123", nil], jp.match_number("0.123").captures
    assert_equal ["-", "0", "987", nil], jp.match_number("-0.987").captures
    assert_equal [nil, "0", "001", nil], jp.match_number("0.001").captures
    assert_equal ["-", "0", "001", nil], jp.match_number("-0.001").captures
  end
  def test_match_number_exponent
    jp = JsonParser.new

    ## ["sign", "integer", "fraction", "exponent"]
    assert_equal [nil, "1", "23", "-12"], jp.match_number("1.23e-12").captures
    assert_equal ["-", "4", "56", "+3"], jp.match_number("-4.56E+3").captures
    assert_equal [nil, "98", "7", "+10"], jp.match_number("98.7E+10").captures
    assert_equal ["-", "1", "456", "10"], jp.match_number("-1.456e10").captures
    assert_equal [nil, "0", "123", "-2"], jp.match_number("0.123E-2").captures
    assert_equal ["-", "0", "98", "-10"], jp.match_number("-0.98e-10").captures
    assert_equal [nil, "0", "001", "-12"], jp.match_number("0.001E-12").captures
    assert_equal ["-", "0", "001", "10"], jp.match_number("-0.001e10").captures
  end

  def test_match_whitespace?
    jp = JsonParser.new

    #TODO 空文字もmatchできるようにしたい
    # assert_equal true, jp.match_whitespace?("")
    assert_equal true, jp.match_whitespace?(" ")
    assert_equal true, jp.match_whitespace?("   ")
    assert_equal true, jp.match_whitespace?("\n")
    assert_equal true, jp.match_whitespace?("\r")
    assert_equal true, jp.match_whitespace?("\t")
    assert_equal true, jp.match_whitespace?(" \n\r\t ")
    # 垂直タブ(\v)はfalse
    assert_equal false, jp.match_whitespace?("\v")
    # 改ページ(\f)はfalse
    assert_equal false, jp.match_whitespace?("\f")
    # パイプもmatchしないようにする
    assert_equal false, jp.match_whitespace?("|")
    # 文字はfalse
    assert_equal false, jp.match_whitespace?("a")
  end
end
