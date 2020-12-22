def step(start, finish, step)
  values = [start]
  counter = start
  
  until counter > finish
    yield(counter)
    counter += step
    values << counter
  end

  values
end


step(1, 10, 3) { |value| puts "value = #{value}" }
