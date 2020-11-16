# Integer#times

def times(integer, &block)
  counter = 0
  
  until counter == integer
    block.call(counter)
    counter += 1
  end
  
  counter
end


def times(integer)
  0.upto(integer-1) { |n| yield(n) }
  integer
end

puts times(5) { |n| puts n }

=begin
20
15
16
20
16
20
16
20
16
20
16
20
17
18
20
=end
