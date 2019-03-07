# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. The tests should print true.


=begin
  Problem: get the avg of ints from an array
  input: array of ints
  output: number
  Test case: see below
  Data structure: 
  input: array
  output number
  Algorithm: 
  loop over array with reduce to sum up
  devide but ary size
  return that
=end

def average ary
  ary.reduce { |sum, n| sum + n } / ary.size.to_f
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

=begin
further Exploration
def average ary
  ary.reduce(:+).to_f / ary.size
end
=end