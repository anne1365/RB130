def my_method
  yield
end

p my_method { 5 } # => 5
p my_method { return 5 } # => LocalJump Error (unexpected return)
