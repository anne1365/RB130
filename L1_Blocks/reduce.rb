def all_strings?(arr)
  arr.all? { |el| el.to_s.to_i != el }
end

def all_integers?(arr)
  arr.all? { |el| el.to_s.to_i == el }
end

def reduce(arr, acc = 0)
  arr = arr.flatten
  return arr if !all_integers?(arr) && !all_strings?(arr)

  acc = '' if all_strings?(arr)
  arr.each { |num| acc = yield(acc, num) } if block_given?
  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
