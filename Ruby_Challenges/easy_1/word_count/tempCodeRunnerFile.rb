


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