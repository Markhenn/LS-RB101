# Do arithmetics with 2 integer

=begin
Problem: take two integers and do the following arithmetics: 
  addition, subtraction, product, quotient, remainder, and power
input: integer
output: display
Test Cases:
none
Data Structure:
input: integer, integer
Algorithm:
GET int1 from user
GET int2 from user
puts each arithmetic
=end

puts '==> Enter the first number:'
int1 = gets.chomp.to_i
puts '==> Enter the second number:'
int2 = gets.chomp.to_i

puts "==> #{int1} + #{int2} = #{int1 + int2}"
puts "==> #{int1} - #{int2} = #{int1 - int2}"
puts "==> #{int1} * #{int2} = #{int1 * int2}"
puts "==> #{int1} / #{int2} = #{int1 / int2}"
puts "==> #{int1} % #{int2} = #{int1 % int2}"
puts "==> #{int1} ** #{int2} = #{int1 ** int2}"
