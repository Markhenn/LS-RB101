# Reversed Arrays (Part 1)

# Problem:
# input: array
# output: array
# Method reverses elements in array
# original array is mutated
# the mutated array is returned
# dont use prebuild methods
# empty input returns empty

# How to do that
# shift the item before last into a temp
# append that temp
# stop when a counter is length of array

# Data structure / algorithm
# set counter = 0
# loop
#   break if counter is length of array
#   delete element before last to temp
#   append temp to array
#   counter +1
# return array

def reverse!(list)
  list2 = []
  loop do
    break if list.empty?

    element = list.pop
    list2 << element
  end
  list.replace(list2)
end


list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id
puts
list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]
puts
list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]
puts
list = []
p reverse!(list) == []
p list == []

# LS solution

def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end