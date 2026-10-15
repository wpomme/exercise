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

def traverse_link(head)
  traverse_link_aux = lambda do |head, arr|
    return if head.nil?

    arr << head.val
    traverse_link_aux.call(head.next, arr)
    arr
  end

  traverse_link_aux.call(head, [])
end

def reverse_between(head, left, right)
  swap = lambda do |head|
    first = head
    last = head.next

    last.next = first.next
    first.next = nil

    last
  end

  traverse_lists = lambda do |head, left, right|
    c_node = head
    i = 1

    while i < left - 1
      c_node = c_node.next
      i += 1
    end
    # left == 1のとき、左側の直前のNodeはない
    lb_node = ListNode.new if left == 1
    lb_node = c_node if left > 1

    l_node = c_node = c_node.next
    i += 1

    while i < right - 1
      c_node = c_node.next
      i += 1
    end
    rb_node = l_node if right - left == 1
    rb_node = c_node if right - left > 1

    r_node = c_node if c_node.next.nil?
    r_node = c_node.next unless c_node.next.nil?

    [lb_node, l_node, rb_node, r_node]
  end

  return head if right == 1 || left == right

  return swap.call(head) if right == 2 && left == 1

  lb_node, l_node, rb_node, r_node = traverse_lists.call(head, left, right)

  tmp_node = ListNode.new

  tmp_node.next = r_node.next

  r_node.next = l_node.next
  l_node.next = tmp_node.next

  tmp_node.next = rb_node.next

  rb_node.next = l_node
  lb_node.next = tmp_node.next

  lb_node
end
