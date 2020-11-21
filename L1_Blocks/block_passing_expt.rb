# THIS WORKS
def say(words)
  yield if block_given?
  puts "> " + words
end

say("hi there") do
  system 'cls'
end

# THIS DOESN'T
def say(words)
  yield if block_given?
  puts "> " + words
end

say("hi there")

do
  system 'cls'
end


# does a block have to be preceded by method invocation?



def words
  yield('these')
end

words do |word1, word2|
  puts "WORDS: #{word1} #{word2}"
end

# WORDS: these
# => nil



def compare(str)
  puts "Before: #{str}"
  puts "After: #{yield(str)}" if block_given?
end

compare('hi') { |word| word.upcase }