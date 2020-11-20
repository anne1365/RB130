def each(arr)
  counter = 0
  
  until counter >= arr.length
    yield(arr[counter]) if block_given?
    counter += 1
  end
  
  arr
end

def each(arr)
  0.upto(arr.size - 1) {|idx| yield(arr[idx]) if block_given? }
  arr
end

p each([1, 2, 3]) { |el| puts el }
p each([1, 2, 3])
