require_relative 'stack'

class ReversePolishNotation
  def read(str)
    # 整数か四則演算に関する記号だけを読み取る
    # 空白や他の記号は読み飛ばす
    @lst = str.scan(/\d+|[+\-*]/)
  end

  def calc
    _calc(@lst)
  end

  private

  def _calc(lst)
    stk = Stack.new
    lst.each do |s|
      case s
      when /\d+/
        stk.push(s.to_i)
      when '+', '-', '*'
        first = stk.pop
        second = stk.pop
        case s
        when '+'
          stk.push(first + second)
        when '-'
          stk.push(second - first)
        when '*'
          stk.push(first * second)
        end
      end
    end
    stk.pop
  end
end
