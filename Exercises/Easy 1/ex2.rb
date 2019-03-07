# Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value. Keep in mind that you're not allowed to use #odd? or #even? in your solution.

=begin
  Problem: Write a method that returns true if the absolut input is odd, or false if even
  input: int -> positive, negative, or zero
  output: true or false
  Test case: see below
  Data structure: 
  input: integer
  output: boolean
  Algorithm: 
  if abs number is odd -> return true
    how to check for odd -> number % 2 == 1
  else -> return false
=end

def is_odd? number
  number % 2 == 1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

=begin
  
exploration:
def is_odd? number
  number.abs % 2 == 1
end

the above makes sure, that we use the absolute of the integer to make sure it works when unsure about modulus or remainder

def is_odd? number
  number.abs.remainder(2) == 1
end
  
=end