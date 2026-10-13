# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/main'

class MaxDepthOfBinaryTreeTest < Minitest::Test
  def test_execute1
    array = [3, 9, 20, nil, nil, 15, 7]
    root = from_array(array)

    pp root
    assert(c, 0)
  end
end
