# Write a method that takes one argument, a positive integer, and returns the sum of its digits. The tests  should print true.

# For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).

=begin
  Problem: Find the crosstotal of a number without a loop
  input: number
  output: number
  Test case: see below
  Data structure: number, change to array
  Algorithm: 
  turn number into string
  split into array with char
  reduce array into the sum
=end

def sum number
  number.to_s.chars.sum(&:to_i)
end


puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45