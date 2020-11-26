# SPEC-STYLE SYNTAX
describe 'Car#wheels' do
  it 'has 4 wheels' do
    car = Car.new
    car.wheels.must_equal 4 # this is the expectation
  end
end