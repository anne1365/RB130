=begin
  problem - write program that finds all primes from 2 to a given number
    using the sieve of eratosthenes algorithm

  things needed 
  - class w/ initialize method that accepts one int argument
  - a primes method that returns an array of all prime numbers from 2 to given #

  questions
  - How does this algorithm work?
    - by creating an inclusive range from 2 - given limit
    - then repeating:
      - taking the next unmarked number in list (it's prime)
      - marking all muliples of that number )those aren't prime
    - this continues until every number has been iterated through
    - at the time of termination, all unmarked numbers are prime
  - How to constuct a data structure that simultaneously contains the
    range and their mark status?
      arr = []
      2.upto(10) { |i| arr << [i, false]}
      p arr

  - How to find all the multiples for each? 
      limit = 100
      multiples = []
      need_multiples_for = 2
      counter = 1
      result = 1

      while result <= limit
       result = need_multiples_for * counter
       multiples << result if result <= limit
       counter += 1 
      end

  - How to mark all the multiples for each number?
      arr = [[1, false], [2, false], [3, false], [4, false], [5, false]]
      to_mark = [2, 4]
      to_mark.each { |n| arr[n - 1][-1] = true }

  - How to iterate effieciently to the next unmarked number before repeating
    prior two processes?
      arr = [[2, true], [3, true], [4, false], [5, false]]

      arr.each do |el|
        next unless !el.last
        puts "Element #{el[0]}"
      end


  data structure - nested array or hash to hold number and marker
  for every number in range
=end

class Sieve
  attr_reader :limit

  def initialize(limit)
    @limit = limit
    @arr = []
    2.upto(limit) { |idx| arr << [idx, false]}
  end

  def primes
    2.upto(limit) do |idx|
      next unless unmarked?(idx)
      multiples = get_multiples(idx)
      mark_multiples(multiples)
    end

    get_primes
  end

  private

  attr_accessor :arr

  def get_multiples(mult_for)
    multiples = []
    counter = 2
    result = 1

    while result <= limit
      result = mult_for * counter
      multiples << result if result <= limit
      counter += 1
    end
  
    multiples
  end

  def mark_multiples(multiples)
    multiples.each { |el| arr[el - 2][-1] = true }
  end

  def unmarked?(num)
    arr[num - 2][-1] == false
  end

  def get_primes
    arr.select { |el| el.last == false }. map { |el| el[0] }
  end
end
