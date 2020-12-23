class CircularBuffer
  def initialize(max_buffer_size)
    @max_buffer_size = max_buffer_size
    @buffer = []
  end

  def write(obj)
    raise BufferFullException if buffer_full?
    @buffer << obj unless obj.nil?
  end

  def write!(obj)
    read if buffer_full? unless obj.nil?
    @buffer << obj unless obj.nil?
  end

  def read
    raise BufferEmptyException if @buffer.empty?
    @buffer.shift
  end

  def clear
    @buffer.clear
  end

  private

  def buffer_full?
    @buffer.size == @max_buffer_size
  end

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end
