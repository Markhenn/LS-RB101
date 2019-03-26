# Print all even numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

=begin
Problem: print only even numbers
input: range
output: print
Examples Test cases:
all odd numbers from 1 to 99 printed
Algorithm
Create range
each item
  if odd puts item
=end

(2..99).step(2) { |n| puts n }

number = 1
while number <= 99
  puts number if number.even?
  number += 1
end

99.times { |n| puts n if n.even? }
