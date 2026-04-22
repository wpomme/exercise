class NamingConventionsConverter
  def camel_to_kebab(str)
    str.gsub(/([A-Z])/, '-\1').downcase
  end

  def camel_to_pascal(str)
    # warning: literal string will be frozen in the future (run with --debug-frozen-string-literal for more information)
    str.slice!(0).upcase + str
  end

  def kebab_to_pascal(str)
    str.split("-").map(&:capitalize).join
  end

  def kebab_to_camel(str)
    str.gsub(/-([a-z])/) { ::Regexp.last_match(1).upcase }
  end
end
