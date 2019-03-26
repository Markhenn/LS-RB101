# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

=begin
Problem: print only odd numbers
input: range
output: print
Examples Test cases:
all odd numbers from 1 to 99 printed
Algorithm
Create range
each item
  if odd puts item
=end

(1..99).step(2) {|n| puts n}

number = 1
while number <= 99
  puts number if number.odd?
  number += 1
end
