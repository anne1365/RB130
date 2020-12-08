=begin
 PROBLEM: write a method that converts an integer into roman numeral (string)
  INPUT:  integer
  OUTPUT: string
  
  QUESTIONS: 
  - how do I write this methodis such a way than an integer can invoke it (by writing it
    within the integer class even if it feels wrong - I wonder if there's a better way)
  - how do I account for the subtraction rule?
  
  RULES:
  I -> 1
  V -> 5
  X -> 10
  L -> 50
  C -> 100
  D -> 500
  M -> 1000

  - No need to be able to convert numbers above 3000

  DATA STRUCTURE:
  - hash used as dictionary for roman numerals & decimal #s they corr. to
  - array for appending numeral chunks (for each digit)

  ALGO:
  - initialize new array `numerals` to hold chunks of numerals (1 chunk/arg digit)
  - invoke digits method on receiver - reverses number & forms array so digit place (digit*10^x)
    can be accounted for and digits dealt with one by one
  - iterate through each digit with index
    - initialize target variable & assign it to digit * 10^index
    - determine next largest possible roman numeral
      - initialize `numeral` var -> will hold string numeral
      - is target less than 10^index-1 away from that roman numeral?
      - if yes, numeral is next largest numeral prepended by numeral == 10*index^index-1 --> y
      - if no, numeral is next smallest appended by 10*index-1 * x where x = (target - y)/10*index-1  
      - append string numeral to array
  - reverse `numerals` array & join it into a single string (returned)
=end

class Integer
  ROMAN_NUMERALS = { I: 1, V: 5, X: 10, L: 50, C: 100, D: 500, M: 1000 }

  def to_roman
    numerals = []
    digits   = self.digits

    digits.each_with_index do |dig, idx|
      next if dig == 0
      numeral        = ''
      target         = dig * 10 ** idx
      next_largest   = ROMAN_NUMERALS.values.select { |val| val >= target} .first
      next_smallest  = ROMAN_NUMERALS.values.select { |val| val < target}.last
      magnitude_less = ROMAN_NUMERALS.values.select { |val| val == 1 * (10 ** idx) }.first

      if (next_largest != nil) && (next_largest - target <= 1 * 10 ** idx)
        numeral << ROMAN_NUMERALS.key(magnitude_less).to_s * ((next_largest - target) / magnitude_less)
        numeral << ROMAN_NUMERALS.key(next_largest).to_s
      else
        numeral << ROMAN_NUMERALS.key(next_smallest).to_s
        target  -= next_smallest
        numeral << ROMAN_NUMERALS.key(magnitude_less).to_s * (target / magnitude_less)
      end

      numerals << numeral
    end
    
    numerals.reverse.join
  end
end
