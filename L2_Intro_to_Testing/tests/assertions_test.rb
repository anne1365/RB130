system 'cls'

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative '../assertions'


class AssertionsTest < MiniTest::Test
  def setup
    @cat = Cat.new
    @catto = Cat.new
  end

  def test_cat_exists
    assert(@cat)
  end

  def test_includes_cat
    arr = [1, 2, 3]
    arr << @cat
  
    assert_includes(arr, @cat)
  end

  def test_instance_of_cat
    cat = Cat.new
    assert_instance_of(Cat, @cat)
  end

  def test_name_is_nil
	  assert_nil(@cat.name)
  end

  def test_paws
    assert_equal(4, @cat.paws)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      cat = Cat.new(name: "Sherlock")
    end
  end  

  def test_paws_equal_4
    assert(@cat.paws == 4, "Objects of the cat class don't have 3 paws.")
  end
  
  def test_two_cats_same
    assert_equal(@cat, @catto)
  end
end 