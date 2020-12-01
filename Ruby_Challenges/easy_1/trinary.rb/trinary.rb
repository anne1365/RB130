=begin
  PROBLEM: convert a string trinary number into an integer decimal number
    INPUT: string - trinary number
    OUTPUT: integer - decimal number
    RULES: ***can't use any exiting method or library that can work with numerical systems***
=end

class Trinary
  BASE = 3 
  
  attr_reader :num

  def initialize num
    @num = num
  end

  def to_decimal
    return 0 if invalid_input?
    num.chars.reverse.map.with_index { |n, idx| n.to_i * BASE ** idx }.reduce(:+)
  end

  private

  def invalid_input?
    num.match? /\D|[a-z4-9]/i
  end
end
