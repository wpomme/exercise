words = ("a".."c")
words.each do |str1|
  words.each do |str2|
    words.each do |str3|
      puts str1 + str2 + str3
    end
  end
end
