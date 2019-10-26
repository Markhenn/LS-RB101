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

def digit_list(number)
  string_array = number.to_s.split("")
  string_array.map { |n| n.to_i }
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

# Solution: 
# def digit_list(number)
#  number.to_s.chars.map(&:to_i)
#end

# On `line 20` we define the digit_list method with a parameter called number, which ranges from Line 20 to line 23
# Next we initialize the local variable string_array and assign it the return value of the following method chain. The Interger#to_s is called on the local variable number and the return vallue is passed as an object to the String#split method with a string object with the value of `""` as an arguement the return value is then assign to local variable of `string_array`
# next we call the Array#map method on string array with a single line block as an argument with a parameter `n`. Inside the block on each iteration the return value of the block is the return value of calling the String#to_i method on the local variable n.

# The method returns an array of single digits. 

# This is an example of chaning the object from integer to string access indivdual digits in an integer