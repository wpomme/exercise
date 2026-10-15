# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/main'

class MergeTwoSortedListsTest < Minitest::Test
  def test_execute1
    arr1 = [1, 2, 4]
    arr2 = [1, 3, 4]

    list1 = from_array(arr1)
    list2 = from_array(arr2)

    act = merge_two_lists(list1, list2)

    arr = traverse_link(act)
    assert_equal([1, 1, 2, 3, 4, 4], arr)
  end

  def test_execute2
    arr1 = []
    arr2 = []

    list1 = from_array(arr1)
    list2 = from_array(arr2)

    act = merge_two_lists(list1, list2)

    arr = traverse_link(act)
    # とりあえずOK
    assert_equal(nil, arr)
  end

  def test_execute3
    arr1 = []
    arr2 = [0]

    list1 = from_array(arr1)
    list2 = from_array(arr2)

    act = merge_two_lists(list1, list2)

    arr = traverse_link(act)
    assert_equal([0], arr)
  end

  # このテストケースが通るように修正する
  def test_execute4
    arr1 = [5]
    arr2 = [1, 2, 4]

    list1 = from_array(arr1)
    list2 = from_array(arr2)

    act = merge_two_lists(list1, list2)

    arr = traverse_link(act)
    assert_equal([1, 2, 4, 5], arr)
  end
end
