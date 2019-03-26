# Squaring an Argument 

=begin
Problem: Write a method that squares the argument
input: int
output: int sqaured
test cases:
puts square(5) == 25
puts square(-8) == 64
data structure:
input: int
output int
Algorithm
return number * number
=end

def multiply(int1, int2)
  int1 * int2
end

def square(number)
  multiply(number, number)
end

def power_to_n(number, n)
  result = number
  (n-1).times {|n| result = multiply(result, number)}
  result
end


puts power_to_n(5, 2) == 25
puts power_to_n(3, 3) == 27
puts power_to_n(3, 4) == 27 * 3
