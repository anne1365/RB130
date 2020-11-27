=begin
PROBLEM: Write a method that accepts an optional block. If a block is
passed in it should be executed and return the block's return value.
If no block is passed in the method should return 'Does not compute.'

input - block or no block
output - the block's return value of 'Does not compute.'
=end

def compute
  block_given? ? yield : "Does not compute."
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# -- FE
def compute(arg)
  block_given? ? yield(arg) : "Does not compute."
end

p compute(4) { |a| a + 10 } == 14
p compute("hello") == "Does not compute."
p compute([1, 2, 3]) { |a| a.first } == 1 