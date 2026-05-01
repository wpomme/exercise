class Node
  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def left?
    @left.is_a?(Node)
  end

  def right?
    @right.is_a?(Node)
  end

  attr_reader :value, :left, :right
end
