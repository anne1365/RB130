class Array
  def initialize(arr)
    @arr = arr
  end

  def self.zip(arr2)
    result = []
    @arr.each_with_index do |el, idx|
      result << [el, arr2[idx]]
    end
    result
  end
end

p [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]


def zip(arr, arr2)
  result = []
  arr.each_with_index do |el, idx|
    result << [el, arr2[idx]]
  end
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]