def  first_non_repeating_letter(s) 
    s.each_char do |char|
      return char if s.downcase.count(char.downcase) == 1
    end
    ""
end

string = "moonmenz"
print first_non_repeating_letter('moonmenz')