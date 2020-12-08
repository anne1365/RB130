=begin
  PROBLEM: given a phrase, program should output occurences of each word in the
  phrase
    
    INPUT:  string
    OUTPUT: a hash in which they keys are (lowercase) words appearing in phrase,
            and values are # of occurences
    
    QUESTIONS: 
    - How to split words up while disregarding punctuation and case?
      clean_str = str.downcase.scan(/[ a-z0-9']/i).join
    - How to match quoted words?
      str.scan(/(')([a-z0-9]+)(')/i)
    - How to remove qutations for count?
      str.scan(/(')([a-z0-9]+)(')/i).join[1..-2]
    - ^^ Doesn't account for multiple quoted words
      need to see if a string starts or ends with single quote, and remove that

    RULES:
    - algo needs to count words without regard for puncutation
    - algo counts words case insensitively
    - algo must count words with apostrophes without removing apostrophes
    - algo must count words between single quotes without accounting for 
      single quotes
    - algo must count numbers too

  DATA STRUCTURE: will work with downcased, filtered string split into array
  to yield hash

  ALGO:
   COUNT WORDS METHOD:
   - initialize hash `counts` - will hold counts of words
   - filter string with helper method
   - iterate through filtered string array using each
      - if word is present as key in hash, increment count
      - if not, add word and set count to 1

   CLEAN STRING (HELPER)
   - use regex to remove unnecessary punctuation
   - scan string for words within single quotes
   - if present, iterate through string array using map, and if a word starts 
     or ends with single quote, remove it (or them)
=end

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    counts = {}    
    clean_phrase.each { |word| counts.keys.include?(word) ? counts[word] += 1 : counts[word] = 1 }
    counts
  end

  private

  attr_reader :phrase

  def clean_phrase
    str = string.scan(/(?<Token>[\w\d](?:[^,\s]*[\w\d])?)/).flatten.compact
  end
end





# def clean_phrase(phrase)
#   str = phrase.downcase.split(/[^a-z0-9']/).join(' ').scan(/[ a-z0-9']/i).join.split
#   str.map { |word| word.match?(/(')([a-z0-9]+)(')/i) ? word[1..-2] : word }
# end

# # p clean_phrase("Sherlock didn't know his 4th mouse' mouse' wasn't real.")
# # p 'one,two,three'.split(/[, ]/)
# # p "one,\ntwo,\nthree".split(/[^a-z0-9]/)
# # p "one two three".split(/[^a-z0-9]/)
# # p "cat".scan(/[c[^ac]]/)
# # p "cat".scan(/[t]&[^ca]/)
# # p string.downcase.scan(/(\s[\d\w]\s)|([\w\d]+[']?[\w\d]+)/).flatten.compact.map{|el| el.scan(/[^\n]/).join}


# string = "This, 1, my friend,isn't\na 'stringy' string!"
# p result = string.scan(/(?<Token>[\w\d](?:[^,\s]*[\w\d])?)/)
# p result.flatten.compact