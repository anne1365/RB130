=begin
 PROBLEM: calculate the number of differences between two DNA strands
 (capitalized strings)

  INPUT: string
  OUTPUT: integer (number of differences)

  RULES: 
  - there are no differences between two empty DNA strands - return val 0
  - when two strands of unequal lengths are compared, the number of
    differences will be calculated over the shorter length

  ALGORITHM: 
  - initialize variable mutations to hold the integer count of mutations
  - iterate through each element in each array (the ivar strand and arg strand)
    - if either are nil, stop iterating
    - if they are the same, skip to next iteration
    - if they are different, increment mutations by 1
  - return mutations
=end

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other)

  end
end