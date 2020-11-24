require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

# ASSERT-STYLE SYNTAX
# class CarTest < MiniTest::Test
#   def test_wheels
#     car = Car.new
#     assert_equal(4, car.wheels)
#   end


#   def test_bad_wheels
#     car = Car.new
#     assert_equal(4, car.wheels)
#   end
# end


# SPEC-STYLE SYNTAX
describe 'Car#wheels' do
  it 'has 4 wheels' do
    car = Car.new
    car.wheels.must_equal 4 # this is the expectation
  end
end