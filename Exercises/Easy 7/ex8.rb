# Multiply Lists

# Problem
# Input: 2 arrays of numbers
# Output: array of the products
# both arrays have the same length
# multiply the values at each index
# put them into a new array

# How to do that?
#   use a basic loop with counter

# Data structure / algorithm
# SET counter
# SET result
# loop
# break if counter is size ary1
#   result << ary1 at counter * ary2 at counter
#   counter+1
# result

def multiply_list1(ary1, ary2)
  counter = 0
  result = []
  loop do
    break if counter >= ary1.size

    result << ary1[counter] * ary2[counter]
    counter += 1
  end
  result
end

def multiply_list(ary1, ary2)
  ary1.zip(ary2).map { |ary| ary.reduce(:*) }
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
