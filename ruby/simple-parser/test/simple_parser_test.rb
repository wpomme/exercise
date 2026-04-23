require 'minitest/autorun'
require_relative '../lib/simple_parser'

class SimpleParserTest < Minitest::Test
  def setup
    @derivation_map = SyntaxStack::DERIVATION_MAP
    @terminals = SyntaxStack::TERMINALS
  end

  # 非終端記号がexprのとき
  def test_derivation_map_about_expr
    # 終端記号が整数(id)の時だけhashのkeyの指定方法が違う
    assert_equal @derivation_map[:expr][@terminals[:id]], %i[expr_rest term]
    assert_equal @derivation_map[:expr]['('], %i[expr_rest term]
  end

  # 非終端記号が因子factorのとき
  def test_derivation_map_about_factor
    # 終端記号が文字列型の整数のとき、その値をリストにして返す関数を返す
    assert_equal @derivation_map[:factor][@terminals[:id]].call('42'), ['42']
    # スタックにpushする順にリストに記号を入れているため、カッコが逆順に出力される
    assert_equal @derivation_map[:factor][@terminals[:lparen]], [")", :expr, "("]
  end
end
