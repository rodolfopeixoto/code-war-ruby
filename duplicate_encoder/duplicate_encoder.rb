def duplicate_encode(word)
  word.upcase!
  splitted_word = word.split('')
  counts = Hash.new(0)
  splitted_word.each { |element| counts[element] += 1 }
  splitted_word.collect! { |index| counts[index] > 1 ? ')' : '(' }.join
end


duplicate_encode("din")
duplicate_encode("recede")
duplicate_encode("Success")
