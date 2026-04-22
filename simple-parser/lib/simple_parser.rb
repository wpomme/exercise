##
# FIRST(E') = {+, e}
# FIRST(T') = {*, e}
# FIRST(F) = {(, id}
# FIRST(E) = FIRST(T) = FIRST(F) = {(, id}

require_relative 'syntax_stack'

class SimpleParser
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
    stk = SyntaxStack.new
    non_terminal_map_for_debug = { expr: 'E', expr_rest: "E'", term: 'T', term_rest: "T'", factor: 'F' }
    non_terminal_lst = %i[expr expr_rest term term_rest factor]
    ip = 0
    output = []

    while stk.read != '$'
      if non_terminal_lst.include?(stk.read)
        # (DEBUG): Print Syntax stack and unprocessed lst
        stk.data.reverse.each do |i|
          if i == '$'
            print i
          else
            print non_terminal_map_for_debug[i]
          end
        end
        print "\t"
        lst.last(lst.length - ip).each { |i| print i }
        puts
        # (DEBUG): END
        stk.derive(stk.read, lst[ip])
      else
        output << stk.pop
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
