require_relative 'stackable'

class ReversePolishNotation
  include Stackable

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
    lst.each do |s|
      case s
      when /\d+/
        push(s.to_i)
      when '+', '-', '*'
        first = pop
        second = pop
        case s
        when '+'
          push(first + second)
        when '-'
          push(second - first)
        when '*'
          push(first * second)
        end
      end
    end
    pop
  end
end
