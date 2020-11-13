def hello
  "hello!"
end

# hello ("hi")        # => this is an error - the hello method doesn't expect a parameter
hello { puts 'hi' } # => "hello!" - in Ruby, every method can take an optional block as
                    #     an implicit parameter


def yielding
  yield
  puts "Inside the yielding method!"
end

yielding { puts "Inside the block - we've yielded!"}

# => Inside the block - we've yielded!
# => Inside the yielding method!

yielding("hello") { puts "Inside the block - we've yielded!"} # => ArgumentError
