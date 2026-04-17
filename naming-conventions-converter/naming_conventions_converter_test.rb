require 'test/unit'
require_relative './naming_conventions_converter.rb'

class TestCase_NamingConventionsConverter < Test::Unit::TestCase
  def setup
    @obj = NamingConventionsConverter.new
  end

  def test_camel_to_pascal_1
    result = @obj.camel_to_pascal "aBcDefGhijK"
    assert_equal("ABcDefGhijK", result)
  end

  def test_camel_to_pascal_2
    result = @obj.camel_to_pascal "abcDef"
    assert_equal("AbcDef", result)
  end

  def test_camel_to_kebab
    result = @obj.camel_to_kebab "aBcDefGhijK"
    assert_equal("a-bc-def-ghij-k", result)
  end

  def test_kebab_to_pascal
    result = @obj.kebab_to_pascal "a-bc-def-ghij-k"
    assert_equal("ABcDefGhijK", result)
  end

  def test_kebab_to_camel
    result = @obj.kebab_to_camel "a-bc-def-ghij-k"
    assert_equal("aBcDefGhijK", result)
  end
end
