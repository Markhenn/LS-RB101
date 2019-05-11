# Multiplicative Average

# Problem:
# Input: array of integers
# output: print to console (nil)
# take the mulitplicative average of the numbers in the array
#   mulitply all numbers than divide by number count
# no empty array
# print rounded to 3 decimal places

# How to do it?
#   reduce ->  divide ary.size -> round to 3 places -> print

def show_multiplicative_average(numbers)
  multiplicated = numbers.reduce(:*)
  puts format("The result is %0.3f", multiplicated.to_f / numbers.size)
end

show_multiplicative_average([3, 5])
# The result is 7.500

show_multiplicative_average([6])
# The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667
