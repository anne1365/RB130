=begin
PROBLEM: given a target_word (string) and an array, return the element or
         elements of the array that are anagrams of the target_word

  INPUT: string
  OUTPUT: array
  RULES:
   - letters within argument target_word cannot be reused to form anagram
   - if there are no anagrams an empty array should be returned
   - if an array element contains extra letters that don't appear in
     argument, the element isn't an anagram

  QUESTIONS:
   - What's the best way to keep from sorting through every string in the array and comparing it to the arg?
     What preliminary filters could be used to increase effieciency?

DATA STRUCTURE: array of strings

ALGORITHM:
- initialize new empty array to hold anagrams
- select - for each contender, downcase, divide into chars, sort, and determine whether equivalent to dividing and sorting main target_word
    - if so, add to anagrams array
- return anagrams array
=end

class Anagram
  def initialize(target_word)
    @target_word = target_word
  end

  def match(arr)
    arr.select { |word| same_characters?(word) && different_words?(word) }
  end

  private

  attr_reader :target_word

  def same_characters?(word)
    word.downcase.chars.sort == target_word.downcase.chars.sort
  end

  def different_words?(word)
    target_word.downcase != word.downcase
  end
end
