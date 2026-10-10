# frozen_string_literal: true

class ValidParenthesis
  def self.execute?(str)
    p_hash = {
      '(' => ')',
      '[' => ']',
      '{' => '}'
    }
    rparen = p_hash.keys.to_set
    stack = []

    str.each_char do |char|
      if rparen.include?(char)
        stack.push char
      else
        poped = stack.pop

        return false if p_hash[poped] != char
      end
    end

    return true if stack.empty?

    false
  end
end
