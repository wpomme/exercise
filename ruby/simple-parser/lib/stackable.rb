module Stackable
  def initialize
    @data = []
  end

  def push(element)
    @data << element
  end

  def pop
    @data.pop
  end

  def read
    @data.last
  end

  # デバッグ用にスタックを底から取り出す
  def __map_for_debug(&block)
    @data.map(&block)
  end
end
