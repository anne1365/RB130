
number2 = Luhn.create(873_956)
puts "Number = #{number2}"
# p number2 == 8_739_567
puts "should be 8_739_567"
puts

number3 = Luhn.create(837_263_756)
puts "Number = #{number3}"
# p number3 == 8_372_637_564
puts "should be 8_372_637_564"
puts

number4 = Luhn.create(2323_2005_7766_355)
puts "Number = #{number4}"
puts "should be 2323_2005_7766_3554"
puts