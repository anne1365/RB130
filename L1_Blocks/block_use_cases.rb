# Sandwich code - tracking state in a before and after kind of way - i.e. the time_it method below.

def all_substrings(str)
  arr = []

  str.split.each do |word|
    left_index = 0
    
    until left_index > word.length
      right_index = left_index + 1

      until right_index > word.length
        arr << word.slice(left_index...right_index)
        right_index += 1
      end

      left_index += 1
    end
  end

  arr.sort_by { |word| word.length } .map { |word| word.downcase } .uniq
end

def time_it
  time_before = Time.now
  yield
  time_after = Time.now

  puts "It took #{time_after - time_before} seconds."
end

time_it { all_substrings("I once lived in a bungalow in Mississippi with my alligator Timothy and my three cats. One day we all took a ferry to New Orleans to attend a Mardi Gras parade. It was a great  time, except Timothy had a few too many churros and was really bloated on the way home.") }
time_it { sleep(5) }