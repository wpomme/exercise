# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/main'

class ValidParenthesisTest < Minitest::Test
  def test_execute1
    str = "()"
    vp = ValidParenthesis.execute?(str)

    assert_equal(true, vp)
  end

  def test_execute2
    str = "()[]{}"
    vp = ValidParenthesis.execute?(str)

    assert_equal(true, vp)
  end

  def test_execute3
    str = "(]"
    vp = ValidParenthesis.execute?(str)

    assert_equal(false, vp)
  end

  def test_execute4
    str = "([])"
    vp = ValidParenthesis.execute?(str)

    assert_equal(true, vp)
  end

  def test_execute5
    str = "([)]"
    vp = ValidParenthesis.execute?(str)

    assert_equal(false, vp)
  end

  def test_execute6
    str = "["
    vp = ValidParenthesis.execute?(str)

    assert_equal(false, vp)
  end
end
