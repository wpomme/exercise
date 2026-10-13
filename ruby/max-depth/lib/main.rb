# frozen_string_literal: true

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class BinaryTree
  def self.from_array(arr)
    size = arr.size
    nodes = (1..size).map { |_| nil }

    arr.reverse_each.with_index do |v, i|
      next if v.nil?

      tree_node = TreeNode.new(v)

      index = size - i - 1
      left_index = 2 * index
      right_index = left_index + 1

      nodes[index] = tree_node

      tree_node.left = nodes[left_index] if left_index <= size && !nodes[left_index].nil?
      tree_node.right = nodes[right_index] if right_index <= size && !nodes[right_index].nil?
    end

    # TreeのRootだけを返せばいい
    nodes[0]
  end
end

# def max_depth(root)
#   counter = 0
#
#   def max_depth_aux(root, counter)
#     next_counter = counter + 1
#
#     left_counter = max_depth_aux(root.left, next_counter) unless root.left.nil?
#     right_counter = max_depth_aux(root.right, next_counter) unless root.right.nil?
#
#     [left_counter, right_counter, counter].max
#   end
#
#   max_depth_aux(root, 0)
# end
