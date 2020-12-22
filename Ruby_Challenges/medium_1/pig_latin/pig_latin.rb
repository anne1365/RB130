class PigLatin
  def initialize(str)
    @str = str
  end

  def self.translate(arg)
    new(arg).translate
  end

  def translate
    @str.split.each_with_object([]) do |word, arr|
      arr << to_pig_latin(word)
    end.join(' ')
  end

  private

  def to_pig_latin(word)
    return "#{word}ay" if word.start_with?(/[aeiou]|yt|xr/)
    word.start_with?(/\A[^aeiou]*qu/) ? qu_word(word) : consonant_word(word)
  end

  def qu_word(word)
    arr = word.chars
    qu =[arr[0..1], arr[0..2]].select { |a| a[-1] == 'u' }.flatten
    "#{(arr - qu).join}#{qu.join}ay"
  end

  def consonant_word(word)
    arr = word.chars
    consonants = arr.take_while { |l| l.match?(/[^aeiou]/) }
    arr.shift(consonants.length)
    "#{arr.join}#{consonants.join}ay"
  end
end
