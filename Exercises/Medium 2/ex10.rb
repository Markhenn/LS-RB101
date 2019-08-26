# Sum Square - Square Sum

# Problem
# calculate the difference between the two sums
# input: int
# output: int

# claculate each sume then take difference

# Data Structure / Algorithm
# sum squared
# range until 3 from 1
#   reduce with sum
# sqaure the result

# squares summed
# reduce by summing the squares

def sum_square_difference(number)
  sum_squared(number) - squared_sum(number)
end

def sum_squared(n)
  sum = (1..n).reduce(:+)
  sum**2
end

def squared_sum(n)
  (1..n).reduce { |square, num| square + num**2 }
end

p sum_square_difference(3) == 22
# -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
