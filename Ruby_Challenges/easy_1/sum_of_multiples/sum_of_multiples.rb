=begin
 PROBLEM:  write a program that, given a number (a limit) can find the sum
           of the multiples of particular numbers up to the limit
  INPUT:   an numeger or numegers - what we're calculating the multiples from
  OUTPUT:  an numeger - the sum of the multiples of the input number or numbers

  RULES:     
    - each multiple is only counted once - by extension multiples of
      multiple numbers are counted (only once)
    - set of multiples shouldn't include the limit

  QUESTIONS: 
    1. The number of inputs can vary, and the default number of inputs is two.
       A user may only input one number. How can this best be accounted for?

 ALGO:
  DEALING WITH INPUTS: 
   - can have any number of args by prefacing parameter in initialize
     method with *
  MULTIPLES:
   - for each input number, get the multiples by iterating from the input to
     to the limit and adding any numbers divisible by input to an array that's
     returned at the end
   - the arrays for each number will be added to a master array, which I'll
     flatten, remove duplicates from, and sum (then return)
   - for the class method I'll se the DEFAULT and do the same as ^

=end

class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers.empty? ? [3, 5] : numbers
  end

  def to(limit)
    (1...limit).select { |i| numbers.any? { |n| i % n == 0} }.sum
  end

  def self.to(limit) 
    self.new.to(limit)
  end

  private 

  attr_reader :numbers
end
