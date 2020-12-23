class BufferEmptyException < StandardError; end

class CircularBuffer
  def initialize(size)
    @size = size
    @buffer = Array.new(size)
  end

  def write(el)

  end

  def write!(el)

  end

  def read

  end
end

buffer = CircularBuffer.new(4)
p buffer