# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

=begin
  Problem: Split an integer into each single digit and store it into an array
  input: int
  output: array of single digits
  
  Test case: see below
  Data structure: int, array string, string
  input: int number
  turn into string
  output: array 
  Algorithm: 
  turn number into string
  split each digit in the string and store in a array
  loop over array and turn string to int
  
=end

def digit_list number
  string_array = number.to_s.split("")
  string_array.map {|n| n.to_i}
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

# Solution: 
# def digit_list(number)
#  number.to_s.chars.map(&:to_i)
#end