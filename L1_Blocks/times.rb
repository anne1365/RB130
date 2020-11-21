# Integer#times

def times(integer)
  counter = 0
  
  until counter == integer
    yield(counter) if block_given?
    counter += 1
  end
  
  counter
end


# def times(integer)
#   0.upto(integer-1) { |n| yield(n) if block_given? }
#   integer
# end

times(5) { |n| puts n }

=begin
Order of implementation by line number:
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
