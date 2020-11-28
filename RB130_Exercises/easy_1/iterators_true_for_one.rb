def one?(arr, &block)
  count = 0

  arr.each do |el| 
    count += 1 if block.call(el) 
    return false if count > 1
  end

  count == 1 ? true : false
end

p one?([1, 3, 5, 6]) { |value| value.even? }   == true
p one?([1, 3, 5, 7]) { |value| value.odd? }    == false
p one?([2, 4, 6, 8]) { |value| value.even? }   == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 }== true
p one?([1, 3, 5, 7]) { |value| true }          == false
p one?([1, 3, 5, 7]) { |value| false }         == false
p one?([]) { |value| true }                    == false