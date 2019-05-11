# Combine Two Lists

# Problem:
# input: 2 arrays
# output: array
# combine elements from each array alternating
# non empty arrays and same amount of elements

# How to solve it?
# use a counter and push to new array on after the other

# Data structure / algorithm
# SET counter
# SET new_array
# loop
#   break if array 1 is at the end
#   push arr1[counter] to new_arr
#   push arr2[counter] to new_arr
#   counter + 1
#  return new_array

def interleave1(ary1, ary2)
  counter = 0
  result_ary = []
  loop do
    break if counter == ary1.size

    result_ary << ary1[counter] << ary2[counter]
    counter += 1
  end
  result_ary
end

def interleave(ary1, ary2)
  ary1.zip(ary2).flatten
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
