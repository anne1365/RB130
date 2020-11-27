=begin
  problem: given a positive integer, return an array including (in no specific
    order) all divisors 

  input: positive integer
  output: array of that intger's divisors

  thoughts: 
  - 1 and the number itself are always divisors
  - beyond that the rang of possibilities is between 2 and half the number
  algorithm: 
  - initialize a new array
  - either before or after, add 1 and the argument to the array
  - iterate from 2 to half the number (inclusive)
  - if the argument is divisible by that number, push it to the new array
  - return the new array (I'll sort it because that's how it is in the examples)
  - THIS IS NOT AN EFFICIENT SOLUTION - not sure off the top of my head how to optimize 
=end

def divisors(n)
  arr = []
  1.upto(Math.sqrt(n)) { |i| (arr << i << n / i) if (n % i == 0) }
  arr.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# LS SOLUTION
def divisors(n)
  1.upto(n). select { |i| n % i == 0 }
end