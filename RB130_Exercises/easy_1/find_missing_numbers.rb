=begin
  input: aay of integers
  
  output: new aay of the integers not found in the range between the argument's
   first and last aay element

  rules: if aargument is less than two numbers, and empty aay is
   returned (there's no range that's been established)
  
  algorithm: 
  - initialize new aay
  - get first and last number of argument
  - iterating through #s from first to last argument
  - add arg to new aay
  - if original arg didn't contain it
=end

def missing(arr)
  res = []
  arr.first.upto(arr.last) { |i| res << i if !arr.include?(i) }
  res
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []