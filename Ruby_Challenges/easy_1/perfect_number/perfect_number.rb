=begin
 PROBLEM: given an integer, return a string describing the
          classification of the # per Nicomachus's scheme
          Perfect   # -> factors of # (excluding #) == #
          Abundant  # -> factors of # (excluding #) > #
          Deficient # -> factors of # (excluding #) < #
  
  INPUT:  integer
  OUTPUT: string
  
  RULES:  only positive numbers are valid

 DATA STRUCTURE:
 - will collect factors of each number in array
 
 ALGO:
 - initialize array `factors` to hold factors of each number passed to
   classify method
 - iterate from 1..# (exclusive) and check whether # is divisible by the
   number in the current iteration
   - if so, add to `factors` array
 - sum factors array
 - case statement
   - if sum of factors is
     == # --> return 'perfect'
     >  # --> return 'abundant'
     <  # --> return 'deficient'
=end

class PerfectNumber
  def self.classify(num)
    raise StandardError.new if num < 1

    factors_sum = (1...num).to_a.select { |n| num % n == 0 } .sum    
    return "perfect" if factors_sum == num
    factors_sum > num ? 'abundant' : 'deficient'
  end
end

