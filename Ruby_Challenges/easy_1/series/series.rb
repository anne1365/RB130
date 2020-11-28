=begin
 input (slice method) - integer - size of slice
 output - nested array containing array slices of each consecutive 'slice' of the
 series number

 observations - 
 - Series is a class
 - instantiation of the class requires one argument, an integer
 - need to write a series#slice method that accepts an int and returns
   nested array
 - an argument error should be thrown if the int argument passed into
   series#slice is longet than the series number

   ideas: each_cons

   things I didn't consider jumping into this - every test needs to be scrutinized
   there are edge cases everywhere
=end

class Series
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def slices(size)
    raise ArgumentError, 'Slices must be shorter than the string!' if num.chars.size < size
    num.chars.each_cons(size).map { |n| n.map { |m| m.to_i }}.to_a
  end
end

# n = Series.new('012345')
# p n.slices(2)
