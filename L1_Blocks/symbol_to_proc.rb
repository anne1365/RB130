[1, 2, 3, 4, 5].map do |num|
  num.to_s
end

# => ["1", "2", "3", "4", "5"]

#SHORTCUT
[1, 2, 3, 4, 5].map(&:to_s)



p [2, 3, 5].inject(1, &:+)

# p [2, 3, 5].inject(1) { |total, num| num + num }

# p [2, 3, 5].inject { |total, num| total + num }

# p [2, 3, 5].inject { |total, num| num + num }

p [2, 3, 5].inject(1) { |total, num| p total + num }