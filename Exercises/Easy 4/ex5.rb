# Multiples of 3 and 5

=begin
Problem: Write a method that sums all multiples of 3 and 5
for all numbers between a user given number
input: int
output: int

sum = 0
counter = number / 3
while counter > 0
  sum += 3 * counter
  counter -= 1
end

test cases: 
see below
data structure
input: int
output: int
algorithm:
DEF summing method
sum_of_5 = summing(5, number)
sum_of_3 = summing(3, number)
sum_of_5 + sum_of_3

=end

def multisum(number)
  (0..number).reduce { |sum, n| n % 5 == 0 || n % 3 == 0 ? sum + n : sum }
end



puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
puts multisum(20) == 98
