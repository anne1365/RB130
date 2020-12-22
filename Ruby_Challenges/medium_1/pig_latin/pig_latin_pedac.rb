=begin
PROBLEM: write program that trranslates a string word or words into pig latin
  INPUTS: string
  OUTPUTS: string
  
  QUESTIONS:
  - Does `String#start_with` accept a regex? YES

  IDEAS:
  - drop while a letter is a consonant -> add dropped letters to array
    -> append 'ay' after all words have been iterated through -> merge
    word & joined array
    EXCEPTIONS: 'qu', 'yt', 'xr'
    - 'qu' should always be kept together
    - 'yt' and 'xr' should be treated like vowels
  
  RULES:

TEST CASES: test file

DATA STRUCTURE: convert input string into array of words for each input
                constant for array of consonant sounds?

ALGORITHM:
- initialize `result` array to hold pig latin words
- split string into array of words
- push to result return value of passing each word to helper method
  that does pig latin translation
- return joined result array

  HELPER
  #translate(word) -> (pig latin word)
  - if word starts with vowel, 'yt' or 'xr' -> append 'ay' to end and return
  - if word doesn't start with vowel..
=end


str = 'scatter' # => 'atterscay'

arr = str.chars

consonants = arr.take_while { |l| l.match?(/[^aeiou]/) }
p arr
p consonants
p (arr - consonants).join + consonants.join + 'ay'

# -----------------------------

strings = ['early', 'air', 'camping', 'quill', 'opera', 'uncertainty', 'yttria', 'venezuela', 'xray', 'rainfall']
p strings.select { |w| w.start_with? /[aeiou]|yt|xr/ }
p strings.select { |w| w.start_with? /qu/ }

# -----------------------------

string = 'quill'.chars
qu = string.shift(2).join

p string.join + qu + 'ay'

