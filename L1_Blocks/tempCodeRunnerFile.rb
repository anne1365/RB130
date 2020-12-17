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