# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/main'

class MergeTwoSortedListsTest < Minitest::Test
  def test_execute1
    arr = [1, 2, 3, 4, 5]
    left = 2
    right = 4

    list = from_array(arr)

    act = reverse_between(list, left, right)

    assert_equal([1, 4, 3, 2, 5], traverse_link(act))
  end

  def test_execute2
    arr = [5]
    left = 1
    right = 1

    list = from_array(arr)

    act = reverse_between(list, left, right)

    assert_equal([5], traverse_link(act))
  end

  def test_execute3
    arr = [3, 5]
    left = 2
    right = 2

    list = from_array(arr)

    act = reverse_between(list, left, right)

    assert_equal([3, 5], traverse_link(act))
  end

  def test_execute4
    arr = [3, 5]
    left = 1
    right = 2

    list = from_array(arr)

    act = reverse_between(list, left, right)

    assert_equal([5, 3], traverse_link(act))
  end
end
