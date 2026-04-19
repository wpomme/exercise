class JsonParser
  def match_number str
    regex = /
      (\-)?                     # Sign
      (\d+)                     # Integer
      (?:\.(\d*))?              # Fraction
      (?:[E|e]([\-|\+]?\d+))?   # Exponent
    /x
    regex.match(str)
  end
end

