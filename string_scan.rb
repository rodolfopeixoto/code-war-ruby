def solution(string)
  (string + '_').scan(/../)
end

solution('abc')
solution('abcdfe')