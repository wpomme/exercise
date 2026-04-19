## 
# FIRST(E') = {+, e}
# FIRST(T') = {*, e}
# FIRST(F) = {(, id}
# FIRST(E) = FIRST(T) = FIRST(F) = {(, id}

require_relative './stack.rb'

# 動的な終端記号(id)はそのままスタックに入れない方がいい気がする
# スタックには"id"を入れておいて、別のところで動的な終端記号の処理を行いたい
# モジュールを使って整理した方がいいかも
class SyntaxStack < Stack
  TERMINALS = {:id => 'id', :plus => '+', :times => '*', :lparen => '(', :rparen => ')'}
  DERIVATION_MAP = {
    :expr => {
      TERMINALS[:id] => [:expr_rest, :term],
      TERMINALS[:lparen] => [:expr_rest, :term],
    },
    :expr_rest => {
      TERMINALS[:plus] => [:expr_rest, :term, TERMINALS[:plus]],
      TERMINALS[:rparen] => [],
      '$' => [],
    },
    :term => {
      TERMINALS[:id] => [:term_rest, :factor],
      TERMINALS[:lparen] => [:term_rest, :factor],
    },
    :term_rest => {
      TERMINALS[:times] => [:term_rest, :factor, TERMINALS[:times]],
      TERMINALS[:plus] => [],
      TERMINALS[:rparen] => [],
      '$' => [],
    },
    :factor => {
      TERMINALS[:id] => ->(num) { return [num] },
      TERMINALS[:lparen] => [TERMINALS[:rparen], :expr, TERMINALS[:lparen]],
    },
  }

  attr_reader :data

  def initialize
    super
    @data.push('$')
    @data.push(:expr)
  end

  def derive(non_term, input_symbol)
    @data.pop
    self.push_derived(self._derive(non_term, input_symbol))
  end

  def push_derived lst
    lst.each{ |i| @data.push i }
  end

  def _derive(non_term, input_symbol)
    if /\d+/.match(input_symbol) && non_term == :factor
      return DERIVATION_MAP[non_term][TERMINALS[:id]].(input_symbol)
    end

    if /\d+/.match(input_symbol)
      return DERIVATION_MAP[non_term][TERMINALS[:id]]
    end

    return DERIVATION_MAP[non_term][input_symbol]
  end
end

class SimpleParser
  def read str
    # 整数か足し算・掛け算・カッコだけを読み取る
    # 空白や他の記号は読み飛ばす
    @lst = str.scan(/\d+|[\+\*\(\)]/)
  end

  def parse
    self._process
    self._parse(@lst)
  end

  def _process
    # 末尾に文の終わりを示す$を付ける
    @lst << '$'
  end

  def _parse lst
    stk = SyntaxStack.new()
    non_terminal_map_for_debug = {:expr => 'E', :expr_rest => "E'", :term => 'T', :term_rest => "T'", :factor => 'F'}
    non_terminal_lst = [:expr, :expr_rest, :term, :term_rest, :factor]
    ip = 0
    output = []

    while (stk.read != '$')
      unless (non_terminal_lst.include?(stk.read))
        output << stk.pop
        ip += 1
      else
        # (DEBUG): Print Syntax stack and unprocessed lst
        stk.data.reverse.each{ |i|
          if i == '$'
            print i
          else
            print non_terminal_map_for_debug[i]
          end
        }
        print "\t"
        lst.last(lst.length - ip).each{|i| print i.to_s}
        puts
        # (DEBUG): END
        stk.derive(stk.read, lst[ip])
      end
    end

    output.each{|i| print i.to_s}
    puts
  end
end

parser = SimpleParser.new
parser.read("(1 + 2) * 3 + 4 * (5 + 6)")
parser.parse
