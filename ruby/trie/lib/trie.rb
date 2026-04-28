require_relative 'trie_node'

class Trie
  def initialize
    @root = TrieNode.new
  end

  def search(word)
    current_node = @root
    word.each_char do |c|
      return nil unless current_node.children.key?(c)

      current_node = current_node.children[c]
    end
    current_node
  end

  def insert(word)
    current_node = @root
    word.each_char do |c|
      if current_node.children.key?(c)
        current_node = current_node.children[c]
      else
        new_node = TrieNode.new
        current_node.children[c] = new_node
        current_node = new_node
      end
    end
    current_node.children[:sentinel] = nil
  end
end
