# Reversed Arrays (Part 2)

# Problem:
# input: array
# output: array
# Method reverses elements in array
# original array is not mutated
# the array is returned
# dont use prebuild methods or last exercise
# empty input returns empty

# Data structure / algorithm
# loop through the original list
#   prepend the each new item to new list
# return new list

def reverse2(list)
  list.each_with_object([]) { |element, list2| list2.prepend(element) }
end

def reverse(list)
  list.reduce([]) { |list2, element| list2.prepend(element)}
end

puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
p list
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true

# LS Solution

def reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end
