require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'assertions'

class AssertionsTest < MiniTest::Test
  def test_paws
    cat = Cat.new
    assert_equal(4, cat.paws)
  end

  def test_paws
    cat = Cat.new
    assert_equal(4, cat.paws)
  end
  
  def test_cat_exists
    cat = Cat.new
    assert(cat)
  end

  def test_name_is_nil
	  cat = Cat.new
	  assert_nil(cat.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      cat = Cat.new(name: "Sherlock")
    end
  end

  def test_instance_of_cat
    cat = Cat.new
    assert_instance_of(Cat, cat)
  end

  def test_includes_cat
    cat = Cat.new
    arr = [1, 2, 3]
    arr << cat
  
    assert_includes(arr, cat)
  end
end 