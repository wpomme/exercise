# frozen_string_literal: true

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, nxt = nil)
    @val = val
    @next = nxt
  end
end

def from_array(arr)
  size = arr.size
  nodes = (1..size).map { |_| nil }

  arr.reverse_each.with_index do |v, i|
    linked_list_node = ListNode.new(v)

    index = size - i - 1
    nodes[index] = linked_list_node

    next if i.zero?

    next_index = size - i

    linked_list_node.next = nodes[next_index]
  end

  # LinkedListのheadだけを返せばいい
  nodes[0]
end

# LinkedListのheadだけを返すようにする
def merge_two_lists(list1, list2)
  result = ListNode.new

  if list1.nil? && list2.nil?
    result
  elsif list1.nil? && !list2.nil?
    # list2
    result.val = list2.val
    result.next = list2.next
    result
    # result(list2.val, list2.next)
  elsif list2.nil?
    # list1
    result.val = list1.val
    result.next = list1.next
    result
    # result(list1.val, list1.next)
  elsif list1.val <= list2.val
    next_node = list1.next
    list1.next = list2
    merge_two_lists(next_node, list2)
    # result = merge_two_lists(next_node, list2)
  else
    next_node = list2.next
    list2.next = list1
    merge_two_lists(list1, next_node)
    # result = merge_two_lists(list1, next_node)
  end
end
