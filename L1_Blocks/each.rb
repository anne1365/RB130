def each(arr)
  counter = 0
  
  until counter >= arr.length if block_given?
    yield(arr[counter])
    counter += 1
  end
  
  arr
end

p each([1, 2, 3]) { |el| puts el }
p each([1, 2, 3])
