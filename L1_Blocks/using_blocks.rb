p ['a', 'b', 'c'].map { |letter| letter.next }

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.what_am_i
    puts "I'm the Cat class!"
  end

  def shout_name
    puts name.upcase + '!'
  end
end

sherlock = Cat.new("Sherlock")
sherlock.shout_name
Cat.what_am_i