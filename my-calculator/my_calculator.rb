## 
# まずは、足し算と引き算と数値だけの場合
# 1) は 2)に変換できる
#
# 1)
# expr -> expr + term | expr - term | term
#
# 2)
# expr -> term rest
# rest -> + term rest
#         - term rest
#         e
# term -> 0-9
#
class Node
  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  attr_reader :value, :left, :right
end

class MyCalculator
  def read str
    # 整数か四則演算・カッコだけを読み取る
    # 空白や他の記号は読み飛ばす
    @lst = str.scan(/\d+|[\+\-\*\(\)]/)
  end

  def parse
    @node = self.expr(@lst)
  end

  private

  def preorder node
    p node.value
    preorder(node.left) if node.left.is_a?(Node)
    preorder(node.right) if node.right.is_a?(Node)
  end

  def inorder node
    # 逆ポーランド記法になる
    inorder(node.left) if node.left.is_a?(Node)
    p node.value
    inorder(node.right) if node.right.is_a?(Node)
  end

  def postorder node
    postorder(node.left) if node.left.is_a?(Node)
    postorder(node.right) if node.right.is_a?(Node)
    p node.value
  end

  def term num
    Node.new(num)
  end

  def expr(lst)
    Node.new(nil, self.term(lst.first), self.rest(lst.last(lst.length - 1)))
  end

  def rest(lst)
    case lst.first
      when '+'
        term = self.term(lst[1])
        rest = self.rest(lst.last(lst.length - 2))
        Node.new('+', term, rest)
      when '-'
        term = self.term(lst[1])
        rest = self.rest(lst.last(lst.length - 2))
        Node.new('-', term, rest)
      else
        []
    end
  end
end

str = "9-5+2"
calc = MyCalculator.new
calc.read(str)
parsed = calc.parse()
