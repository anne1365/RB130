# =begin
# INPUT - string representing an octal number
# OUTPUT - integer (decimal number)

# RULES: invalid input should result in 0 being returned (invalid means including
# non-numeric chars or numbers 8 or 9)

# ALGO
# - use regex to filter out invalid inputs
# add each digit * 8 * power to varaible that holds decimal # to return
# =end

class Octal
  BASE = 8

  attr_reader :num

  def initialize num
    @num = num
  end

  def to_decimal
    return 0 if invalid_input?
    
    decimal = 0
    num.to_i.digits.each_with_index { |n, idx| decimal += n * BASE ** idx }
    decimal
  end

  private

  def invalid_input?
    num.match? /\D|[8-9]/
  end
end
