name = "Anne"
EYES = 2

def get_number
  (1..100).to_a.sample
end

block = Proc.new { puts "hi #{name}, you have #{EYES} eyes, and your lucky number is #{get_number}." }
name = "Max"

def call_the_block(block)
  block.call
end

call_the_block(block) # => hi Max
