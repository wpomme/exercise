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
require_relative 'node'

class MyCalculator
  attr_reader :preorder_values, :inorder_values, :postorder_values

  def initialize
    @preorder_values = []
    @inorder_values = []
    @postorder_values = []
  end

  def read(str)
    # 整数か四則演算・カッコだけを読み取る
    # 空白や他の記号は読み飛ばす
    @lst = str.scan(/\d+|[+\-*()]/)
  end

  def parse
    @node = expr(@lst)
  end

  def preorder
    _preorder(@node)
  end

  def inorder
    _inorder(@node)
  end

  def postorder
    _postorder(@node)
  end

  private

  def _preorder(node)
    @preorder_values << node.value
    _preorder(node.left) if node.left?
    _preorder(node.right) if node.right?
  end

  def _inorder(node)
    _inorder(node.left) if node.left?
    @inorder_values << node.value
    _inorder(node.right) if node.right?
  end

  def _postorder(node)
    _postorder(node.left) if node.left?
    _postorder(node.right) if node.right?
    @postorder_values << node.value
  end

  def term(num)
    Node.new(num)
  end

  def expr(lst)
    Node.new(nil, term(lst.first), rest(lst.last(lst.length - 1)))
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
