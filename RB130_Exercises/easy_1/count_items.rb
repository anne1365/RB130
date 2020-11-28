=begin
 inputs - array & a block (that will return true or false)
 output - integer - the number of elements in the array for
          which the block returns true

 rules - can't use array or enumerable #count methods

 algorithm
 - initialize count variable, which will track # of elements
   that yield true block return value
 - iterate through the array, incrementing count each time the block's return value is true
 - return count (end the method)
=end

def count(arr, &block)
  counter = 0
  arr.each { |el| counter += 1 if block.call(el) }
  counter
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2