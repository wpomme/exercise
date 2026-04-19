require 'minitest/autorun'
require_relative './simple_parser.rb'

class SimpleParserTest < MiniTest::Test
  def setup
    @DERIVATION_MAP = SyntaxStack::DERIVATION_MAP
    @TERMINALS = SyntaxStack::TERMINALS
  end

  # 非終端記号がexprのとき
  def test_DERIVATION_MAP_about_expr
    # 終端記号が整数(id)の時だけhashのkeyの指定方法が違う
    assert_equal @DERIVATION_MAP[:expr][@TERMINALS[:id]], [:expr_rest, :term]
    assert_equal @DERIVATION_MAP[:expr]['('], [:expr_rest, :term]
  end

  # 非終端記号が因子factorのとき
  def test_DERIVATION_MAP_about_factor
    # 終端記号が文字列型の整数のとき、その値をリストにして返す関数を返す
    assert_equal @DERIVATION_MAP[:factor][@TERMINALS[:id]].('42'), ['42']
    # スタックにpushする順にリストに記号を入れているため、カッコが逆順に出力される
    assert_equal @DERIVATION_MAP[:factor][@TERMINALS[:lparen]], [")", :expr, "("]
  end
end
