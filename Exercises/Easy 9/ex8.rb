# Sequence Count

# Problem
# input: a count as int and a number
# output: an array of numbers
# each element of the array is the second number
# multiplied with the count
# the length is given by the count

# Data structure / Algorithm
# set array
# 1 upto count
#   push to array second number times count

def sequence(count, number)
  (1..count).map { |idx| idx * number }
end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []
