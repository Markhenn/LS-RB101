# Halvsies

# Problem:
# input: array
# output: 2 arrays
# method that splits 1 array into 2 arrays
# first array contains first half of elements
# second array contains second half
# when odd elements, add to first array
# empty array returns empty arrays

# Data structure / algorithm
# SET ary1
# SET ary2
# shift from ary to ary1
# pop from ary to ary2
# return [ary1, ary2]

def halvsies(array)
  first_half = array.slice(0, (array.size / 2.0).ceil)
  second_half = array.slice(first_half.size, array.size - first_half.size)
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4])
puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3])
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
