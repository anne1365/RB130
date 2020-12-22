hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash# == { 1 => 3, 3 => 6, 6 => 10 }