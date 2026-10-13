# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/main'

class MaxDepthOfBinaryTreeTest < Minitest::Test
  def test_execute1
    root = [3, 9, 20, nil, nil, 15, 7]
    bt = BinaryTree.from_array(root)

    pp bt
    assert(bt, '')
  end
end
