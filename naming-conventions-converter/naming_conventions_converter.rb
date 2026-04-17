#! /usr/bin/env ruby

class NamingConventionsConverter
  def camel_to_kebab str
    str.gsub(/([A-Z])/, '-\1').downcase
  end

  def camel_to_pascal str
    str.slice!(0).upcase + str
  end

  def kebab_to_pascal str
    str.split("-").map{|s| s.capitalize}.join("")
  end

  def kebab_to_camel str
    str.gsub(/\-([a-z])/) { $1.upcase }
  end
end
