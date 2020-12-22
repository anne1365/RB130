=begin
PROBLEM: convert a decimal number into a binary number, and use that
  
  INPUT:
  OUTPUT:
  
  QUESTIONS:
  
  RULES:

DATA STRUCTURE: convert number to array using #digits (will also reverse it)

ALGO:
  DECIMAL -> BINARY (HELPER METHOD):
  SIGNATURE: decimal_to_binary(num)
  - Initialize new string to hold binary number
  - Highest power relevant to this is 2**4
  - from 4 down to 0, check if num - 2**index > 0
    - if so, append '1' to binary string; otherwise, '0'
    - subtract 2**idx from num
  - method produces 5-char binary number string (preserving leading 0's),
    which will be decoded by commands method

  COMMANDS METHOD:
  SIGNATURE: commands
  - initialize new array commands (to hold commands)
  - initialize new string `handshake` - hold return value of passing @num to
    helper method, reversed
  - iterate through each character in handshake with index
    - if character == '1', push COMMANDS[index] to commands array
    - if the last character == '1', reverse the array
  - return commands array
=end

class SecretHandshake
  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump']

  def initialize(num)
    @num = num
  end
  
  def commands
    commands = []
    handshake = decimal_to_binary(@num).chars.reverse
    reverse = handshake.pop == '1' ? true : false
    
    handshake.each_with_index do |el, i|
      commands << COMMANDS[i] if el == '1'
    end

    reverse == true ? commands.reverse : commands
  end

  private

  def decimal_to_binary(num)
    binary = ''
    num = @num.to_i

    4.downto(0) do |idx|
      binary << ((num - 2 ** idx >= 0) ? ('1') : ('0'))
      (num -= 2 ** idx) if (num - 2 ** idx >= 0)
    end
    
    binary
  end
end
