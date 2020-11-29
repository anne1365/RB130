=begin
INPUT - string representing an octal number
OUTPUT - integer (decimal number)

RULES: invalid input should result in 0 being returned (invalid means including
non-numeric chars or numbers 8 or 9)


ALGO
- use regex to filter out invalid inputs
- for each digit position, check if any numbers from 9-0 can be subtracted from
  the original # when multipled by 8 ** digit_position


=end

class Octal
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def to_decimal
    return 0 if invalid_input?

    num_copy = num.clone.to_i
    num_arr = num.to_i.digits.reverse
    decimal = 0
    index = 0

    (num_arr.size - 1).downto(0) do |power|
      temp = num_copy / 8 ** power
      p num_arr
      p temp
      p decimal += temp * 10 ** power
      p num_copy -= temp * 8 ** power
      index += 1

    end
    puts decimal
  end

  private

  def invalid_input?
    num.match?(/[a-z89]/i)
  end
end

n = Octal.new('155').to_decimal # should be 233

n = Octal.new('10').to_decimal # should be 8
# n = Octal.new('11').to_decimal # should be 8

































#THROWAWAY

# - initialize new str 
# - separate number into digits (will reverse # & form array)
# - each index value is the 'power'
# - each with index
# - starting from last index position, find the result of dividing the
#   input number by 8 raised to the power of the index - this should be the
#   decimal digit
# - convert this result to string and push into new string
# - after iterating through each index position, convert string to # and return



# octal.digits.reverse.each_with_index do |el, idx|
#   p el
#   p idx
#   p octal/8**idx
#   base_10 << (octal / 8 ** idx).to_s
#   #  



# base_10 = []
# octal = num.to_i.digits.reverse
# num_copy = num.clone.to_i

# (octal.size - 1).downto(0) do |power|
#   puts "Num copy = #{num_copy}"
#   puts "Octal = #{octal}"
#   puts "Power = #{power}"
#   puts "Base_10 = #{base_10}"
#   puts 
  
#   temp = num_copy / 8 ** power
#   base_10 << temp
#   num_copy -= 8 ** power * temp
  
#   puts "num_copy -= (8 ** power) * temp"
#   puts "#{num_copy} -= (8 ** #{power} * #{temp}"
#   puts
#   puts "Temp = num_copy / (8 ** power)"
#   puts "#{temp} = #{num_copy} / (8 ** #{power})"
#   puts "------------------------------------------------"
#   puts
# end

# p base_10.join.to_i



# base_10 = 0
# octal = num.to_i.digits.reverse
# num_copy = num.clone.to_i

# (octal.size - 1).downto(0) do |power|
#   puts "Num copy = #{num_copy}"
#   puts "Octal = #{octal}"
#   puts "Power = #{power}"
#   puts "Base_10 = #{base_10}"
#   puts 

#   0.upto(9) do |i|
#     puts "i = #{i}"
#     temp = i * 8 ** power
#     p num.to_i.digits[power] * 8 
#     if temp >= num.to_i.digits[power] * 8 && num_copy >= 8
#       base_10 += i * 10 ** power
#       num_copy -= temp

#       puts "Temp = #{temp}; num_copy = #{num_copy}; base_10 = #{base_10}"
#       puts " TEST #{(i + 1) * 8 ** power}"
#       break if (i + 1) * 8 ** power > num_copy
#     end
#   end

#   puts "Num copy = #{num_copy}"
#   puts "Octal = #{octal}"
#   puts "Power = #{power}"
#   puts "Base_10 = #{base_10}"
#   puts "------------------------"