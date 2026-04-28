require 'minitest/autorun'
require_relative '../lib/trie'
require_relative '../lib/trie_node'

class TrieTest < Minitest::Test
  def setup
    @trie = Trie.new
    @words = %w[foo bar baz bat batter bake bad]
    @words.each do |word|
      @trie.insert(word)
    end
  end

  # Trieの中に単語が登録されていれば、TrieNodeを返し、
  # そのTrieNodeの要素childrenについて、trie_node.children[:sentinel] = {:sentinel => nil}を返す
  def test_search_is_success
    @words.each do |word|
      expected = @trie.search(word)
      assert_nil expected.children[:sentinel]
    end
  end

  # Trieの中に単語が登録されていなければ、nilを返す
  def test_search_is_failed
    word = "none"
    expected = @trie.search(word)
    assert_nil expected
  end
end
