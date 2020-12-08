class Scrabble
  SCORES = {
    1  => %w(A E I O U L N R S T),
    2  => %w(D G),
    3  => %w(B C M P),
    4  => %w(F H V W Y),
    5  => %w(K),
    8  => %w(J X),
    10 => %w(Q Z)
  }

  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.nil? || !@word.match?(/[a-z]/i)
    @word.upcase.chars.map { |l| SCORES.select { |_, v| v.include? l } .keys.first } .sum
  end

  def self.score(word)
    self.new(word).score
  end
end
