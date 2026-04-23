# StackTracable: DEBUG for Printing Syntax stack and unprocessed list
# syntax_stackが引数になることが前提となってしまっている
module StackTracable
  def stack_trace(syntax_stack, lst, ip)
    stack_trace_map = { expr: 'E', expr_rest: "E'", term: 'T', term_rest: "T'", factor: 'F', '$' => '$' }

    # スタックを底から読んでいるので変えたい
    syntax_stack.data.reverse.each do |i|
      print stack_trace_map[i]
    end

    print "\t"

    lst.last(lst.length - ip).each { |i| print i }
    puts
  end
end
