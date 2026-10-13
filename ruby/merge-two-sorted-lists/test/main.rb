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

    pp act
    assert(0, 0)
  end
end
