require 'pry'

def tribonacci(signature, n)
  if n == 0
    signature = []
  elsif n < 3
    signature = signature[0..(n-1)]
  else until signature.size  == n do
      binding.pry
      sequence_next = signature[-3..-1].reduce(:+)
      signature.push(sequence_next)
    end
  end
  signature
end


# def tribonacci(s, n)
#     for i in 3..n
#       s[i] = s[i-1] + s[i-2] + s[i-3]
#     end
#     return s.slice(0, n)
#   end


# def tribonacci(signature,n)
#     n.times.map{signature << signature.inject(:+); signature.shift}
#   end

# def tribonacci(signature,n)
#     (n - 3).times { signature << signature[-3..-1].inject(:+) }
#     signature[0,n]
#   end

# def tribonacci(sig,n)
#     sig.fill(3, n-3) { |i| sig.take(i).last(3).reduce(:+) }.take(n)
#   end

# def tribonacci(signature,n)
#     (4..n).each { |i| signature << signature[-3..-1].reduce(:+) }
#     signature[0...n]
#   end

tribonacci([1,1,1],10)
tribonacci([0,0,1],10)
tribonacci([0,1,1],10)
tribonacci([1,0,0],10)
tribonacci([0,0,0],10)
tribonacci([1,2,3],10)
tribonacci([3,2,1],10)
tribonacci([1,1,1],1)