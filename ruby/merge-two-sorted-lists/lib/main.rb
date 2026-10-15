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

def traverse_link_aux(head, arr)
  return if head.nil?

  arr << head.val
  traverse_link_aux(head.next, arr)
  arr
end

def traverse_link(head)
  traverse_link_aux(head, [])
end

def aux(list1, list2, head)
  if !list1.nil? && !list2.nil?
    if list1.val <= list2.val
      next_node = list1.next
      list1.next = list2
      return aux(next_node, list2, list1) if head.nil?

      aux(next_node, list2, head)
    else
      next_node = list2.next
      list2.next = list1

      return aux(list1, next_node, list2) if head.nil?

      aux(list1, next_node, head)
    end
  else
    unless list1.nil?
      return [list1, list1] if head.nil?

      [list1, head]
    end
    unless list2.nil?
      return [list2, list2] if head.nil?

      [list2, head]
    end

    result = ListNode.new
    return [result, head] if head.nil?

    [result, head]
  end
end

def merge_two_lists(list1, list2)
  _, head = aux(list1, list2, nil)
  head
end
