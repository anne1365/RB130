=begin
  PROBLEM: write a program that can generate the lyrics of 99 bottles of beer.
    METHODS --
     Verses(#,#)   --> plays song from verse # to verse # 
                       (second arg should be less than first)
     Lyrics        --> plays whole song (verses(99,0))
     Verse(#)      --> play that one verse (verses(#,#))

    OUTPUT: the lyrics as a string terminated with \n

    QUESTIONS: 
    - Is there any formatting to consider?
       --> verses end in new lines \n
    - How should invalid inputs be handled? (numbers > 99 or < 0, other data types)
    - How should invalid arguments be treated? (verses(4, 5))

    RULES:
    - 2 bottles - account for singular remaining beer
    - 1 bottle  - account for singular remaining beer & lack of beer after taking it down
    - 0 bottles - account for total lack of beer & course of remedial action

  EXAMPLES/TEST CASES: test file

  DATA STRUCTURE: case statement within loop

  ALGO:
  - initialize three string variables to hold depending on #bottles on wall
    - `more_than_two` - bottles > 2
    - 'two'           - bottles = 2
    - 'one'           - bottles = 1
    - 'zero'          - no bottles

  - lyrics - call verses(99, 0)
  - verse(num) - call verses(num, num - 1)
  - verses(first, last)
    - from first to last, print proper verse
=end

class BeerSong
  def lyrics
    verses(99, 0)
  end

  def verse(num)
    verses(num, num)
  end

  def verses(first, last)
    song = []
    first.downto(last) { |num| song << get_lyric(num)}
    song.join("\n")
  end

  private 

  def get_lyric(num)
    return "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
    "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n" if num > 2 

    case num
    when 2 then "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
    "Take one down and pass it around, #{num - 1} bottle of beer on the wall.\n"
    when 1 then "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 0 then "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end
