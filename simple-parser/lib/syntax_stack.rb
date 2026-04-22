require_relative 'stackable'

# 動的な終端記号(id)はそのままスタックに入れない方がいい気がする
# スタックには"id"を入れておいて、別のところで動的な終端記号の処理を行いたい
# モジュールを使って整理した方がいいかも
class SyntaxStack
  include Stackable

  TERMINALS = { id: 'id', plus: '+', times: '*', lparen: '(', rparen: ')' }.freeze
  DERIVATION_MAP = {
    expr: {
      TERMINALS[:id] => %i[expr_rest term],
      TERMINALS[:lparen] => %i[expr_rest term]
    },
    expr_rest: {
      TERMINALS[:plus] => [:expr_rest, :term, TERMINALS[:plus]],
      TERMINALS[:rparen] => [],
      '$' => []
    },
    term: {
      TERMINALS[:id] => %i[term_rest factor],
      TERMINALS[:lparen] => %i[term_rest factor]
    },
    term_rest: {
      TERMINALS[:times] => [:term_rest, :factor, TERMINALS[:times]],
      TERMINALS[:plus] => [],
      TERMINALS[:rparen] => [],
      '$' => []
    },
    factor: {
      TERMINALS[:id] => ->(num) { [num] },
      TERMINALS[:lparen] => [TERMINALS[:rparen], :expr, TERMINALS[:lparen]]
    }
  }.freeze

  attr_reader :data

  def initialize
    super
    push('$')
    push(:expr)
  end

  def derive(non_term, input_symbol)
    pop
    push_derived(_derive(non_term, input_symbol))
  end

  def push_derived(lst)
    lst.each { |i| push i }
  end

  def _derive(non_term, input_symbol)
    return DERIVATION_MAP[non_term][TERMINALS[:id]].call(input_symbol) if /\d+/.match(input_symbol) && non_term == :factor

    return DERIVATION_MAP[non_term][TERMINALS[:id]] if /\d+/.match(input_symbol)

    DERIVATION_MAP[non_term][input_symbol]
  end
end
