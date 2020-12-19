require 'minitest/autorun'
require_relative 'odd_words'

class OddWordsTests < MiniTest::Test
  def test_provided_example
    assert_equal('whats eht matter htiw kansas.', OddWords.parse("what's the matter with kansas"))
  end

  def test_standard_statement
    assert_equal("my stac name si sherlock.", OddWords.parse("my cat's name is sherlock"))
  end

  def test_extra_spaces_before_period
    assert_equal("nice.", OddWords.parse("nice       ."))
  end

  def test_extra_spaces_between_words
    assert_equal("hello sdneirf.", OddWords.parse("hello   friends"))
  end

  def test_empty_string
    assert_equal('', OddWords.parse(''))
  end

  def test_single_period
    assert_equal('.', OddWords.parse('.'))
  end
end