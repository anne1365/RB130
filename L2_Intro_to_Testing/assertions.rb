class Cat
	attr_accessor :name, :paws

  def initialize
    @paws = 4
  end

  def ==(other)
    paws == other.paws
  end
end