# frozen_string_literal: true

class ValidParenthesis
  def self.execute?(str)
    stack = []

    str.each_char do |char|
      if ['(', '[', '{'].include?(char)
        stack.push char
      else
        poped = stack.pop

        return false if char == ')' && poped != '('
        return false if char == ']' && poped != '['
        return false if char == '}' && poped != '{'
      end
    end

    return true if stack.empty?

    false
  end
end
