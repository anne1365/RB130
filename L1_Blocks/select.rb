def select(arr)
  filtered_arr = []
  arr.each { |el| filtered_arr << el if yield(el) } if block_given?
  filtered_arr
end

p select([1, 2, 3, 4, 5]) { |el| el.odd? }
p select([1, 2, 3, 4, 5]) { |el| puts el }
p select([1, 2, 3, 4, 5]) { |el| el + 11 }
