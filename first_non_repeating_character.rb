#Instructions
# Write a function named first_non_repeating_letter that takes a string input, and returns the first character that is not repeated anywhere in the string.

# For example, if given the input 'stress', the function should return 't', since the letter t only occurs once in the string, and occurs first in the string.

# As an added challenge, upper- and lowercase letters are considered the same character, but the function should return the correct case for the initial letter. For example, the input 'sTreSS' should return 'T'.

# If a string contains all repeating characters, it should return an empty string ("") or None -- see sample tests.

def  first_non_repeating_letter(s) 
    s.each_char do |char|
      return char if s.downcase.count(char.downcase) == 1
    end
    ""
end

string = "moonmenz"
print first_non_repeating_letter('moonmenz')

#   Test.describe('#first_non_repeating_letter') do
#     it('should handle first non repeating letter') do
#       Test.assert_equals(first_non_repeating_letter('a'), 'a')
#       Test.assert_equals(first_non_repeating_letter('stress'), 't')
#       Test.assert_equals(first_non_repeating_letter('moonmen'), 'e')
#     end
#     it('should handle empty strings') do
#       Test.assert_equals(first_non_repeating_letter(''), '')
#     end
#   end




#BEST
