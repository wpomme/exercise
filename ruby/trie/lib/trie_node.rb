# frozen_string_literal: true

class TrieNode
  attr_reader :children

  def initialize
    @children = {}
  end
end
