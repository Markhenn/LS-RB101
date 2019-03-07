# Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0. The tests should print true.

=begin
  Problem: add ints based on a boolean
  input: int, boolean
  output: int
  Test case: see below
  Data structure: number, boolean
  Algorithm: 
  if boolean is true 
    return half of number
  else
    return 0
=end

def calculate_bonus(number, bool)
  bool ? number / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000