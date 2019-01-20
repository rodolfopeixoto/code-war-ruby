def duplicate_encode(word)
  word_downcase = word.downcase
  word_downcase
   .chars
    .map { |char| word_downcase.count(char) > 1 ? letter = ')' : letter = '(' }
    .join
end


puts duplicate_encode("din")
puts duplicate_encode("recede")
puts duplicate_encode("Success")
