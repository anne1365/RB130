=begin
  problem - making an #any? method

  inputs - for our purposes an array and a block
  output - true if any return value from the block is truthy, false if none are

  rules: block should return true as soon as a truthy element is encountered
         an empty array should return false regardless of the block's definition
         can't use standard methods #any? #all? #none? or #one?

  thoughts: what's the most efficient way to evaluate truthiness?

  algorithm:
  - return false if block is empty
  - iterate through each element in array
  - preface call to block with !! to check for truthiness
  - return true the first time the block returns true
  - if all elements have been iterated through and non have been true, return false
=end

def any?(arr, &block)
  arr.each { |el| return true if block.call(el) }
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
