=begin
CHALLENGE: Consider a character set consisting of letters,
a space, and a point. Words consist of one or more, but at
most 20 letters. An input text consists of one or more
words separated from each other by one or more spaces and
terminated by 0 or more spaces followed by a point. Input
should be read from, and including, the first letter of the
first word, up to and including the terminating point. The
output text is to be produced such that successive words
are separated by a single space with the last word being
terminated by a single point. Odd words are copied in
reverse order while even words are merely echoed. For
example, the input string:

"whats the matter with kansas" becomes 
"whats eht matter htiw kansas."

BONUS POINTS: each character must be read and printed one at
a time.

------------------------------------------------------------
PROBLEM: given a string containing letters, spaces, and a
point, return a copy of the string with 

  INPUT:  string (containing letters, spaces, and a point)
  OUTPUT: string with words separated by one space,
          terminated by a point

  QUESTIONS: 
  - What's the best way to iterate through each letter in
    the string only once?
  - How do we determine when a word starts and ends?
  - Is each_char.with_index a thing?
  - What should be done with words longer than 20 chars?
  - Should a new string object be returned or the original
    object?

  RULES:
  - iterate through each letter in the string one at a time
  - iterate through the string argument only once
  - each word should only bbe separated by one space
  - each string should be terminated with a point, whether
    or not the original string contained one

DATA STRUCTURE: new array object will hold each word

ALGO:
- initialize new array object `result` - this will hold the
  words (reversed or echoed) produced during iteration
  through the original string arg
- initialize `in_word` flag to false - this will help
  delineate between words
- initialize a counter `word_num` to keep track of what word
  # we're on
  (to det. even words or odd ones)

- iterate through each letter in the string
  - initialize variable `tmp` to hold chars from word
    being iterated through

  - if the current char is [a-z]\i and previous char was a
    space or index is 0
    - set in_word flag to true
    - reassign tmp to that char
    - increment `word_num_`

  - if the current char is [a-z]\i and previous char was
    [a-z]\i
    - append to `tmp` if word_num even
    - prepend if odd

  - if current char is [a-z]\i and next is a space
    - push tmp to result
    - set in_word flag to false

  - if current char is a space and the next is a space
    - next

  - if next char is a period or next char is nil, append
    period to string and break
  


   --- OR ---

  initialize result array - empty
  initialize word_num counter to 0

  iterate through each char in string arg with index
   
    if current char is a period or next char is nil
      push period to result
      break (if necessary)

    if current character is a letter
      check if tmp empty if so increment word_num
      push char to tmp if word num even, prepend if odd

    if current char is a space
      push tmp to result
      reassign tmp to empty str

  join result with single space

------------------------------------------------------------
=end

class OddWords
  #   def self.parse(str)
#     result = []
#     word_num = -1
#     tmp = ''
    
#     str.each_char.with_index do |char, idx|
#       if char == '.' || str[idx + 1].nil?
#         tmp << char if char == '.'

#         result << tmp
#       elsif char == ' ' || str[idx + 1] == '.'
#         result << tmp if !tmp.empty?
#         tmp = ''
#       elsif char.match?(/[a-z]/i)
#         word_num += 1 if tmp.empty?
#         word_num.even? ? tmp << char : tmp.prepend(char)
#       else
#         next
#       end
#     end

#     result.join(' ')
#   end

# since apparently it's totally fine to 
    def self.parse(arg)
      return arg if arg.empty?
      str = arg.strip.gsub(/[^\w\s]/i, '')
      str.split.map.with_index{ |e, i| i.odd? ? e.reverse! : e }.join(' ') + '.'
    end
end



p OddWords.parse("what's the matter with kansas")
p OddWords.parse("my cat's name is sherlock")
p OddWords.parse("hello        friends")

