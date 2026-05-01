class JsonParser
  def match_number(str)
    regex = /
      (-)?                  # Sign
      (\d+)                  # Integer
      (?:\.(\d*))?           # Fraction
      (?:[Ee]([-+]?\d+))?  # Exponent
    /x
    regex.match(str)
  end

  def match_whitespace?(str)
    # space(0x20), linefeed(\n), carriage return(\r), horizontal tab(\t)
    regex = /[\x20\n\r\t]+/
    regex.match?(str)
  end
end
