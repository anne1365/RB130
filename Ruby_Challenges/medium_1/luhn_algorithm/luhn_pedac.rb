=begin
 PROBLEM: write a program that can verify whether a # is valid per the luhn algorithm, produce the checksum or remainder
 produced by processing a # with the luhn algorithm, and return a valid # when provided an invalid luhn # (by adding
 whathever # makes the inout valid to end of #)
  
   INPUT:  number
   OUTPUT: #valid?      -> boolean true or false
           #checksum    -> int
           #remainder   -> int
           #make_valid  -> number string
  
   QUESTIONS:
   - What's the Luhn Algorithm? checksum formula for number (i.e. ID number) verification
   - How does it work?
      - Count from rightmost digit - double every second digit
        - if doubled digit > 10, subtract 9 from it
      - add all the digits after the prior modification
      - if the total (checksum) ends in 0 (%10 == 0) it's valid
  
   RULES:
   Need 3 methods:
   - a validator to tell user whether # is luhn valid
   - a method that returns the remainder or checksum from using luhn validator
   - a method that can make an invalid luhn # valid by adding 10-remainder

 EXAMPLES: test file

 DATA STRUCTURE: will use array if digits after converting input # string to intger

 ALGO:
 - in initialize, `num` for arg, initialize `num_str` for `create` method

 - #valid? -> boolean
   - remainder == 0? yes -> valid

 - #checksum
    - initialize var `checksum` to 0
    - iterate through each digit in `num` with index
     - next unless index is odd
       - increment `checksum` by (is the digit * 2 > 10? subtract 9; else add 2 * digit)
    - RETURN `checksum`

 - #remainder
   - RETURN checksum % 10
    
 - ::create
   create new instance of Luhn using arg passed in with appended 0
   find checksum and remainder 
   if remainder is 0, append 0 to number and return, otherwise return 10-remainder appended to number
=end
