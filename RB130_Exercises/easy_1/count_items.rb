=begin
 inputs - array & a block (that will return true or false)
 output - integer - the number of elements in the array for
          which the block returns true

 rules - can't use array or enumerable #count methods

 algorithm
 - initialize count variable, which will track # of elements
 - that yield true block return value
=end