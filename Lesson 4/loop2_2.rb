# Catch the number

# Problem:
# input: none
# output: print of number
# modify code so that it stops when number is between 0 and 10

# Test Cases: given code

# Data structure and Algorithm
# After puts number
# IF number is between 0 and 10
#   break

loop do
  number = rand(100)
  puts number
  break if number.between?(0, 10)
end
