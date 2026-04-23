##
# FIRST(E') = {+, e}
# FIRST(T') = {*, e}
# FIRST(F) = {(, id}
# FIRST(E) = FIRST(T) = FIRST(F) = {(, id}

require_relative 'syntax_stack'
require_relative 'stack_tracable'

class SimpleParser
  include StackTracable

  def read(str)
    # 整数か足し算・掛け算・カッコだけを読み取る
    # 空白や他の記号は読み飛ばす
    @lst = str.scan(/\d+|[+*()]/)
  end

  def parse
    _process
    _parse(@lst)
  end

  def _process
    # 末尾に文の終わりを示す$を付ける
    @lst << '$'
  end

  def _parse(lst)
    syntax_stack = SyntaxStack.new
    # non_terminal_map_for_debug = { expr: 'E', expr_rest: "E'", term: 'T', term_rest: "T'", factor: 'F' }
    non_terminal_lst = %i[expr expr_rest term term_rest factor]
    ip = 0
    output = []

    while syntax_stack.read != '$'
      if non_terminal_lst.include?(syntax_stack.read)
        # (DEBUG): Print Syntax stack and unprocessed lst
        stack_trace(syntax_stack, lst, ip)
        # (DEBUG): END
        syntax_stack.derive(syntax_stack.read, lst[ip])
      else
        output << syntax_stack.pop
        ip += 1
      end
    end

    output.each { |i| print i }
    puts
  end
end

parser = SimpleParser.new
parser.read("(1 + 2) * 3 + 4 * (5 + 6)")
parser.parse
